{
  programs.nixvim.plugins.harpoon.enable = true;

  programs.nixvim.plugins.which-key = {
    settings = {
      spec = [{
        __unkeyed-1 = "<leader>h";
        group = "Harpoon";
      }];
    };
  };

  programs.nixvim.keymaps = [
    # Add file to harpoon
    {
      mode = "n";
      key = "<leader>ha";
      action.__raw = ''
        function()
          require("harpoon.mark").add_file()
        end
      '';
      options = { desc = "Add file to harpoon"; };
    }

    # Open harpoon menu
    {
      mode = "n";
      key = "<leader>he";
      action.__raw = ''
        function()
          require("harpoon.ui").toggle_quick_menu()
        end
      '';
      options = { desc = "Open harpoon menu"; };
    }

    # Navigate to file 1
    {
      mode = "n";
      key = "<leader>h1";
      action.__raw = ''
        function()
          require("harpoon.ui").nav_file(1)
        end
      '';
      options = { desc = "Navigate to file 1 in harpoon"; };
    }

    # Navigate to file 2
    {
      mode = "n";
      key = "<leader>h2";
      action.__raw = ''
        function()
          require("harpoon.ui").nav_file(2)
        end
      '';
      options = { desc = "Navigate to file 2 in harpoon"; };
    }

    # Navigate to file 3
    {
      mode = "n";
      key = "<leader>h3";
      action.__raw = ''
        function()
          require("harpoon.ui").nav_file(3)
        end
      '';
      options = { desc = "Navigate to file 3 in harpoon"; };
    }

    # Navigate to file 4
    {
      mode = "n";
      key = "<leader>h4";
      action.__raw = ''
        function()
          require("harpoon.ui").nav_file(4)
        end
      '';
      options = { desc = "Navigate to file 4 in harpoon"; };
    }
  ];
}
