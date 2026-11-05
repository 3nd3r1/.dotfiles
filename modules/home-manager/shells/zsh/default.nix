{
  settings,
  config,
  pkgs,
  lib,
  inputs,
  ...
}:
let
  profileModules = {
    graff = [
      ../lib/apollo-cli.nix
      ../lib/krew.nix
    ];
  };

  aliases = {
    vi = "nvim";
    vim = "nvim";
    oldvim = "vim";
    neofetch = "fastfetch";
  }
  // lib.optionalAttrs pkgs.stdenv.hostPlatform.isLinux { wssh = "waypipe ssh"; };
in
{
  imports = [
    ../lib/tmux
    ../lib/zoxide.nix
    ../lib/fd.nix
    ../lib/fzf.nix
    ../lib/direnv.nix
    ../lib/yazi.nix
  ]
  ++ (profileModules.${settings.profile} or [ ]);

  home.shell.enableZshIntegration = true;

  # Move the custom directory
  xdg.configFile."oh-my-zsh" = {
    source = "${inputs.self}/config/oh-my-zsh";
    recursive = true;
  };

  programs.tmux.shell =
    if pkgs.stdenv.hostPlatform.isLinux then "${pkgs.zsh}/bin/zsh" else "/bin/zsh";

  home.sessionPath = [
    "$HOME/.local/bin"
  ];

  programs.zsh = {
    enable = true;
    syntaxHighlighting.enable = true;
    autosuggestion.enable = true;
    enableCompletion = true;
    shellAliases = aliases;
    initContent = ''
      bindkey -M viins '^ ' autosuggest-accept
      bindkey -M viins '^C' send-break

      [ -f "$HOME/.env" ] && source "$HOME/.env"
    '';
    oh-my-zsh = {
      enable = true;
      theme = "pain";
      custom = "${config.home.homeDirectory}/.config/oh-my-zsh/custom";
      plugins = [
        "git"
        "nvm"
        "zoxide"
        "tmux"
        "vi-mode"
        "helm"
        "kubectl"
        "docker"
        "fzf"
        "golang"
        "gcloud"
        "poetry"
        "virtualenv"
        "rust"
        "deno"
      ];
      extraConfig = ''
        autoload -U colors && colors

        zstyle ':completion:*' menu select
        zmodload zsh/complist
        bindkey -M menuselect 'h' vi-backward-char
        bindkey -M menuselect 'k' vi-up-line-or-history
        bindkey -M menuselect 'l' vi-forward-char
        bindkey -M menuselect 'j' vi-down-line-or-history

        # Tmux
        ZSH_TMUX_AUTOSTART=true
        ZSH_TMUX_AUTOSTART_ONCE=false
        ZSH_TMUX_AUTOQUIT=true
        ZSH_TMUX_CONFIG="${config.home.homeDirectory}/.config/tmux/tmux.conf"
        ZSH_TMUX_DEFAULT_SESSION_NAME="terminal"

        # Fzf settings
        DISABLE_FZF_AUTO_COMPLETION="true"
        DISABLE_FZF_KEY_BINDINGS="false"
        FZF_CTRL_T_COMMAND='find -L . -mindepth 1'
        FZF_ALT_C_COMMAND='find -L . -type d -mindepth 1'

        fpath=($ZSH_CUSTOM/completions $fpath)
      '';
    };
  };
}
