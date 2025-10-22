{ pkgs, ... }:

{
  home.packages = with pkgs; [ krew ];
}
