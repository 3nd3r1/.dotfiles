{
  home.sessionPath = [
    "$HOME/adp-cicd/bob"
  ];

  programs.zsh.initContent = ''
    if [ -f "$HOME/adp-cicd/bob/bob-completion.sh" ]; then
      source "$HOME/adp-cicd/bob/bob-completion.sh"
    fi
  '';
}
