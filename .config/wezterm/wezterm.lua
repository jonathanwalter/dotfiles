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
config.color_scheme = 'catppuccin-mocha'

local bg = wezterm.get_builtin_color_schemes()[config.color_scheme].background
local fg = wezterm.get_builtin_color_schemes()[config.color_scheme].foreground
local titlebar_bg = 'rgb(20, 20, 35)'

config.window_frame = {
  font = wezterm.font { family = 'JetBrainsMono Nerd Font', weight = 'Bold' },
  font_size = 16.0,
  active_titlebar_bg = titlebar_bg,
  inactive_titlebar_bg = titlebar_bg,
}

config.colors = {
  tab_bar = {
    background = bg,

    active_tab = {
      bg_color = bg,
      fg_color = fg,
      intensity = 'Bold',
    },

    inactive_tab = {
      bg_color = titlebar_bg,
      fg_color = '#555',
    },

    inactive_tab_edge = titlebar_bg,

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
  -- Make ctrl/Option-Left/right backward-/foreward-word
  { key="LeftArrow",     mods="OPT", action = act  { SendString="\x1bb" } },
  { key="RightArrow",    mods="OPT", action = act  { SendString="\x1bf" } },
  { key="LeftArrow",     mods="CTRL", action = act { SendString="\x1bb" } },
  { key="RightArrow",    mods="CTRL", action = act { SendString="\x1bf" } },
  { key="LeftArrow",     mods="CMD", action = act.SendKey { key = 'a', mods = 'CTRL' } },
  { key="RightArrow",    mods="CMD", action = act.SendKey { key = 'e', mods = 'CTRL' } },

  { key="LeftArrow",     mods="CMD|SHIFT", action=act.ActivateTabRelative(-1) },
  { key="RightArrow",    mods="CMD|SHIFT", action=act.ActivateTabRelative(1) },

}

function current_hostname(pane)
    local procinfo = pane:get_foreground_process_info()
    local name = pane:get_title()
    local hostname = ""

    if procinfo then
        -- ssh hostname: hack using argv
        if name == "ssh" then
            local argv = procinfo.argv
            for i = 2, #argv do
                hostname = hostname .. tostring(argv[i]) .. ' '
            end
            hostname = hostname:sub(1, -2) -- remove trailing space
        -- lima virtual machine
        elseif string.find(name, "lima-") then
            hostname = string.match(name, "lima%-(.-):")
            hostname = "lima[" .. hostname .. "]"
        -- assume localhost
        else
            hostname = 'localhost'
        end
    end

    return hostname
end

config.status_update_interval = 1000

wezterm.on('update-right-status', function(window, pane)
    local status_hostname = current_hostname(pane)
    local status_fg = 'White'

    if status_hostname == 'localhost' then
        status_fg = 'Green'
    elseif string.match(status_hostname, "lima%[") then
        status_fg = 'Blue'
    elseif pane:get_title() == "ssh" then
        status_fg = 'Red'
    end

    window:set_right_status(wezterm.format {
        { Attribute = { Intensity = 'Bold' } },
        { Foreground = { AnsiColor = status_fg } },
        { Background = { Color = titlebar_bg } },
        { Text = status_hostname .. '  ' }
    })
end)









return config
