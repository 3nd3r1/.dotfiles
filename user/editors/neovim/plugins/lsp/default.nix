{
  imports = [ ./servers ];
  programs.nixvim.plugins = {
    lsp = {
      enable = true;
      capabilities.__raw = ''
        (function()
          local capabilities = require('cmp_nvim_lsp').default_capabilities()
          capabilities.textDocument.semanticTokens = nil
          return capabilities
        end)()
      '';
      keymaps = [
        {
          key = "<leader>K";
          lspBufAction = "hover";
        }
        {
          key = "<leader>ld";
          lspBufAction = "definition";
        }
        {
          key = "<leader>lD";
          lspBufAction = "declaration";
        }
        {
          key = "<leader>li";
          lspBufAction = "implementation";
        }
        {
          key = "<leader>lo";
          lspBufAction = "type_definition";
        }
        {
          key = "<leader>lr";
          lspBufAction = "references";
        }
        {
          key = "<leader>ls";
          lspBufAction = "signature_help";
        }
        {
          key = "<leader><F2>";
          lspBufAction = "rename";
        }
        {
          key = "<leader><F4>";
          lspBufAction = "code_action";
        }
        {
          key = "<leader>lx";
          action = "<cmd>Trouble diagnostics toggle<cr>";
        }
      ];
    };

    trouble = {
      enable = true;
      settings = {
        keys = {
          "<leader>lx" = { action = "<cmd>Trouble diagnostics toggle<cr>"; };
        };
      };
    };

    mason = { enable = true; };
    mason-lspconfig = {
      enable = true;
      settings = {
        ensure_installed = [
          "lua_ls"
          "pyright"
          "ts_ls"
          "html"
          "yamlls"
          "helm_ls"
          "bashls"
          "gopls"
        ];
      };
    };
    vim-helm.enable = true;
  };
}
