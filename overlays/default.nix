{ inputs, ... }:
final: prev: {
  material-black-plum-icons = final.callPackage ../pkgs/material-black-plum-icons { };
}
