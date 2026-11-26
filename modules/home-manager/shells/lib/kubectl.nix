{
  pkgs,
  lib,
  settings,
  mkBrewBin,
  ...
}:
let
  isWork = settings.profile == "graff";
in
{
  home.packages = lib.optionals (!isWork) (
    with pkgs;
    [
      kubectl
      krew
      kubectx
      yq-go
    ]
  );

  programs = {
    k9s = {
      enable = true;
      package = if isWork then mkBrewBin "k9s" else pkgs.k9s;
    };

    zsh = {
      shellAliases = {
        k = "kubectl";
        kgp = "kubectl get pods";
        kgpa = "kubectl get pods --all-namespaces";
        kgs = "kubectl get svc";
        kgn = "kubectl get nodes";
        kd = "kubectl describe";
        kdp = "kubectl describe pod";
        kl = "kubectl logs";
        klf = "kubectl logs -f";
        kex = "kubectl exec -it";
        kctx = "kubectx";
        kns = "kubens";
      };
      initContent = ''
        export PATH="$HOME/.krew/bin:$PATH"
      '';
    };
  };
}
