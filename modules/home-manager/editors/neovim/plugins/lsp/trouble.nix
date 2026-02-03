_:
{

  programs.nixvim = {
    plugins.trouble = {
      enable = true;
      autoLoad = true;
    };

    keymaps = [
      {
        mode = "n";
        key = "<leader>xx";
        action = "<cmd>Trouble diagnostics toggle<cr>";
        options = {
          desc = "Diagnostics (Trouble)";
          silent = true;
        };
      }
      {
        mode = "n";
        key = "<leader>xd";
        action.__raw = ''
          function()
            vim.diagnostic.enable(not vim.diagnostic.is_enabled())
          end
        '';
        options = {
          desc = "Toggle Diagnostics";
          silent = true;
          noremap = true;
        };
      }
    ];
  };
}
