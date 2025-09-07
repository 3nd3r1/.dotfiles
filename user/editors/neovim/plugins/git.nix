{
  programs.nixvim.plugins.fugitive = { enable = false; };
  programs.nixvim.plugins.git-blame = { enable = true; };

  programs.nixvim.keymaps = [{
    mode = "n";
    key = "<leader>gb";
    action.__raw = ''
      function()
        require("gitblame").toggle()
      end
    '';
    options = { desc = "Toggle Git blame"; };
  }];
}
