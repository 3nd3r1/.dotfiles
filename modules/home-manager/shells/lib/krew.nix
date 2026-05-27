{ pkgs, ... }:

{
  home.packages = with pkgs; [ krew ];

  programs.zsh.initContent = ''
    export PATH="$HOME/.krew/bin:$PATH"
  '';
}
