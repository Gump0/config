vim.cmd("highlight clear")
vim.cmd("syntax reset")

vim.g.colors_name = "tender"

local colors = {
  bg       = "#282828",
  fg       = "#eeeeee",

  black    = "#282828",
  red      = "#f43753",
  green    = "#c9d05c",
  yellow   = "#ffc24b",
  blue     = "#b3deef",
  magenta  = "#d3b987",
  cyan     = "#73cef4",
  white    = "#eeeeee",
	
  l_red    = "#f43753",
  selection    = "#eeeeee",
}

local set = vim.api.nvim_set_hl

-- Editor
set(0, "Normal",       { fg = colors.fg, bg = colors.bg })
set(0, "NormalFloat",  { fg = colors.fg, bg = colors.black })
set(0, "CursorLine",   { bg = colors.l_red })
set(0, "Visual",       { bg = colors.selection })
set(0, "LineNr",       { fg = colors.l_red })
set(0, "CursorLineNr", { fg = colors.yellow, bold = true })

-- Syntax
set(0, "Comment",    { fg = colors.l_red, italic = true })
set(0, "String",     { fg = colors.green })
set(0, "Character",  { fg = colors.green })
set(0, "Number",     { fg = colors.magenta })
set(0, "Boolean",    { fg = colors.magenta })
set(0, "Function",   { fg = colors.blue })
set(0, "Keyword",    { fg = colors.red })
set(0, "Conditional",{ fg = colors.red })
set(0, "Repeat",     { fg = colors.red })
set(0, "Type",       { fg = colors.yellow })
set(0, "Identifier", { fg = colors.cyan })
set(0, "Operator",   { fg = colors.fg })

-- UI
set(0, "StatusLine",   { fg = colors.fg, bg = colors.black })
set(0, "VertSplit",    { fg = colors.fg })
set(0, "Pmenu",        { fg = colors.fg, bg = colors.black })
set(0, "PmenuSel",     { fg = colors.bg, bg = colors.blue })

-- Diagnostics
set(0, "DiagnosticError", { fg = colors.red })
set(0, "DiagnosticWarn",  { fg = colors.yellow })
set(0, "DiagnosticInfo",  { fg = colors.blue })
set(0, "DiagnosticHint",  { fg = colors.cyan })
