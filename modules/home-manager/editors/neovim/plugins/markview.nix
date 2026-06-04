{
  programs.nixvim = {
    plugins.markview = {
      enable = true;
      settings = {
        preview.enable = false;
      };
    };

    keymaps = [
      {
        mode = "n";
        key = "<leader>mv";
        action = "<cmd>Markview toggle<cr>";
        options = {
          desc = "Toggle Markview";
          silent = true;
        };
      }
      {
        mode = "n";
        key = "<leader>mc";
        action = "<cmd>Markview splitToggle<cr>";
        options = {
          desc = "Toggle Markview split (side-by-side)";
          silent = true;
        };
      }
    ];
  };
}
