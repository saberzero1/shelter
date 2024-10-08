-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- Actions shortcut
local act = wezterm.action

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices
config.front_end = 'WebGpu'
config.max_fps = 120

config.color_scheme = 'tokyonight_storm'

-- For example, changing the color scheme:
config.colors = {
  foreground = '#CBE0F0',
  -- background = '#011423',
  -- background = '#000000',
  background = '#1A1B27', -- tokyonight
  -- background = '#191724', -- rose-pine
  -- background = '#141414', -- gray
  cursor_bg = '#47FF9C',
  cursor_border = '#47FF9C',
  cursor_fg = '#011423',
  selection_bg = '#706b4e',
  selection_fg = '#f3d9c4',
  ansi = { '#214969', '#E52E2E', '#44FFB1', '#FFE073', '#0FC5ED', '#a277ff', '#24EAF7', '#24EAF7' },
  brights = { '#214969', '#E52E2E', '#44FFB1', '#FFE073', '#A277FF', '#a277ff', '#24EAF7', '#24EAF7' },
  tab_bar = {
    background = 'rgba(0,0,0,0)',
    active_tab = {
      -- The color of the background area for the tab
      bg_color = 'rgba(0,0,0,0)',
      fg_color = '#47FF9C',
    },
    inactive_tab = {
      -- The color of the background area for the tab
      bg_color = 'rgba(0,0,0,0)',
      fg_color = '#444444',
      italic = true
    }
  },
}

config.background = {
  {
    source = {
      Color = 'rgb(26, 27, 39, 0.93)',-- #1A1B27
    },
    height = '100%',
    width = '100%',
    --opacity = 0.93,
  },
}

-- config.font = wezterm.font('MesloLGS Nerd Font Mono', { weight = 'Medium' })
-- config.freetype_load_flags = 'NO_HINTING'
config.font = wezterm.font('Fira Code', { weight = 'Regular' })
config.font_size = 16.0
config.line_height = 1.2
config.cell_width = 1

config.use_fancy_tab_bar = false
config.tab_bar_at_bottom = true
config.hide_tab_bar_if_only_one_tab = false
config.show_new_tab_button_in_tab_bar = true

config.window_padding = {
  left = 8,
  right = 0,
  top = 8,
  bottom = 0,
}

config.window_frame = {
  --   border_left_width = '0.1cell',
  --   border_right_width = '0.1cell',
  --   border_bottom_height = '0.05cell',
  border_top_height = '0.05cell',
  --   border_left_color = '#212121',
  --   border_right_color = '#212121',
  --   border_bottom_color = '#181818',
  border_top_color = '#282828',
}

config.window_decorations = 'RESIZE'
--config.window_background_opacity = 0.93
config.macos_window_background_blur = 50

-- Actions
wezterm.on('update-right-status', function(window, pane)
  window:set_right_status(window:active_workspace())
end)

config.keys = {
  -- Toggle full screen
  {
    key = 'n',
    mods = 'SHIFT|CTRL',
    action = act.ToggleFullScreen,
  },
  -- Create new tab
  {
    key = 't',
    mods = 'SHIFT|ALT',
    action = act.SpawnTab 'CurrentPaneDomain',
  },
  -- Close current tab
  {
    key = 'q',
    mods = 'SHIFT|ALT',
    action = act.CloseCurrentTab { confirm = true },
  },
  -- Move through tabs
  {
    key = '[',
    mods = 'ALT',
    action = act.ActivateTabRelative(-1)
  },
  {
    key = ']',
    mods = 'ALT',
    action = act.ActivateTabRelative(1)
  },
  -- Switch tabs around
  {
    key = '{',
    mods = 'SHIFT|ALT',
    action = act.MoveTabRelative(-1)
  },
  {
    key = '}',
    mods = 'SHIFT|ALT',
    action = act.MoveTabRelative(1)
  },
  -- TODO: splits
  -- https://wezfurlong.org/wezterm/config/lua/keyassignment/SplitPane.html
}

-- and finally, return the configuration to wezterm
return config
