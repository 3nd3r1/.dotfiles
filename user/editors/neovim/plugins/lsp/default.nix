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
      keymaps = {
        lspBuf = {
          "<leader>K" = "hover";
          "<leader>ld" = "definition";
          "<leader>lD" = "declaration";
          "<leader>li" = "implementation";
          "<leader>lo" = "type_definition";
          "<leader>lr" = "references";
          "<leader>ls" = "signature_help";
          "<leader><F2>" = "rename";
          "<leader><F4>" = "code_action";
        };
      };
    };

    trouble = {
      enable = true;
      settings = {
        keys = {
          "<leader>lx" = { action = "<cmd>Trouble diagnostics toggle<cr>"; };
        };
      };
    };

    helm.enable = true;
  };
}
