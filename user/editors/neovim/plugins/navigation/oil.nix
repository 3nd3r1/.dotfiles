{
  programs.nixvim.plugins.oil = {
    enable = true;
    settings = { view_options = { show_hidden = true; }; };
  };

  programs.nixvim.keymaps = [
    {
      key = "<leader>pv";
      action = "<cmd>Oil<CR>";
      options = { desc = "Open Oil"; };
    }

    {
      key = "<leader>pcd";
      action.__raw = ''
        function()
        	local oil = require("oil")
        	local cwd = oil.get_current_dir()
        	if cwd == nil then
        		print("Oil not open")
        		return
        	end
        	vim.cmd.cd(cwd)
        	print("Changed cwd to: " .. cwd)
        end,
      '';
      options = { desc = "Change cwd"; };
    }
  ];
}
