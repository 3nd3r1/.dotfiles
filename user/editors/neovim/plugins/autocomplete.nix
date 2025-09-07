{
  programs.nixvim.plugins.cmp = {
    enable = true;
    settings = {
      mapping = {
        # Tab key to confirm completion
        "<Tab>" = "cmp.mapping.confirm({ select = true })";

        # Ctrl+Space to trigger completion menu  
        "<C-c>" = "cmp.mapping.complete()";

        # Navigate between completions
        "<C-k>" =
          "cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.select })";
        "<C-j>" =
          "cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.select })";
      };

      sources = [ { name = "nvim_lsp"; } { name = "buffer"; } ];

      formatting = {
        format.__raw = ''
          require("lspkind").cmp_format({
            mode = "symbol_text",
            preset = "codicons",
            maxwidth = 50,
            ellipsis_char = "...",
          })
        '';
      };
    };
  };

  programs.nixvim.plugins.cmp-nvim-lsp.enable = true;
  programs.nixvim.plugins.cmp-buffer.enable = true;
  programs.nixvim.plugins.luasnip.enable = true;
  programs.nixvim.plugins.lspkind-nvim.enable = true;
}
