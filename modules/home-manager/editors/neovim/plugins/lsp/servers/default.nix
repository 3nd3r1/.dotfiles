{ lib, ... }:
{
  imports = builtins.filter (path: lib.hasSuffix ".nix" path && baseNameOf path != "default.nix") (
    lib.filesystem.listFilesRecursive ./.
  );
}
