local custom_ayu = require'lualine.themes.ayu'

-- Change the background of lualine_c section for normal mode
custom_ayu.normal.a.bg = '#800080'
custom_ayu.normal.b.fg = '#ff8000'
custom_ayu.insert.a.bg = '#ff8000'
custom_ayu.insert.b.fg = '#ff8000'
custom_ayu.visual.a.bg = '#800080'
custom_ayu.visual.b.fg = '#ff8000'
custom_ayu.normal.c.bg = '#000000'

require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = custom_ayu,
    component_separators = { left = '', right = ''},
    section_separators = { left = '', right = ''},
    disabled_filetypes = {
      statusline = {},
      winbar = {},
    },
    ignore_focus = {},
    always_divide_middle = true,
    globalstatus = false,
    refresh = {
      statusline = 1000,
      tabline = 1000,
      winbar = 1000,
    }
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch', 'diff', 'diagnostics'},
    lualine_c = {'filename'},
    lualine_x = {'encoding', 'fileformat', 'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  winbar = {},
  inactive_winbar = {},
  extensions = {}
}
