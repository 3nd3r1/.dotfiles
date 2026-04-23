{ ... }:
{
  programs.nixvim.plugins.treesitter = {
    enable = true;
    highlight = {
      enable = true;
      additional_vim_regex_highlighting = false;
    };
  };
}
