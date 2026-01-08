{
  programs.nixvim = {
    plugins = {
      fugitive = {
        enable = false;
      };
      gitblame = {
        enable = true;
        settings = {
          enabled = false;
        };
      };
    };

    keymaps = [
      {
        mode = "n";
        key = "<leader>gb";
        action.__raw = ''
          function()
            require("gitblame").toggle()
          end
        '';
        options = {
          desc = "Toggle Git blame";
        };
      }
    ];
  };
}
