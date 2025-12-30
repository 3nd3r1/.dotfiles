{
  pkgs,
  ...
}:
{
  home.packages = [
    (pkgs.python3.withPackages (ps: [ ps.robotframework ]))
  ];

  programs.nixvim.plugins.lsp.servers.robotframework_ls = {
    enable = true;
    package = null;
    cmd = [
      "python3"
      "-m"
      "robotframework_ls"
    ];
  };
}
