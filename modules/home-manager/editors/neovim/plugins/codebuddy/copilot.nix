{
  programs.nixvim.plugins.copilot-vim.enable = true;

  programs.nixvim.keymaps = [
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
  ];
}
