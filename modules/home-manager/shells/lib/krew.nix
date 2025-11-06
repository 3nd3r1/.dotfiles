{ pkgs, ... }:

{
  home.packages = with pkgs; [ krew ];

  home.sessionPath = [
    "$HOME/.krew/bin"
  ];
}
