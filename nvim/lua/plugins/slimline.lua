return {
    "sschleemilch/slimline.nvim",
    opts = {},
    config = function()
        require('slimline').setup({
            style = 'fg',
            bold = true,
            configs = {
                path = {
                    hl = {
                        primary = 'Label',
                    },
                },
                git = {
                    hl = {
                        primary = 'Function',
                    },
                },
                filetype_lsp = {
                    hl = {
                        primary = 'String',
                    },
                },
            },
        })
    end
}
