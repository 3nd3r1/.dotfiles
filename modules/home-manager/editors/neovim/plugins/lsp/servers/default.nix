{ lib, ... }:
{
  imports =
    lib.filesystem.listFilesRecursive ./.
    |> builtins.filter (path: lib.hasSuffix ".nix" path && baseNameOf path != "default.nix");
}
