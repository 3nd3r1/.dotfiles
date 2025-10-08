{

  programs.nixvim.plugins.windsurf-vim = {
    enable = true;
    settings = {
      disable_bindings = true;
      no_map_tab = true;
      server_config = {
        portal_url = "https://codingbuddy.onprem.gic.ericsson.se";
        api_url = "https://codingbuddy.onprem.gic.ericsson.se/_route/api_server";
      };
    };
  };

  programs.nixvim.keymaps = [
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
