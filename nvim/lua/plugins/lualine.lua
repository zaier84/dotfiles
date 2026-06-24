return {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" }, -- needs a Nerd Font for icons
    config = function()
        require("lualine").setup({
            options = {
                theme = "auto", -- picks up the active colorscheme (rose-pine)
                globalstatus = true,
                section_separators = "",
                component_separators = "",
            },
        })
    end,
}
