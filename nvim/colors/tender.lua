vim.cmd("highlight clear")
vim.cmd("syntax reset")

vim.g.colors_name = "tender"

local colors = {
    -- base
    bg         = "#282828",
    fg         = "#eeeeee",

    -- palette
    black      = "#1d1d1d",
    red        = "#f43753",
    green      = "#c9d05c",
    yellow     = "#ffc24b",
    blue       = "#b3deef",
    magenta    = "#d3b987",
    cyan       = "#73cef4",
    white      = "#eeeeee",

    -- muted UI colors
    comment    = "#b8a15a",
    line_nr    = "#8a7a3a",

    -- ui backgrounds
    cursorline = "#2a2525",
    visual     = "#3a3a3a",
    menu_bg    = "#222222",
}

local set = vim.api.nvim_set_hl

----------------------------------------------------------------------
-- editor
----------------------------------------------------------------------

set(0, "Normal", {
    fg = colors.fg,
    bg = colors.bg
})

set(0, "NormalFloat", {
    fg = colors.fg,
    bg = colors.menu_bg
})

set(0, "CursorLine", {
    bg = colors.cursorline
})

set(0, "Visual", {
    bg = colors.visual
})

set(0, "LineNr", {
    fg = colors.line_nr
})

set(0, "CursorLineNr", {
    fg = colors.yellow,
    bold = true
})

----------------------------------------------------------------------
-- syntax
----------------------------------------------------------------------

set(0, "Comment", {
    fg = colors.comment,
    italic = true
})

set(0, "String", {
    fg = colors.green
})

set(0, "Character", {
    fg = colors.green
})

set(0, "Number", {
    fg = colors.magenta
})

set(0, "Boolean", {
    fg = colors.magenta
})

set(0, "Function", {
    fg = colors.blue
})

set(0, "Keyword", {
    fg = colors.red
})

set(0, "Conditional", {
    fg = colors.yellow
})

set(0, "Repeat", {
    fg = colors.yellow
})

set(0, "Type", {
    fg = colors.cyan
})

set(0, "Identifier", {
    fg = colors.white
})

set(0, "Operator", {
    fg = colors.fg
})

----------------------------------------------------------------------
-- ui
----------------------------------------------------------------------

set(0, "StatusLine", {
    fg = colors.fg,
    bg = colors.black
})

set(0, "VertSplit", {
    fg = "#444444"
})

set(0, "Pmenu", {
    fg = colors.fg,
    bg = colors.menu_bg
})

set(0, "PmenuSel", {
    fg = colors.bg,
    bg = colors.blue
})

----------------------------------------------------------------------
-- diagnostics
----------------------------------------------------------------------

set(0, "DiagnosticError", {
    fg = colors.red
})

set(0, "DiagnosticWarn", {
    fg = colors.yellow
})

set(0, "DiagnosticInfo", {
    fg = colors.blue
})

set(0, "DiagnosticHint", {
    fg = colors.cyan
})
