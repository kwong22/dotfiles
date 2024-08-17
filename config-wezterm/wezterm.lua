-- Import wezterm module
local wezterm = require 'wezterm'

-- Create config object
-- local config = wezterm.config_builder()
local config = {}

config.window_background_opacity = 0.9
config.macos_window_background_blur = 30

config.font = wezterm.font({ family = 'Monaco Nerd Font Mono' })
config.font_size = 12

-- Return config to be evaluated. Place at end of file
return config
