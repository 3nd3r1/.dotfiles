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
      black = "#000000",

      purple1 = "#800080",
      purple2 = "#bd10e0",
      purple3 = "#a522b6",
      purple5 = "#79427a",
      purple6 = "#c481ff",
      purple7 = "#422744",

      plum = "#d2afc3",

      white = "#f1e9ff",

      orange = "#ff8000",

    }

    local highlights = {
      -- Base colors
      Normal = { fg = colors.purple1, bg = colors.black, ctermbg = "NONE" },
      
      -- UI Elements
      Pmenu = { fg = colors.purple1, bg = colors.black },
      PMenuSel = { fg = colors.purple1 },
      SignColumn = { bg = colors.black },
      LineNr = { fg = colors.purple7, bg = colors.black },
      CursorLineNR = { fg = colors.white, bg = colors.black },
      CursorLine = { fg = colors.black, bg = colors.black },
      VertSplit = { fg = colors.black },
      Visual = { bg = colors.purple2 },
      Search = { bg = colors.purple6, fg = colors.purple1 },
      IncSearch = { fg = colors.white },
      MatchParen = { fg = colors.white },
      NonText = { fg = colors.purple5, bg = colors.black },
      
      -- Status line and tabs
      StatusLine = { fg = colors.purple1, bg = colors.black, bold = true },
      StatusLineNC = { fg = colors.purple1, bg = colors.black },
      TabLineFill = { bg = colors.black },
      TabLine = { fg = colors.black, bg = colors.black },
      Title = { fg = colors.white },
      Directory = { fg = colors.purple3 },
      
      -- Error and warning messages
      ErrorMsg = { fg = colors.purple1 },
      WarningMsg = { fg = colors.purple1 },
      Error = { fg = colors.purple1 },
      Exception = { fg = colors.purple1 },
      MoreMsg = { fg = colors.white },
      
      -- Comments
      Comment = { fg = colors.purple6, italic = true },
      SpecialComment = { fg = colors.purple6, italic = true },
      Todo = { fg = colors.white },
      
      -- Language constructs
      Statement = { fg = colors.purple5 },
      Keyword = { fg = colors.purple2 },
      Conditional = { fg = colors.white },
      Repeat = { fg = colors.purple2 },
      Label = { fg = colors.white },
      Operator = { fg = colors.purple5 },
      
      -- Types and identifiers
      Type = { fg = colors.purple1 },
      Identifier = { fg = colors.purple1 },
      Function = { fg = colors.orange },
      
      -- Constants and strings
      Constant = { fg = colors.purple2 },
      String = { fg = colors.plum },
      Number = { fg = colors.white },
      
      -- Preprocessing
      PreProc = { fg = colors.purple1 },
      PreCondit = { fg = colors.white },
      Include = { fg = colors.purple3 },
      Define = { fg = colors.white },
      Macro = { fg = colors.white },
      
      -- Special characters and debugging
      Special = { fg = colors.white },
      SpecialChar = { fg = colors.white },
      Tag = { fg = colors.white },
      Delimiter = { fg = colors.white },
      Debug = { fg = colors.white },
      Storage = { fg = colors.purple3 },
      
      -- Diff colors
      DiffAdd = { fg = colors.purple2 },
      DiffChange = { fg = colors.white },
      DiffDelete = { fg = colors.purple1 },
      DiffText = { fg = colors.purple1 },
      
      -- Git gutter
      GitGutterAdd = { fg = colors.purple2 },
      GitGutterChange = { fg = colors.white },
      GitGutterDelete = { fg = colors.purple1 },
      GitGutterChangeDelete = { fg = colors.purple1 },
      
      -- CSS specific
      cssIdentifier = { fg = colors.purple1 },
      cssImportant = { fg = colors.purple1 },
      cssIncludeKeyword = { fg = colors.purple2 },
      cssClassName = { fg = colors.purple3 },
      cssClassNameDot = { fg = colors.purple3 },
      cssColor = { fg = colors.white },
      cssAttr = { fg = colors.purple5 },
      
      -- JavaScript specific
      javaScriptBoolean = { fg = colors.purple3 },
      
      -- Markdown specific
      markdownLinkText = { fg = colors.purple3 },
    }

    -- Apply all highlights
    for group, opts in pairs(highlights) do
      vim.api.nvim_set_hl(0, group, opts)
    end
  '';
}
