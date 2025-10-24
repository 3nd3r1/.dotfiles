{ pkgs, ... }:
{
  # Add Amazon Q as an external vim plugin
  programs.nixvim.extraPlugins = [
    (pkgs.vimUtils.buildVimPlugin {
      name = "amazonq";
      src = pkgs.fetchFromGitHub {
        owner = "awslabs";
        repo = "amazonq.nvim";
        rev = "main";
        sha256 = "sha256-AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA="; # Replace with actual hash
      };
    })
  ];

  # Configure Amazon Q
  programs.nixvim.extraConfigLua = ''
    -- Amazon Q setup
    require("amazonq").setup({
      -- Required: SSO portal URL for authentication
      ssoStartUrl = "https://d-9367077c28.awsapps.com/start",  -- Free Tier with AWS Builder ID

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
          local current = require('amazonq').config.inline_suggest
          require('amazonq').config.inline_suggest = not current
          print("Amazon Q inline suggestions " .. (not current and "enabled" or "disabled"))
        end
      '';
      options = {
        silent = true;
        desc = "Toggle Amazon Q inline suggestions";
      };
    }
  ];
}
