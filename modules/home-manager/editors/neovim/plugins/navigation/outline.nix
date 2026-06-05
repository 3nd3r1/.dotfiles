{
  programs.nixvim.plugins.aerial = {
    enable = true;
    settings = {
      backends = [
        "treesitter"
        "lsp"
        "markdown"
        "man"
      ];
      layout = {
        default_direction = "right";
        min_width = 30;
        max_width = [
          0.25
          50
        ];
      };
      filter_kind = false;
      show_guides = true;
    };
  };

  programs.nixvim.keymaps = [
    {
      mode = "n";
      key = "<leader>mo";
      action = "<cmd>AerialToggle!<CR>";
      options = {
        desc = "Toggle outline sidebar";
        silent = true;
      };
    }
  ];
}
