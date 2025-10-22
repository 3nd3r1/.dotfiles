{
  programs.nixvim.plugins.telescope = {
    enable = true;
    extensions = {
      fzf-native = {
        enable = true;
      };
      ui-select = {
        settings = {
          specific_opts = {
            codeactions = true;
          };
        };
      };
      undo = {
        enable = true;
      };
    };
    keymaps = {
      "<leader>pf" = {
        action = "find_files";
        options.desc = "Find project files";
      };
      "<leader>ps" = {
        action = "live_grep";
        options.desc = "Grep (root dir)";
      };
      "<leader>pb" = {
        action = "buffers";
        options.desc = "+buffer";
      };
    };
  };
}
