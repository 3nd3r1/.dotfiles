{ settings, ... }:
{
  programs.nixvim.plugins.lsp.servers.nixd = {
    enable = true;
    settings = {
      formatting.command = [ "nixfmt" ];
      options = {
        nixos.expr = ''(builtins.getFlake "${settings.dotfilesDir}").nixosConfigurations.bean.options'';
        home_manager.expr = ''(builtins.getFlake "${settings.dotfilesDir}").homeConfigurations.${settings.profile}.options'';
      };
    };
  };
}
