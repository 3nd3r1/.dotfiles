{
  pkgs,
  settings,
  lib,
  mkBrewBin,
  ...
}:

let
  isWork = settings.profile == "graff";
in
{
  programs = {
    git = {
      enable = true;
      lfs.enable = isWork;
      signing = lib.mkIf isWork {
        key = "C6B031CAF50F5674";
        signByDefault = true;
      };
      settings = {
        user.name = settings.name;
        user.email = settings.email;
        core.editor = "nvim";
        init.defaultBranch = "main";
        pull.rebase = true;
        push.autoSetupRemote = true;
        rerere.enabled = true;
        rebase.autoStash = true;
        merge.conflictStyle = "zdiff3";
        diff.algorithm = "histogram";
      }
      // lib.optionalAttrs isWork {
        url."git@github.palantir.build:".insteadOf = "https://github.palantir.build/";
      };
    };

    delta = {
      enable = true;
      enableGitIntegration = true;
      package = if isWork then mkBrewBin "delta" else pkgs.delta;
      options = {
        navigate = true;
        line-numbers = true;
        side-by-side = true;
      };
    };

    lazygit = {
      enable = true;
      package = if isWork then mkBrewBin "lazygit" else pkgs.lazygit;
    };
  };
}
