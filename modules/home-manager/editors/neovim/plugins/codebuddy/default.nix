{ settings, ... }:
{
  imports =
    if settings.profile == "work" then
      [
        ./windsurf-vim.nix
      ]
    else
      [ ./copilot.nix ];

  programs.nixvim.keymaps = [
    {
      mode = "i";
      key = "<C-Space>";
      action.__raw = ''
        function()
          if vim.g.codeium_enabled == 0 then
            return vim.fn["copilot#Accept"]()
          else
            return vim.fn["codeium#Accept"]()
          end
        end
      '';
      options = {
        expr = true;
        replace_keycodes = false;
        desc = "Accept Codebuddy completion";
      };
    }
  ];
}
