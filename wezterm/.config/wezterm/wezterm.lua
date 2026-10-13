local wezterm = require('wezterm')
local config = wezterm.config_builder()

config.window_decorations = 'RESIZE'
config.window_content_alignment = {
  horizontal = 'Center',
  vertical = 'Center',
}
config.enable_tab_bar = false
config.font_size = 16
config.color_scheme = 'Ubuntu'
config.default_prog = {
  '/opt/homebrew/bin/zsh',
  '--login',
  '-c',
  'tmux',
}

return config
