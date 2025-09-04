{ settings, config, pkgs, lib, ... }:

{
  imports = [ ./lib/tmux ];
  # Move the custom directory
  home.file.".config/oh-my-zsh".source =
    config.lib.file.mkOutOfStoreSymlink "${settings.dotfilesDir}/oh-my-zsh";

  programs.tmux.shell = "${pkgs.zsh}/bin/zsh";

  programs.zsh = {
    enable = true;
    syntaxHighlighting.enable = true;
    autosuggestion.enable = true;
    enableCompletion = true;
    shellAliases = {
      vi = "nvim";
      vim = "nvim";
      oldvim = "\vim";
    };
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

        bindkey '^ ' autosuggest-accept
      '';
    };
  };
}
