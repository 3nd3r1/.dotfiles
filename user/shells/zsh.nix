{ settings, config, pkgs, lib, ... }:

{

  # Move the custom directory
  home.file.".config/oh-my-zsh".source = config.lib.file.mkOutOfStoreSymlink
    "${config.home.homeDirectory}/dotfiles/oh-my-zsh";

  programs.tmux.shell = "${pkgs.zsh}/bin/zsh";

  programs.zsh = {
    enable = true;
    syntaxHighlighting.enable = true;
    autosuggestion.enable = true;
    enableCompletion = true;
    oh-my-zsh = {
      enable = true;
      theme = "pain";
      custom = "/home/ender/.config/oh-my-zsh/custom";
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
    };
  };
}
