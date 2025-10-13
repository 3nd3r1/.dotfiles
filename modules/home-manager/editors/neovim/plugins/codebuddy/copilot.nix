{
  programs.nixvim.plugins.copilot-vim.enable = true;

  programs.nixvim.keymaps = [
    {
      mode = "i";
      key = "<C-Space>";
      action.__raw = ''
        function()
          return vim.fn["copilot#Accept"]()
        end
      '';
      options = {
        expr = true;
        replace_keycodes = false;
        desc = "Accept Copilot Completion";
      };
    }
    {
      mode = "n";
      key = "<leader>c1";
      action.__raw = ''
        function()
          vim.g.copilot_enabled = not vim.g.copilot_enabled
        end
      '';
      options = {
        silent = true;
        desc = "Toggle Copilot";
      };
    }
  ];
}
