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
vim.keymap.set('n', '<leader>n', ':Neotree toggle<CR>', {})

-- QoL settings
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.smartindent = true
vim.opt.termguicolors = true
