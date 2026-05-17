return {
    ------------------------------------------------------------------
    -- telescope
    ------------------------------------------------------------------
    {
        "nvim-telescope/telescope.nvim",
        tag = "0.1.5",

        dependencies = {
            "nvim-lua/plenary.nvim",
        },
    },

    ------------------------------------------------------------------
    -- neo-tree
    ------------------------------------------------------------------
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

    ------------------------------------------------------------------
    -- lualine
    ------------------------------------------------------------------
    {
        "nvim-lualine/lualine.nvim",

        dependencies = {
            "nvim-tree/nvim-web-devicons",
        },

        opts = {
            options = {
                theme = "everforest",
            },
        },
    },

    ------------------------------------------------------------------
    -- mason
    ------------------------------------------------------------------
    {
        "mason-org/mason.nvim",

        opts = {},
    },

    ------------------------------------------------------------------
    -- mason-lspconfig
    ------------------------------------------------------------------
    {
        "mason-org/mason-lspconfig.nvim",

        dependencies = {
            "mason-org/mason.nvim",
            "neovim/nvim-lspconfig",
        },

        opts = {
            ensure_installed = {
                "lua_ls",
                "clangd",
                "pyright",
                "omnisharp",
            },
        },
    },

    ------------------------------------------------------------------
    -- lspconfig
    ------------------------------------------------------------------
    {
        "neovim/nvim-lspconfig",

        config = function()
            local capabilities =
                require("cmp_nvim_lsp").default_capabilities()

            -- Lua
            vim.lsp.config("lua_ls", {
                capabilities = capabilities,
            })

            -- C/C++
            vim.lsp.config("clangd", {
                capabilities = capabilities,
            })

            -- Python
            vim.lsp.config("pyright", {
                capabilities = capabilities,
            })

            -- C#
            vim.lsp.config("omnisharp", {
                capabilities = capabilities,
            })

            vim.lsp.enable("lua_ls")
            vim.lsp.enable("clangd")
            vim.lsp.enable("pyright")
            vim.lsp.enable("omnisharp")
        end,
    },

    ------------------------------------------------------------------
    -- autocomplete
    ------------------------------------------------------------------
    {
        "hrsh7th/nvim-cmp",

        dependencies = {
            "hrsh7th/cmp-nvim-lsp",
            "L3MON4D3/LuaSnip",
            "saadparwaiz1/cmp_luasnip",
            "rafamadriz/friendly-snippets",
        },

        config = function()
            local cmp = require("cmp")
            local luasnip = require("luasnip")

            require("luasnip.loaders.from_vscode").lazy_load()

            cmp.setup({
                snippet = {
                    expand = function(args)
                        luasnip.lsp_expand(args.body)
                    end,
                },

                mapping = cmp.mapping.preset.insert({
                    ["<C-Space>"] = cmp.mapping.complete(),
                    ["<CR>"] = cmp.mapping.confirm({ select = true }),

                    ["<Tab>"] = cmp.mapping(function(fallback)
                        if cmp.visible() then
                            cmp.select_next_item()
                        elseif luasnip.expand_or_jumpable() then
                            luasnip.expand_or_jump()
                        else
                            fallback()
                        end
                    end, { "i", "s" }),

                    ["<S-Tab>"] = cmp.mapping(function(fallback)
                        if cmp.visible() then
                            cmp.select_prev_item()
                        elseif luasnip.jumpable(-1) then
                            luasnip.jump(-1)
                        else
                            fallback()
                        end
                    end, { "i", "s" }),
                }),

                sources = cmp.config.sources({
                    { name = "nvim_lsp" },
                    { name = "luasnip" },
                }),
            })
        end,
    },

    ------------------------------------------------------------------
    -- autopairs
    ------------------------------------------------------------------
    {
        "windwp/nvim-autopairs",

        event = "InsertEnter",

        config = true,
    },
}
