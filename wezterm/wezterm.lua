-- Wezterm configuration
-- powered by aquawius
-- this is version 4

-- version 1: initial config
-- version 2: wsl support
-- version 3: update theme to purple style
-- version 4: fix bug "git log" with "terminal is not fully functional" 
--            tracert: term set to "" is not a compatible term for git
-- version 5: update theme to dracula official

local wezterm = require("wezterm");
-- local dracula = require('dracula');
local embark = require('embark');

local mux = wezterm.mux

wezterm.on('gui-startup', function(cmd)
  local tab, pane, window = mux.spawn_window(cmd or {})
  window:gui_window():maximize()
end)

local config = {
		window_decorations = "RESIZE",
    check_for_updates = true,
-- window_background_opacity = 0.95, -- 如果设置为1.0会明显卡顿
    window_padding = {
        left = 0,
        right = -55,
        top = 5,
        bottom = -5
    },
    window_background_image_hsb = {
        brightness = 0.8,
        hue = 1.0,
        saturation = 1.0
    },
    window_close_confirmation = "NeverPrompt",
    enable_scroll_bar = true,
    exit_behavior = "Close",

    inactive_pane_hsb = {
        hue = 1.0,
        saturation = 1.0,
        brightness = 1.0,
    },

    -- font = wezterm.font('Anomaly Mono')
    font = wezterm.font('Cascadia Code',{ weight = 'Light', italic = true }),
    -- font = wezterm.font_with_fallback({
		-- 		-- "IBM 3270",
		-- 		-- "Dank Mono",
    --     "Cascadia Code",
		-- 		"Anomaly Mono",
    --     "Fira Code",
    -- }),
    font_size = 15.0,

    colors = embark,
    tab_bar_at_bottom = true,
    use_fancy_tab_bar = false
}



function Basename(s)
    return string.gsub(s, "(.*[/\\])(.*)", "%2")
end

wezterm.on("format-tab-title", function(tab, tabs, panes, config, hover, max_width)
    local pane = tab.active_pane
    local title = Basename(pane.foreground_process_name)
    return {
        { Text = "   " .. title .. "   " },
    }
end)

return config
