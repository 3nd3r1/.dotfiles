{
  programs.nixvim.plugins.copilot-vim.enable = true;

  programs.nixvim.globals = {
    portal_url = "https://codingbuddy.onprem.gic.ericsson.se";
    api_url = "https://codingbuddy.onprem.gic.ericsson.se/_route/api_server";

    copilot_no_tab_map = true;
    codeium_disable_bindings = 1;

    copilot_enabled = 1;
    codeium_enabled = 0;
  };
 
  programs.nixvim.keymaps = [
    {
      mode = "i";
      key = "<C-Space>";
      action.__raw = ''
        function()
          if vim.g.codeium_enabled == 0 then
            return vim.fn["copilot#Accept"]()
          else
            return vim.fn["codeium#Accept"]()
          end
        end
      '';
      options = {
        expr = true;
        replace_keycodes = false;
        desc = "Accept Codebuddy completion";
      };
    }
    {
      mode = "n";
      key = "<leader>cc";
      action.__raw = ''
        function()
          vim.fn["codeium#Chat"]()
        end
      '';
      options = {
        silent = true;
        desc = "Chat with Codeium";
      };
    }
    {
      mode = "n";
      key = "<leader>c1";
      action.__raw = ''
        function()
          vim.g.copilot_enabled = not vim.g.copilot_enabled
          if vim.g.copilot_enabled then
            vim.g.codeium_enabled = 0
          end
        end
      '';
      options = {
        silent = true;
        desc = "Toggle Copilot";
      };
    }
    {
      mode = "n";
      key = "<leader>c2";
      action.__raw = ''
        function()
          vim.g.codeium_enabled = not vim.g.codeium_enabled
          if vim.g.codeium_enabled then
            vim.g.copilot_enabled = 0
          end
        end
      '';
      options = {
        silent = true;
        desc = "Toggle Codeium";
      };
    }
  ];
}
