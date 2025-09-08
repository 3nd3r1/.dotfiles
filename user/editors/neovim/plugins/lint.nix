{
  programs.nixvim.plugins = {
    lint = {
      enable = true;
      lintersByFt = {
        python = [ "pylint" ];
        yaml = [ "yamllint" ];
      };
    };
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
