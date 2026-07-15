return {
    "jake-stewart/multicursor.nvim",
    branch = "1.0",
    config = function()
        local mc = require("multicursor-nvim")
        mc.setup()

        -- Add cursors above/below the main cursor
        vim.keymap.set({ "n", "x" }, "<C-j>", function() mc.lineAddCursor(1) end,
            { desc = "Add cursor below" })
        vim.keymap.set({ "n", "x" }, "<C-k>", function() mc.lineAddCursor(-1) end,
            { desc = "Add cursor above" })

        -- Match the word/selection under the cursor
        vim.keymap.set({ "n", "x" }, "<leader>n", function() mc.matchAddCursor(1) end,
            { desc = "Add cursor at next match" })
        vim.keymap.set({ "n", "x" }, "<leader>N", function() mc.matchSkipCursor(1) end,
            { desc = "Skip to next match" })
        vim.keymap.set({ "n", "x" }, "<leader>m", function() mc.matchAllAddCursors() end,
            { desc = "Add cursors to all matches" })

        -- Keymaps active only while multiple cursors exist
        mc.addKeymapLayer(function(layerSet)
            layerSet({ "n", "x" }, "<left>", mc.prevCursor)
            layerSet({ "n", "x" }, "<right>", mc.nextCursor)
            layerSet("n", "<esc>", function()
                if not mc.cursorsEnabled() then
                    mc.enableCursors()
                else
                    mc.clearCursors()
                end
            end)
        end)
    end,
}
