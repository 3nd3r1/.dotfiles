{ pkgs, ... }:
{
  home.packages = with pkgs; [
    yamllint
  ];

  xdg.configFile."yamllint/config".text = ''
    extends: default

    rules:
      line-length:
        max: 120
        level: warning
      indentation:
        spaces: 2
      document-start: disable
      truthy:
        allowed-values: ['true', 'false', 'yes', 'no']
  '';

  programs.nixvim.plugins = {
    lint = {
      enable = true;
      lintersByFt = {
        yaml = [ "yamllint" ];
        typescript = [ "eslint" ];
        javascript = [ "eslint" ];
        typescriptreact = [ "eslint" ];
        javascriptreact = [ "eslint" ];
      };
    };
  };
}
