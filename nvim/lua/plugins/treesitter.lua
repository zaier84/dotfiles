return {
    {
        "nvim-treesitter/nvim-treesitter",

        build = ":TSUpdate",

        config = function()
            require 'nvim-treesitter.configs'.setup {
                -- a list of parser names, or "all" (the listed parsers must always be installed)
                ensure_installed = {
                    "javascript",
                    "typescript",
                    "c",
                    "cpp",
                    "lua",
                    "jsdoc",
                    "markdown",
                    "markdown_inline",
                    "bash",
                    "dart",
                    "python",
                },

                -- Install parsers synchronously
                sync_install = false,

                -- Automatically install missing parsers
                auto_install = true,

                -- Enable indentation based on Treesitter
                indent = {
                    enable = true
                },

                -- Enable syntax highlighting
                highlight = {
                    enable = true,
                    additional_vim_regex_highlighting = false,
                },
            }
        end
    },
}
