function ColorMyPencils(color)
    color = color or "rose-pine-moon"
    vim.cmd.colorscheme(color)

    vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end

return {
    {
        "jpwol/thorn.nvim",
        lazy = true,
        priority = 1000,
        opts = {},
        config = function()
            --     vim.cmd([[colorscheme thorn]])
            require("thorn").setup({})
            ColorMyPencils('thorn')
            vim.api.nvim_set_hl(0, "IblIndent", { fg = "#3b4261", nocombine = true })
            vim.api.nvim_set_hl(0, "IblWhitespace", { fg = "#2f3540", nocombine = true })
        end
    },

    {
        'sainnhe/edge',
        lazy = true,
        priority = 1000,
        config = function()
            -- Optionally configure and load the colorscheme
            -- directly inside the plugin declaration.
            vim.g.edge_enable_italic = true
            ColorMyPencils('edge')
        end
    },

    {
        "neanias/everforest-nvim",
        lazy = true,
        priority = 1000,
        config = function()
            require("everforest").setup({})

            ColorMyPencils("everforest")
        end,

    },

    {
        "rebelot/kanagawa.nvim",
        name = "kanagawa",
        lazy = true,
        priority = 1000,
        config = function()
            require("kanagawa").setup({
                transparent = true,
                colors = { theme = { all = { ui = { bg_gutter = "none" } } } },
            })

            ColorMyPencils("kanagawa")
        end
    },

    {
        "webhooked/kanso.nvim",
        lazy = true,
        priority = 1000,
        config = function()
            require('kanso').setup({
                bold = true,      -- enable bold fonts
                italics = true,   -- enable italics
                compile = false,  -- enable compiling the colorscheme
                undercurl = true, -- enable undercurls
                commentStyle = { italic = true },
                functionStyle = {},
                keywordStyle = { italic = true },
                statementStyle = {},
                typeStyle = {},
                transparent = true,    -- do not set background color
                dimInactive = false,   -- dim inactive window `:h hl-NormalNC`
                terminalColors = true, -- define vim.g.terminal_color_{0,17}
                colors = {             -- add/modify theme and palette colors
                    palette = {},
                    theme = { zen = {}, pearl = {}, ink = {}, all = {} },
                },
                overrides = function(colors) -- add/modify highlights
                    return {}
                end,
                background = {          -- map the value of 'background' option to a theme
                    dark = "zen",       -- try "zen", "mist" or "pearl" !
                    light = "zen"       -- try "zen", "mist" or "pearl" !
                },
                foreground = "default", -- "default" or "saturated" (can also be a table like background)
            })

            ColorMyPencils("kanso")
        end
    },

    {
        "rose-pine/neovim",
        name = "rose-pine",
        lazy = false,
        config = function()
            require('rose-pine').setup({
                -- variant: "auto", "main", "moon", or "dawn"
                variant = "moon",
                dark_variant = "moon",
                disable_background = true,
                styles = {
                    italic = false,
                },
            })

            ColorMyPencils();
        end
    },

    {
        "catppuccin/nvim",
        lazy = true,
        name = "catppuccin",
        -- priority = 1000,
        config = function()
            ColorMyPencils("catppuccin")
        end
    },

    {
        "folke/tokyonight.nvim",
        lazy = true,
        opts = {},
        config = function()
            ColorMyPencils("tokyonight")
        end
    },

}
