{
  imports = [ ./servers ];
  programs.nixvim.plugins = {
    lsp = {
      enable = true;
      onAttach = ''
        if client then
          client.server_capabilities.semanticTokensProvider = nil
        end
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
