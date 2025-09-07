{
  programs.nixvim.plugins.lualine-nvim = {
    enable = true;
    settings = {
      options = {
        icons_enabled = true;
        theme.__raw = ''
          (function()
            local custom_ayu = require("lualine.themes.ayu")
            -- Change the background of lualine sections
            custom_ayu.normal.a.bg = "#800080"
            custom_ayu.normal.b.fg = "#ff8000"
            custom_ayu.insert.a.bg = "#ff8000"
            custom_ayu.insert.b.fg = "#ff8000"
            custom_ayu.visual.a.bg = "#800080"
            custom_ayu.visual.b.fg = "#ff8000"
            custom_ayu.normal.c.bg = "#000000"
            return custom_ayu
          end)()
        '';
        component_separators = {
          left = "";
          right = "";
        };
        section_separators = {
          left = "";
          right = "";
        };
        disabled_filetypes = {
          statusline = [ ];
          winbar = [ ];
        };
        ignore_focus = [ ];
        always_divide_middle = true;
        globalstatus = false;
        refresh = {
          statusline = 1000;
          tabline = 1000;
          winbar = 1000;
        };
      };
      sections = {
        lualine_a = [ "mode" ];
        lualine_b = [ "branch" "diff" "diagnostics" ];
        lualine_c = [ "filename" ];
        lualine_x = [
          "encoding"
          "fileformat"
          "filetype"
          {
            __unkeyed-1.__raw = ''
              function()
                if vim.bo.filetype ~= "python" then
                  return ""
                end
                local conda_env = os.getenv("CONDA_DEFAULT_ENV")
                local venv_path = os.getenv("VIRTUAL_ENV")
                if venv_path == nil then
                  if conda_env == nil then
                    return ""
                  else
                    return string.format("%s (conda)", conda_env)
                  end
                else
                  local venv_name = vim.fn.fnamemodify(venv_path, ":t")
                  return string.format("%s (venv)", venv_name)
                end
              end
            '';
          }
        ];
        lualine_y = [
          {
            __unkeyed-1.__raw = ''
              function()
                return require("dap").status()
              end
            '';
          }
          {
            __unkeyed-1.__raw = ''
              function()
                if vim.api.nvim_call_function("copilot#Enabled", {}) == 0 then
                  return "" .. " OFF"
                else
                  return "" .. " ON"
                end
              end
            '';
          }
          {
            __unkeyed-1.__raw = ''
              function()
                return "{…}" .. vim.api.nvim_call_function("codeium#GetStatusString", {})
              end
            '';
          }
        ];
        lualine_z = [ "location" ];
      };

      inactive_sections = {
        lualine_a = [ ];
        lualine_b = [ ];
        lualine_c = [ "filename" ];
        lualine_x = [ "location" ];
        lualine_y = [ ];
        lualine_z = [ ];
      };

      tabline = { };
      winbar = { };
      inactive_winbar = { };
      extensions = [ ];
    };
  };
}
