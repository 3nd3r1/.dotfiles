{ lib, ... }:
{
  programs.nixvim.plugins.harpoon = {
    enable = true;
    autoLoad = true;
  };

  programs.nixvim.plugins.which-key = {
    settings = {
      spec = [
        {
          __unkeyed-1 = "<leader>h";
          group = "Harpoon";
        }
      ];
    };
  };

  programs.nixvim.keymaps = [
    # Add file to harpoon
    {
      mode = "n";
      key = "<leader>ha";
      action.__raw = ''
        function()
          require("harpoon"):list():add()
        end
      '';
      options = {
        desc = "Add file to harpoon";
      };
    }

    # Open harpoon menu
    {
      mode = "n";
      key = "<leader>he";
      action.__raw = ''
        function()
          local harpoon = require("harpoon")
          harpoon.ui:toggle_quick_menu(harpoon:list())
        end
      '';
      options = {
        desc = "Open harpoon menu";
      };
    }
  ]
  ++ (lib.genList (i: {
    mode = "n";
    key = "<leader>h${toString (i + 1)}";
    action.__raw = ''
      function()
        require("harpoon"):list():select(${toString (i + 1)})
      end
    '';
    options = {
      desc = "Go to harpoon file ${toString (i + 1)}";
    };
  }) 8);
}
