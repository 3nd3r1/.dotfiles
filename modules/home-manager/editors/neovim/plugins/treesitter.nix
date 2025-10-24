{
  programs.nixvim.plugins.treesitter = {
    enable = true;
    settings = {
      # A list of parser names, or "all"
      ensure_installed = [
        "typescript"
        "javascript"
        "python"
        "c"
        "lua"
        "vim"
        "vimdoc"
        "query"
        "bash"
        "yaml"
        "go"
        "nix"
      ];

      auto_install = true;

      highlight = {
        enable = true;
        additional_vim_regex_highlighting = false;
      };
    };
  };
}
