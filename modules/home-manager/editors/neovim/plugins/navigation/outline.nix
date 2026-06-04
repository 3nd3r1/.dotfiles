{
  programs.nixvim.plugins.outline = {
    enable = true;
  };

  programs.nixvim.keymaps = [
    {
      mode = "n";
      key = "<leader>o";
      action = "<cmd>Outline<CR>";
      options = {
        desc = "Toggle outline sidebar";
        silent = true;
      };
    }
  ];
}
