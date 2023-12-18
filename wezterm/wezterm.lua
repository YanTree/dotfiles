-- Pull in the wezterm API
local wezterm = require 'wezterm'
local mux = wezterm.mux

-- This table will hold the configuration.
local config = {}

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
  config = wezterm.config_builder()
end


-- About render info
-- Max rate for easing effect for blink cursor, blink text, visual bell.
config.animation_fps = 60
-- Wezterm will attempt to draw of frames per second
config.max_fps = 120
config.front_end = "WebGpu"
config.webgpu_power_preference = "HighPerformance"


-- Enable scroll bar
config.enable_scroll_bar = true

-- Resize window padding
config.window_padding = {
  left = 4,
  right = 12,
  top = 4,
  bottom = 4,
}

-- Maximize window when start
wezterm.on('gui-attached', function(domain)
  -- maximize all displayed windows on startup
  local workspace = mux.get_active_workspace()
  for _, window in ipairs(mux.all_windows()) do
    if window:get_workspace() == workspace then
      window:gui_window():maximize()
    end
  end
end)


-- nushell as default shell
config.default_prog = { "nu.exe" }

config.font_size = 11
config.font = wezterm.font("Maple Mono SC NF", { weight = "Regular" })

config.color_scheme = "Gruvbox dark, medium (base16)"

-- and finally, return the configuration to wezterm
return config
