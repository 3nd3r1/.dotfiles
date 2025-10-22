{ inputs, ... }:
{
  xdg.configFile."qtile" = {
    source = "${inputs.self}/config/qtile";
    recursive = true;
  };
}
