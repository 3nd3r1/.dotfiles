-- Theme pain for neovim
-- Author: 3nd3r1

-- Reset syntax and set colorscheme details
vim.cmd [[syntax reset]]
vim.g.colors_name = "pain"
vim.o.background = "dark"
vim.o.termguicolors = true

-- Basic UI components
local highlight_groups = {
    Normal = { bg = "none", fg = "#800080" },
    NormalFloat = { bg = "none" },
    EndOfBuffer = { bg = "none", fg = "none" },
    Pmenu = {fg="#800080", bg="#000000"},
    SignColumn = {bg="#000000"},
    CursorLine = {bg="#000000"},
    TabLineFill = { bg="#000000"},
    TabLine = {fg="#000000", bg="#000000"},
    StatusLine = {bg="#000000", fg="#800080"},
    StatusLineNC = { bg="#000000", fg="#800080"},
    LineNr = {fg="#422744", bg="#000000"},
    NonText = {fg="#c481ff", bg="#000000"},
    Visual = { bg="#bd10e0"},
}

-- Syntax highlighting - Purple shades
for _, group in ipairs({
    "DiffText", "ErrorMsg", "WarningMsg", "PreProc", "Exception", "Error",
    "DiffDelete", "GitGutterDelete", "GitGutterChangeDelete", "cssIdentifier",
    "cssImportant", "Type", "Identifier", "PMenuSel"
}) do
    highlight_groups[group] = {fg="#800080"}
end

-- Syntax highlighting - Pink shades
for _, group in ipairs({
    "Constant", "Repeat", "DiffAdd", "GitGutterAdd", "cssIncludeKeyword",
    "Keyword"
}) do
    highlight_groups[group] = {fg="#bd10e0"}
end

-- Syntax highlighting - White shades
for _, group in ipairs({
    "IncSearch", "Title", "PreCondit", "Debug", "SpecialChar", "Conditional",
    "Todo", "Special", "Label", "Delimiter", "Number", "CursorLineNR",
    "Define", "MoreMsg", "Tag", "MatchParen", "Macro", "DiffChange",
    "GitGutterChange", "cssColor"
}) do
    highlight_groups[group] = {fg="#f1e9ff"}
end

-- Syntax highlighting - Pink lavender shades
for _, group in ipairs({"String"}) do
    highlight_groups[group] = {fg="#d2afc3"}
end

-- Syntax highlighting - Specific colors
highlight_groups["Function"] = {fg="#ff8000"}
highlight_groups["Directory"] = {fg="#a522b6"}
highlight_groups["markdownLinkText"] = {fg="#a522b6"}
highlight_groups["javaScriptBoolean"] = {fg="#a522b6"}
highlight_groups["Include"] = {fg="#a522b6"}
highlight_groups["Storage"] = {fg="#a522b6"}
highlight_groups["cssClassName"] = {fg="#a522b6"}
highlight_groups["cssClassNameDot"] = {fg="#a522b6"}
highlight_groups["Statement"] = {fg="#79427a"}
highlight_groups["Operator"] = {fg="#79427a"}
highlight_groups["cssAttr"] = {fg="#79427a"}

-- Comments and special texts
highlight_groups["Comment"] = {fg="#c481ff"}
highlight_groups["SpecialComment"] = {fg="#c481ff"}
highlight_groups["Search"] = {bg="#c481ff", fg="#800080"}
highlight_groups["VertSplit"] = {fg="#000000"}

-- Apply highlight groups
for group, styles in pairs(highlight_groups) do
    vim.api.nvim_set_hl(0, group, styles)
end

