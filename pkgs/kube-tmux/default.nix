{
  lib,
  tmuxPlugins,
  fetchFromGitHub,
  kubectl,
  makeWrapper,
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

  nativeBuildInputs = [ makeWrapper ];

  postInstall = ''
    wrapProgram $target/kube.tmux \
      --prefix PATH : ${lib.makeBinPath [ kubectl ]}
  '';

  meta = with lib; {
    description = "Tmux plugin to display Kubernetes context";
    homepage = "https://github.com/jonmosco/kube-tmux";
  };
}
