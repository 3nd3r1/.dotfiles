{
  programs.nixvim.extraConfigLua = ''
    -- Theme pain for neovim
    -- Author: 3nd3r1

    -- Reset syntax and set colorscheme details
    vim.cmd [[syntax reset]]
    vim.g.colors_name = "pain"
    vim.o.background = "dark"
    vim.o.termguicolors = true

     -- Color palette
    local colors = {
      bg = "#000000",
      fg = "#800080",
      purple = "#800080",
      bright_purple = "#bd10e0",
      light_purple = "#f1e9ff",
      orange = "#ff8000",
      medium_purple = "#a522b6",
      dark_purple = "#79427a",
      comment_purple = "#c481ff",
      line_number = "#422744",
    }

    local highlights = {
      -- Base colors
      Normal = { fg = colors.purple, bg = colors.bg, ctermbg = "NONE" },
      
      -- UI Elements
      Pmenu = { fg = colors.purple, bg = colors.bg },
      PMenuSel = { fg = colors.bright_purple },
      SignColumn = { bg = colors.bg },
      LineNr = { fg = colors.line_number, bg = colors.bg },
      CursorLineNR = { fg = colors.light_purple, bg = colors.bg },
      CursorLine = { fg = colors.bg, bg = colors.bg },
      VertSplit = { fg = colors.bg },
      Visual = { bg = colors.bg },
      Search = { bg = colors.comment_purple, fg = colors.purple },
      IncSearch = { fg = colors.light_purple },
      MatchParen = { fg = colors.light_purple },
      NonText = { fg = colors.comment_purple, bg = colors.bg },
      
      -- Status line and tabs
      StatusLine = { fg = colors.purple, bg = colors.bg, bold = true },
      StatusLineNC = { fg = colors.purple, bg = colors.bg },
      TabLineFill = { bg = colors.bg },
      TabLine = { fg = colors.bg, bg = colors.bg },
      Title = { fg = colors.light_purple },
      Directory = { fg = colors.medium_purple },
      
      -- Error and warning messages
      ErrorMsg = { fg = colors.purple },
      WarningMsg = { fg = colors.purple },
      Error = { fg = colors.purple },
      Exception = { fg = colors.purple },
      MoreMsg = { fg = colors.light_purple },
      
      -- Comments
      Comment = { fg = colors.comment_purple, italic = true },
      SpecialComment = { fg = colors.comment_purple, italic = true },
      Todo = { fg = colors.light_purple },
      
      -- Language constructs
      Statement = { fg = colors.dark_purple },
      Keyword = { fg = colors.bright_purple },
      Conditional = { fg = colors.light_purple },
      Repeat = { fg = colors.bright_purple },
      Label = { fg = colors.light_purple },
      Operator = { fg = colors.dark_purple },
      
      -- Types and identifiers
      Type = { fg = colors.purple },
      Identifier = { fg = colors.purple },
      Function = { fg = colors.orange },
      
      -- Constants and strings
      Constant = { fg = colors.bright_purple },
      String = { fg = colors.light_purple },
      Number = { fg = colors.light_purple },
      
      -- Preprocessing
      PreProc = { fg = colors.purple },
      PreCondit = { fg = colors.light_purple },
      Include = { fg = colors.medium_purple },
      Define = { fg = colors.light_purple },
      Macro = { fg = colors.light_purple },
      
      -- Special characters and debugging
      Special = { fg = colors.light_purple },
      SpecialChar = { fg = colors.light_purple },
      Tag = { fg = colors.light_purple },
      Delimiter = { fg = colors.light_purple },
      Debug = { fg = colors.light_purple },
      Storage = { fg = colors.medium_purple },
      
      -- Diff colors
      DiffAdd = { fg = colors.bright_purple },
      DiffChange = { fg = colors.light_purple },
      DiffDelete = { fg = colors.purple },
      DiffText = { fg = colors.purple },
      
      -- Git gutter
      GitGutterAdd = { fg = colors.bright_purple },
      GitGutterChange = { fg = colors.light_purple },
      GitGutterDelete = { fg = colors.purple },
      GitGutterChangeDelete = { fg = colors.purple },
      
      -- CSS specific
      cssIdentifier = { fg = colors.purple },
      cssImportant = { fg = colors.purple },
      cssIncludeKeyword = { fg = colors.bright_purple },
      cssClassName = { fg = colors.medium_purple },
      cssClassNameDot = { fg = colors.medium_purple },
      cssColor = { fg = colors.light_purple },
      cssAttr = { fg = colors.dark_purple },
      
      -- JavaScript specific
      javaScriptBoolean = { fg = colors.medium_purple },
      
      -- Markdown specific
      markdownLinkText = { fg = colors.medium_purple },
    }

    -- Apply all highlights
    for group, opts in pairs(highlights) do
      vim.api.nvim_set_hl(0, group, opts)
    end
  '';
}
