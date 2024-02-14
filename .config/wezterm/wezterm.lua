local wezterm = require 'wezterm'
local act = wezterm.action






local config = {}

config.front_end = "WebGpu"

config.window_decorations = "RESIZE"
config.window_padding = {
    left = 20,
    right = 20,
    top = 15,
    bottom = 15,
  }

config.font = wezterm.font_with_fallback {
  "JetBrainsMono Nerd Font",
  "SFMono Nerd Font",
  "MesloLGS NF",
}

config.font_size = 16.0
config.command_palette_font_size = 16.0
config.adjust_window_size_when_changing_font_size = false

config.color_scheme = 'Monokai Remastered'
local bg = wezterm.get_builtin_color_schemes()[config.color_scheme].background

config.colors = {
  tab_bar = {
    background = bg,

    active_tab = {
      bg_color = '#2b2042',
      fg_color = '#c0c0c0',
      intensity = 'Bold',
    },

    inactive_tab = {
      bg_color = bg,
      fg_color = '#555',
    },

    inactive_tab_hover = {
      bg_color = bg,
      fg_color = '#c0c0c0',
      intensity = 'Bold',
    },

    new_tab = {
      bg_color = bg,
      fg_color = '#c0c0c0',
    },

    new_tab_hover = {
      bg_color = bg,
      fg_color = '#c0c0c0',
    },
  },
}

config.inactive_pane_hsb = {
  saturation = 0.1,
  brightness = 1,
}

config.use_fancy_tab_bar = false
config.tab_max_width = 32
config.hide_tab_bar_if_only_one_tab = true




config.scrollback_lines = 10000

config.use_dead_keys = false
config.send_composed_key_when_left_alt_is_pressed = true
config.send_composed_key_when_right_alt_is_pressed = false

config.keys = {
  { key = 'd',          mods = 'CMD', action = act.SplitHorizontal },
  { key = 'd',          mods = 'CMD|SHIFT', action = act.SplitVertical },
  { key = 'LeftArrow',  mods = 'CMD|ALT', action = act.ActivatePaneDirection 'Left' },
  { key = 'RightArrow', mods = 'CMD|ALT', action = act.ActivatePaneDirection 'Right' },
  { key = 'UpArrow',    mods = 'CMD|ALT', action = act.ActivatePaneDirection 'Up' },
  { key = 'DownArrow',  mods = 'CMD|ALT', action = act.ActivatePaneDirection 'Down' },
  { key = "+",          mods = "CMD", action = "IncreaseFontSize" },
  { key = "-",          mods = "CMD", action = "DecreaseFontSize" },
  { key = "0",          mods = "CMD", action = "ResetFontSize" },
  -- Make Option-Left/right backward-/foreward-word
  {key="LeftArrow",     mods="OPT", action=wezterm.action{SendString="\x1bb"}},
  {key="RightArrow",    mods="OPT", action=wezterm.action{SendString="\x1bf"}},
  {key="LeftArrow",     mods="CMD", action=wezterm.action{SendString="^A"}},
  {key="RightArrow",    mods="CMD", action=wezterm.action{SendString="^E"}},
}






-- function tab_title(tab_info)
--   local title = tab_info.tab_title
--   -- if the tab title is explicitly set, take that
--   if title and #title > 0 then
--     return title
--   end
--   -- Otherwise, use the title from the active pane in that tab
--   return tab_info.active_pane.title
-- end

-- wezterm.on('format-tab-title',
--   function(tab, tabs, panes, config, hover)

--     local title = string.format("  %s: %s  ", tab.tab_index + 1, tab.tab_info.tab_title)
--     title = wezterm.truncate_right(title, config.tab_max_width - 2)

--     return {{ Text = title }}
--   end
-- )









return config
