return {
    -- live grepping / searching features
    {
        "nvim-telescope/telescope.nvim",
        tag = "0.1.5",
        dependencies = {
            "nvim-lua/plenary.nvim"
        }
    },
    -- file tree plugin
    {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v3.x",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "MunifTanjim/nui.nvim",
            "nvim-tree/nvim-web-devicons",
        },
        lazy = false,
    },
    -- cool and hip status bar at the bottom.
    "nvim-lualine/lualine.nvim",
    dependencies = {
        "nvim-tree/nvim-web-devicons"
    },

    opts = {
        options = {
            theme = "dracula",
        },
    },
    -- mason lsp package manager and config
    {
        "mason-org/mason.nvim",
        opts = {}
    },
    {
        "mason-org/mason-lspconfig.nvim",
        opts = {},
        dependencies = {
            { "mason-org/mason.nvim", opts = {} },
            "neovim/nvim-lspconfig",
        },
        ensure_installed = {
            "lua_ls"
        },
    },
    -- lsp config
    {
        "neovim/nvim-lspconfig"
    },
}
