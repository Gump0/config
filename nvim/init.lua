-- leader key
vim.g.mapleader = " "

-- bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not (vim.uv or vim.loop).fs_stat(lazypath) then
    local lazyrepo = "https://github.com/folke/lazy.nvim.git"

    local out = vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "--branch=stable",
        lazyrepo,
        lazypath,
    })

    if vim.v.shell_error ~= 0 then
        vim.api.nvim_echo({
            { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
            { out, "WarningMsg" },
            { "\nPress any key to exit..." },
        }, true, {})

        vim.fn.getchar()
        os.exit(1)
    end
end

vim.opt.rtp:prepend(lazypath)

-- plugins
require("lazy").setup("plugins")

-- colorscheme
vim.cmd.colorscheme("tender")

-- telescope
local builtin = require("telescope.builtin")

-- lua line (hip and cool status bar at bottom)
require("lualine").setup()

-- mason lsp package manager and lspconfig
require("mason").setup()

require("mason-lspconfig").setup({
    ensure_installed = {
        "lua_ls",
    },
})

vim.lsp.enable("lua_ls")

-- lsp config
vim.lsp.config("lua_ls", {
    settings = {
        Lua = {
            diagnostics = {
                globals = { "vim" },
            },
        },
    },
})

vim.lsp.enable("lua_ls")
vim.lsp.enable("clangd")
vim.lsp.enable("pyright")
vim.lsp.enable("ts_ls")
vim.lsp.enable("omnisharp")

-- telescope binds
vim.keymap.set("n", "<C-p>", builtin.find_files, {})
vim.keymap.set("n", "<leader>f", builtin.live_grep, {})

-- vim-tree binding (file tree that vscode has)
-- ONLY OPEN IF NOT OPENED. OTHERWISE FOCUS.
vim.keymap.set('n', '<leader>n', function()
  local nt = require("neo-tree")
  local nt_cmd = require("neo-tree.command")

  -- Check if neo-tree is already open
  local open = false
  for _, win in ipairs(vim.api.nvim_list_wins()) do
    local buf = vim.api.nvim_win_get_buf(win)
    local name = vim.api.nvim_buf_get_name(buf)
    if name:match("neo%-tree") then
      open = true
      vim.api.nvim_set_current_win(win)  -- focus
      break
    end
  end

  if not open then
    nt_cmd.execute({ toggle = true })   -- open if not already open
  end
end, { noremap = true, silent = true })

-- Remapped movement keybinds to work nicely with vim-tree ^^
vim.keymap.set('n', '<leader>h', '<C-w>h', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>l', '<C-w>l', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>k', '<C-w>k', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>j', '<C-w>j', { noremap = true, silent = true })

-- QoL settings
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.smartindent = true
vim.opt.termguicolors = true
