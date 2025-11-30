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
    ];
  };
}
