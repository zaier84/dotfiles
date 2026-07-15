return {
    "sphamba/smear-cursor.nvim",
    -- opts = {
    --     -- Recommended defaults
    --     cursor_color = "#ffffff",
    --     window_duration = 150, -- how long the smear lasts (ms)
    --     render_interval = 1, -- lower = smoother (but more cpu)
    --     width = 1.0,         -- smear thickness
    --     trail_length = 0.5,  -- 0–1
    --     hide_target_hack = true, -- better visuals
    -- },
    opts = {
        cursor_color = "#ffffff",
        width = 1.0, -- smear thickness
        trail_length = 0.5,
        window_duration = 250,
        render_interval = 1,
    }
}
