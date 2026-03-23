return {

    {
        "mason-org/mason.nvim",

        config = function()
            -- require("mason").setup()
            require("mason").setup({
                registries = {
                    "github:mason-org/mason-registry",
                    "github:Crashdummyy/mason-registry",
                },
            })
        end
    },

    {
        "mason-org/mason-lspconfig.nvim",

        config = function()
            require("mason-lspconfig").setup({
                ensure_installed = { "lua_ls", "ts_ls", "clangd", "pyright" }
            })
        end

    },

    {
        "neovim/nvim-lspconfig",

        config = function()
            local capabilities = require("cmp_nvim_lsp").default_capabilities()

            -- Lua
            vim.lsp.config("lua_ls", {
                capabilities = capabilities,
            })

            -- Typescript / Javascript
            vim.lsp.config("ts_ls", {
                capabilities = capabilities,
            })

            -- C++
            vim.lsp.config("clangd", {
                capabilities = capabilities,
                cmd = {
                    "clangd",
                    "--background-index",
                    "--clang-tidy",
                    "--completion-style=detailed",
                    "--header-insertion=iwyu"
                },
            })

            -- Python
            vim.lsp.config("pyright", {
                capabilities = capabilities,
            })

            -- C#
            vim.lsp.config("roslyn", {
                -- capabilities = capabilities,
                on_attach = function()
                    print("Roslyn Initialized")
                end,
                settings = {
                    ["csharp|inlay_hints"] = {
                        csharp_enable_inlay_hints_for_implicit_object_creation = true,
                        csharp_enable_inlay_hints_for_implicit_variable_types = true,
                    },
                    ["csharp|code_lens"] = {
                        dotnet_enable_references_code_lens = true,
                    },
                },
            })

            -- Erlang
            vim.api.nvim_create_autocmd("FileType", {
                pattern = "erlang",
                callback = function(args)
                    local fname = vim.api.nvim_buf_get_name(args.buf)
                    vim.lsp.start({
                        name = "erlangls",
                        cmd = { "escript", "C:/tools/erlang_ls/erlang_ls" },
                        -- cmd = { "escript", "C:\\tools\\erlang_ls\\erlang_ls" },
                        root_dir = vim.fs.root(fname, { "rebar.config", "erlang.mk", ".git" })
                            or vim.fs.dirname(fname)
                            or vim.loop.cwd(),
                        capabilities = capabilities,
                        filetypes = { "erlang" },
                        single_file_support = true,
                    })
                end,
            })

            vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
            vim.keymap.set("n", "<C-f>", vim.lsp.buf.format, {})
            vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
            vim.keymap.set("n", "<C-r>", vim.lsp.buf.rename, {})
            vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})

            vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, {})
            vim.keymap.set("n", "]d", vim.diagnostic.goto_next, {})
            vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, {})
            vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, {})
        end
    },

    {
        -- Completion engine
        "hrsh7th/nvim-cmp",
        dependencies = {
            "hrsh7th/cmp-nvim-lsp", -- LSP source
            "hrsh7th/cmp-buffer",   -- buffer words
            "hrsh7th/cmp-path",     -- filesystem paths
            "hrsh7th/cmp-cmdline",  -- :cmdline completions
            "L3MON4D3/LuaSnip",     -- snippet engine (required)
            "hrsh7th/cmp-nvim-lsp-signature-help",
        },
        config = function()
            local cmp = require("cmp")
            cmp.setup({
                snippet = {
                    expand = function(args)
                        require("luasnip").lsp_expand(args.body)
                    end,
                },
                mapping = cmp.mapping.preset.insert({
                    ["<C-Space>"] = cmp.mapping.complete(),            -- open completion menu
                    ["<CR>"] = cmp.mapping.confirm({ select = true }), -- confirm selection
                    ["<Tab>"] = cmp.mapping.select_next_item(),        -- move down
                    ["<S-Tab>"] = cmp.mapping.select_prev_item(),      -- move up
                    ["<C-e>"] = cmp.mapping.abort(),                   -- close menu
                }),
                sources = cmp.config.sources({
                    { name = "nvim_lsp" },
                    { name = "buffer" },
                    { name = "path" },
                    { name = "nvim_lsp_signature_help" },
                }),
            })

            -- Autopairs integration
            local cmp_autopairs = require("nvim-autopairs.completion.cmp")
            cmp.event:on(
                "confirm_done",
                cmp_autopairs.on_confirm_done()
            )
        end
    },

    {
        'nvim-flutter/flutter-tools.nvim',

        lazy = false,

        dependencies = {
            'nvim-lua/plenary.nvim',
            'stevearc/dressing.nvim', -- optional for vim.ui.select
        },

        config = function()
            require("flutter-tools").setup({
                lsp = {
                    capabilities = require("cmp_nvim_lsp").default_capabilities(),
                    on_attach = function(client, bufnr)
                        vim.keymap.set("n", "<C-f>", function()
                            vim.lsp.buf.format({ async = true })
                        end, { buffer = bufnr })
                    end,
                },
                debugger = { enabled = true },
                widget_guides = { enabled = true },
                dev_log = { open_cmd = "tabedit" },
            })
        end
    },

    {
        "seblyng/roslyn.nvim",
        opts = {
            silent = false,
        },
    },
}
