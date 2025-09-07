{
  programs.nixvim.plugins = {
    lint = {
      enable = true;
      lintersByFt = {
        python = [ "pylint" ];
        yaml = [ "yamllint" ];
      };
    };
    mason-nvim-lint.enable = true;
  };

  programs.nixvim.autoCmd = [{
    event = [ "BufWritePost" ];
    callback.__raw = ''
      function()
        require("lint").try_lint()
      end
    '';
  }];
}
