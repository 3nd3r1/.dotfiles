{
  lib,
  tmuxPlugins,
  fetchFromGitHub,
  kubectl,
}:

tmuxPlugins.mkTmuxPlugin {
  pluginName = "kube-tmux";
  version = "unstable-master";

  src = fetchFromGitHub {
    owner = "jonmosco";
    repo = "kube-tmux";
    rev = "master";
    sha256 = "sha256-Z71zsEj4nGptaosDPRVFEp8QwSsawPh1qFMSoRnF2nE=";
  };

  rtpFilePath = "kube.tmux";

  postInstall = ''
    # Substitute kubectl path in the actual script
    substituteInPlace $target/scripts/kube-tmux.sh \
      --replace 'KUBE_TMUX_BINARY="''${KUBE_TMUX_BINARY:-kubectl}"' \
                'KUBE_TMUX_BINARY="''${KUBE_TMUX_BINARY:-${kubectl}/bin/kubectl}"'
  '';

  meta = with lib; {
    description = "Tmux plugin to display Kubernetes context";
    homepage = "https://github.com/jonmosco/kube-tmux";
  };
}
