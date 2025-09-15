{ inputs, ... }:
final: prev: {
  material-black-plum-suru-icons = final.callPackage ../pkgs/material-black-plum-suru-icons { };
  material-black-plum-be-colors = final.callPackage ../pkgs/material-black-plum-be-colors { };
}
