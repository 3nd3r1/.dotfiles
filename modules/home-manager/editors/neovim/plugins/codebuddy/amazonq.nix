{ pkgs, ... }: let
  ssoStartUrl = "https://d-9367077c28.awsapps.com/start";
  ssoRegion = "eu-west-1";
in {
  programs.nixvim.withNodeJs = true;

  # Add Amazon Q as an external vim plugin
  programs.nixvim.extraPlugins = [
    (pkgs.vimUtils.buildVimPlugin {
      name = "amazonq";
      src = pkgs.fetchFromGitHub {
        owner = "awslabs";
        repo = "amazonq.nvim";
        rev = "main";
        sha256 = "sha256-EoykpuPlck3JCY1dkkt0SBb7vj9miHVVIGi5UboB7lU="; # Replace with actual hash
      };

      # Apply the region fix after fetching
      postPatch = ''
        if [ -f language-server/build/aws-lsp-codewhisperer-token-binary.js ]; then
          ${pkgs.gnused}/bin/sed -i '
            s/SsoRegion="us-east-1"/SsoRegion="${ssoRegion}"/g;
            s/DEFAULT_AWS_Q_REGION="us-east-1"/DEFAULT_AWS_Q_REGION="${ssoRegion}"/g;
            s#"eu-central-1","https://q.eu-central-1#"${ssoRegion}","https://q.${ssoRegion}#g
          ' language-server/build/aws-lsp-codewhisperer-token-binary.js
        fi
      '';
    })
  ];

  programs.nixvim.globals.amazonq_enabled = true;

  # Configure Amazon Q
  programs.nixvim.extraConfigLua = ''
    -- Amazon Q setup
    require("amazonq").setup({
      -- Required: SSO portal URL for authentication
      ssoStartUrl = "${ssoStartUrl}",

      -- Filetypes where Amazon Q will be activated
      filetypes = {
        "amazonq", "bash", "java", "python", "typescript", "javascript", "csharp",
        "ruby", "kotlin", "sh", "sql", "c", "cpp", "go", "rust", "lua", "nix",
      },

      -- Enable inline code suggestions
      inline_suggest = true,

      -- Configure chat panel appearance
      on_chat_open = function()
        vim.cmd[[
          vertical topleft split
          set wrap breakindent nonumber norelativenumber nolist
        ]]
      end,

      -- Enable debug mode if needed
      debug = false,
    })
  '';

  # Keymaps for Amazon Q
  programs.nixvim.keymaps = [
    {
      mode = "n";
      key = "<leader>cc";
      action = "<cmd>AmazonQ<cr>";
      options = {
        silent = true;
        desc = "Open Amazon Q Chat";
      };
    }
    {
      mode = "v";
      key = "<leader>cs";
      action = ":AmazonQ<cr>";
      options = {
        silent = true;
        desc = "Send selection to Amazon Q";
      };
    }
    {
      mode = "n";
      key = "<leader>ce";
      action = "<cmd>AmazonQ explain<cr>";
      options = {
        silent = true;
        desc = "Amazon Q: Explain current file";
      };
    }
    {
      mode = "n";
      key = "<leader>c1";
      action.__raw = ''
        function()
          vim.g.amazonq_inline_suggest = not vim.g.amazonq_inline_suggest
          
          -- Restart Amazon Q LSP to apply changes
          vim.cmd('LspRestart')
          
          if vim.g.amazonq_inline_suggest then
            print("Amazon Q inline suggestions enabled")
          else
            print("Amazon Q inline suggestions disabled")
          end
        end
      '';
      options = {
        silent = true;
        desc = "Toggle Amazon Q inline suggestions";
      };
    }
  ];
}
