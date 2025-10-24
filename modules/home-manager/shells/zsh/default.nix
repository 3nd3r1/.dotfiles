{
  settings,
  config,
  pkgs,
  inputs,
  ...
}:
let
  profileModules = {
    work = [
      ./scripts/devenv.nix
      ../lib/krew.nix
    ];
    devenv = [
      ./scripts/bob.nix
    ];
  };

  profileAliases = {
    devenv = {
      setcurl014config = "kubectl config set-cluster curl014; export KUBERNETES_CLUSTER=curl014; export KUBERNETES_LOADBALANCER_IP=10.120.57.132";
      setcurl020config = "kubectl config set-cluster curl020; export KUBERNETES_CLUSTER=curl020; export KUBERNETES_LOADBALANCER_IP=10.120.57.236";
      setcurl022config = "kubectl config set-cluster curl022; export KUBERNETES_CLUSTER=curl022; export KUBERNETES_LOADBALANCER_IP=10.63.142.233";
      setkarle002config = "kubectl config set-cluster karle002; export KUBERNETES_CLUSTER=karle002; export KUBERNETES_LOADBALANCER_IP=10.120.56.237";
      kc = "kubectl-ctx";
      kctx = "kubectl-ctx";
      kubectx = "kubectl-ctx";
    };
  };

  aliases = {
    vi = "nvim";
    vim = "nvim";
    oldvim = "vim";
    wssh = "waypipe ssh";
  }
  // (profileAliases.${settings.profile} or { });
in
{
  imports = [
    ../lib/tmux
    ../lib/zoxide.nix
    ../lib/fzf.nix
    ../lib/direnv.nix
  ]
  ++ (profileModules.${settings.profile} or [ ]);

  home.shell.enableZshIntegration = true;

  # Move the custom directory
  xdg.configFile."oh-my-zsh" = {
    source = "${inputs.self}/config/oh-my-zsh";
    recursive = true;
  };

  programs.tmux.shell = "${pkgs.zsh}/bin/zsh";

  programs.zsh = {
    enable = true;
    syntaxHighlighting.enable = true;
    autosuggestion.enable = true;
    enableCompletion = true;
    shellAliases = aliases;
    initContent = ''
      bindkey '^ ' autosuggest-accept
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
        "poetry-env"
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
