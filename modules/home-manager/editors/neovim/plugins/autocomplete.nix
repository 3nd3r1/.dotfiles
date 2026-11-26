{
  programs.nixvim.plugins.blink-cmp = {
    enable = true;
    settings = {
      keymap = {
        preset = "none";
        "<Tab>" = [
          "accept"
          "fallback"
        ];
        "<C-c>" = [
          "show"
          "show_documentation"
          "hide_documentation"
        ];
        "<C-k>" = [
          "select_prev"
          "fallback"
        ];
        "<C-j>" = [
          "select_next"
          "fallback"
        ];
      };
      completion = {
        documentation.auto_show = true;
      };
      sources.default = [
        "lsp"
        "path"
        "buffer"
      ];
    };
  };
}
