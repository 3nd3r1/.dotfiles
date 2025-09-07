{
  programs.nixvim.globals.mapleader = " ";
  programs.nixvim.keymaps = [
    {
      mode = "n";
      key = "<C-d>";
      action = "<C-d>zz";
      options = {
        desc = "Go one page down";
        remap = true;
      };
    }
    {
      mode = "n";
      key = "<C-u>";
      action = "<C-u>zz";
      options = {
        desc = "Go one page up";
        remap = true;
      };
    }
  ];
}
