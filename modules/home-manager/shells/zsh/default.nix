{
  settings,
  config,
  pkgs,
  lib,
  ...
}:
let
  profileModules = {
    graff = [
      ../lib/apollo-cli.nix
    ];
  };

  aliases = {
    vi = "nvim";
    vim = "nvim";
    oldvim = "vim";
    neofetch = "fastfetch";
  };
in
{
  imports = [
    ../lib/tmux
    ../lib/starship.nix
    ../lib/cli.nix
    ../lib/zoxide.nix
    ../lib/fd.nix
    ../lib/fzf.nix
    ../lib/kubectl.nix
    ../lib/direnv.nix
    ../lib/yazi.nix
    ../lib/nix-index.nix
  ]
  ++ (profileModules.${settings.profile} or [ ]);

  home.shell.enableZshIntegration = true;

  programs.tmux.shell =
    if pkgs.stdenv.hostPlatform.isLinux then "${pkgs.zsh}/bin/zsh" else "/bin/zsh";

  home.sessionPath = [
    "$HOME/.local/bin"
  ];

  programs.zsh = {
    enable = true;
    defaultKeymap = "viins";
    syntaxHighlighting.enable = true;
    autosuggestion.enable = true;
    enableCompletion = true;
    shellAliases = aliases;

    history = {
      size = 50000;
      save = 50000;
      share = true;
      ignoreAllDups = true;
    };

    initContent = lib.mkMerge [
      (lib.mkOrder 550 ''
        fpath=("${config.xdg.configHome}/zsh/completions" $fpath)
      '')
      ''
        zstyle ':completion:*' menu select
        zmodload zsh/complist
        bindkey -M menuselect 'h' vi-backward-char
        bindkey -M menuselect 'k' vi-up-line-or-history
        bindkey -M menuselect 'l' vi-forward-char
        bindkey -M menuselect 'j' vi-down-line-or-history

        bindkey -M viins '^ ' autosuggest-accept
        bindkey -M viins '^C' send-break

        [ -f "$HOME/.env" ] && source "$HOME/.env"

        # Lazy-load nvm if installed
        if [ -s "$HOME/.nvm/nvm.sh" ]; then
          export NVM_DIR="$HOME/.nvm"
          _load_nvm() {
            unset -f nvm node npm npx
            source "$NVM_DIR/nvm.sh"
          }
          nvm()  { _load_nvm; nvm "$@"; }
          node() { _load_nvm; node "$@"; }
          npm()  { _load_nvm; npm "$@"; }
          npx()  { _load_nvm; npx "$@"; }
        fi

        # Auto-start tmux on interactive shells
        if [[ -z "$TMUX" && -o interactive && -t 0 && "$TERM" != "dumb" ]] && command -v tmux >/dev/null 2>&1; then
          exec tmux new-session -A -s terminal
        fi
      ''
    ];
  };
}
