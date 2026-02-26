_: final: prev: {
  kiro-cli = prev.kiro-cli.overrideAttrs (oldAttrs: {
    src = oldAttrs.src.overrideAttrs {
      outputHash = "sha256-q5ixEPVXL9VHtCKCpCUIAd426k7HGewpuXDWfB0q06c=";
    };
  });
  material-black-plum-suru-icons = final.callPackage ../pkgs/material-black-plum-suru-icons { };
  material-black-plum-be-colors = final.callPackage ../pkgs/material-black-plum-be-colors { };
  steelfish-outline-regular-font = final.callPackage ../pkgs/steelfish-outline-regular-font { };
  sf-pro-display-font = final.callPackage ../pkgs/sf-pro-display-font { };

  tmuxPlugins = prev.tmuxPlugins // {
    kube-tmux = final.callPackage ../pkgs/kube-tmux { };
  };
}
