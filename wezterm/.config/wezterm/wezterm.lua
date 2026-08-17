local wezterm = require('wezterm')
local config = wezterm.config_builder()

config.window_decorations = 'RESIZE'

config.font_size = 16
config.harfbuzz_features = { 'calt=0', 'clig=0', 'liga=0' }

config.color_scheme = 'Solarized Dark (Gogh)'
local opacity = 0.9
config.window_background_opacity = opacity
config.macos_window_background_blur = 10

local function transparent(color, alpha)
  local h, s, l, _ = wezterm.color.parse(color):hsla()
  return wezterm.color.from_hsla(h, s, l, alpha)
end

local scheme = wezterm.get_builtin_color_schemes()[config.color_scheme]
local bg = wezterm.color.parse(scheme.background)
local transparent_bg = transparent(scheme.background, opacity)
local fg = wezterm.color.parse(scheme.foreground)

config.window_frame = {
  active_titlebar_bg = transparent_bg,
  inactive_titlebar_bg = transparent_bg,
}

config.colors = {
  tab_bar = {
    active_tab = {
      bg_color = bg:lighten(0.1),
      fg_color = fg:lighten(0.1),
    },
    inactive_tab = {
      bg_color = bg,
      fg_color = fg,
    },
    inactive_tab_edge = 'none',
  },
}

config.show_new_tab_button_in_tab_bar = false
-- config.show_close_tab_button_in_tabs = false

config.window_close_confirmation = 'NeverPrompt'

wezterm.on('gui-startup', function(cmd)
  local screen = wezterm.gui.screens().active
  local ratio = 0.8
  local width, height = screen.width * ratio, screen.height * ratio
  local tab, pane, window = wezterm.mux.spawn_window({
    position = {
      x = (screen.width - width) / 2,
      y = (screen.height - height) / 2,
      origin = 'ActiveScreen',
    },
  })
  -- window:gui_window():maximize()
  window:gui_window():set_inner_size(width, height)
end)

return config
