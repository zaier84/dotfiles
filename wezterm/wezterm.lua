local wezterm = require 'wezterm'

-- Start maximized on launch
wezterm.on("gui-startup", function(cmd)
    local _, _, window = wezterm.mux.spawn_window(cmd or {})
    window:gui_window():maximize()
end)

return {
    term = "xterm-256color",
    animation_fps = 60,
    max_fps = 60,
    front_end = "WebGpu",
    -- webgpu_power_preference = "HighPerformance",

    -- color scheme
    color_scheme = "Rosé Pine Moon",

    inactive_pane_hsb = {
        saturation = 0.9,
        brightness = 0.65, -- subtle dim without losing readability
    },

    font = wezterm.font("JetBrainsMono Nerd Font"),
    font_size = 12.5,
    line_height = 1.05,

    -- background
    window_background_opacity = 0.90, -- adjust to your liking

    -- tab bar
    enable_tab_bar = true,
    hide_tab_bar_if_only_one_tab = false,
    use_fancy_tab_bar = true,
    tab_max_width = 25,
    show_tab_index_in_tab_bar = true,
    switch_to_last_active_tab_when_closing_tab = true,

    -- cursor
    default_cursor_style = "BlinkingBlock",
    cursor_blink_ease_in = "Constant",
    cursor_blink_ease_out = "Constant",
    cursor_blink_rate = 700,

    -- cursor colors (added)
    colors = {
        cursor_bg = "#c4a7e7",
        cursor_fg = "#191724",
        cursor_border = "#c4a7e7",
    },

    -- window
    adjust_window_size_when_changing_font_size = false,
    window_decorations = "INTEGRATED_BUTTONS|RESIZE",
    integrated_title_button_style = "Windows",
    integrated_title_button_color = "auto",
    integrated_title_button_alignment = "Right",
    initial_cols = 120,
    initial_rows = 24,
    window_padding = {
        left = 5,
        right = 10,
        top = 12,
        bottom = 7,
    },

    default_prog = { 'pwsh.exe', '-NoLogo' },
}
