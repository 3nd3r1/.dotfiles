{ pkgs, ... }:
let
  tabnineEnterpriseHost = "https://codingbuddy-tabnine.onprem.gic.ericsson.se";
in
{
  programs.nixvim.extraPlugins = [
    (pkgs.vimUtils.buildVimPlugin {
      name = "tabnine";
      src = pkgs.fetchFromGitHub {
        owner = "codota";
        repo = "tabnine-nvim";
        rev = "master";
        sha256 = "sha256-EoykpuPlck3JCY1dkkt0SBb7vj9miHVVIGi5UboB7lU=";
      };
    })
  ];

  programs.nixvim.extraConfigLua = ''
    require("tabnine").setup({
      disable_auto_comment=true,
      accept_keymap="<Space>",
      debounce_ms = 800,
      suggestion_color = {gui = "#808080", cterm = 244},
      codelens_color = { gui = "#808080", cterm = 244 },
      codelens_enabled = true,
      log_file_path = nil,
      tabnine_enterprise_host = "${tabnineEnterpriseHost}",
    })
  '';

  programs.nixvim.keymaps = [
    {
      mode = "n";
      key = "<leader>cc";
      action = "<cmd>TabnineChat<cr>";
      options = {
        silent = true;
        desc = "Open Tabnine Chat";
      };
    }
    {
      mode = "n";
      key = "<leader>c1";
      action = "<cmd>TabnineToggle<cr>";
      options = {
        silent = true;
        desc = "Toggle Tabnine inline suggestions";
      };
    }
  ];
}
