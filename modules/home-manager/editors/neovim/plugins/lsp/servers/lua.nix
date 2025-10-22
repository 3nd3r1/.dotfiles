{
  programs.nixvim.plugins.lsp.servers.lua_ls = {
    enable = true;
    settings = {
      root_markers = [
        ".luarc.json"
        ".luarc.json"
        ".git"
      ];
      Lua = {
        workspace = {
          library.__raw = ''
            vim.api.nvim_get_runtime_file("", true)
          '';
          checkThirdParty = false;
        };
      };
    };
  };
}
