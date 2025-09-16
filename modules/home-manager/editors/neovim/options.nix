{
  programs.nixvim = {
    clipboard.register = "unnamedplus";

    opts = {
      number = true;
      relativenumber = true;
      shiftwidth = 4;
      tabstop = 4;
      expandtab = true;
      undofile = true;
      signcolumn = "yes";
    };
  };
}
