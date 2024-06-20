local wezterm = require 'wezterm'
local act = wezterm.action

local config = {}

if wezterm.config_builder then
  config = wezterm.config_builder()
end


config.front_end = "WebGpu"

config.window_decorations = "RESIZE"
config.window_padding = {
  left = 20,
  right = 20,
  top = 15,
  bottom = 15,
}

config.font = wezterm.font_with_fallback {
  -- "MesloLGL Nerd Font",
  -- "JetBrainsMono Nerd Font",
  -- "SFMono Nerd Font",
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

config.status_update_interval = 1000


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
            hostname = ''
        end
    end

    return hostname
end


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





local process_icons = {
  ['docker'] = wezterm.nerdfonts.linux_docker,
  ['docker-compose'] = wezterm.nerdfonts.linux_docker,
  ['psql'] = wezterm.nerdfonts.dev_postgresql,
  ['kubectl'] = wezterm.nerdfonts.linux_docker,
  ['nvim'] = wezterm.nerdfonts.custom_vim,
  ['make'] = wezterm.nerdfonts.seti_makefile,
  ['vim'] = wezterm.nerdfonts.dev_vim,
  ['go'] = wezterm.nerdfonts.seti_go,
  ['zsh'] = wezterm.nerdfonts.cod_terminal,
  ['bash'] = wezterm.nerdfonts.cod_terminal_bash,
  ['htop'] = wezterm.nerdfonts.mdi_chart_donut_variant,
  ['cargo'] = wezterm.nerdfonts.dev_rust,
  ['sudo'] = wezterm.nerdfonts.fa_hashtag,
  ['lazydocker'] = wezterm.nerdfonts.linux_docker,
  ['git'] = wezterm.nerdfonts.dev_git,
  ['lua'] = wezterm.nerdfonts.seti_lua,
  ['python'] = wezterm.nerdfonts.dev_python,
  ['wget'] = wezterm.nerdfonts.mdi_arrow_down_box,
  ['curl'] = wezterm.nerdfonts.fa_angle_double_right,
  ['ruby'] = wezterm.nerdfonts.cod_ruby,
  ['node'] = wezterm.nerdfonts.dev_nodejs_small,
  ['ssh'] = wezterm.nerdfonts.md_remote_desktop,
}




local function get_process_icon(tab)
  local process_name = string.lower(tab.active_pane.foreground_process_name:match("([^/\\]+)$"))
  local icon = process_icons[process_name] or wezterm.nerdfonts.seti_checkbox_unchecked

  return icon
end


function tab_title(tab_info)
  local title = tab_info.tab_title
  if title and #title > 0 then -- explicitly set
    return title
  end
  return tab_info.active_pane.title --title from the active pane
end



wezterm.on('format-tab-title', function(tab, tabs, panes, config, hover, max_width)
  local has_unseen_output = false
  local is_zoomed = false

  for _, pane in ipairs(tab.panes) do
    if not tab.is_active and pane.has_unseen_output then
      has_unseen_output = true
    end
    if pane.is_zoomed then
      is_zoomed = true
    end
  end

  local ttitle = tab_title(tab)
  local process_icon = get_process_icon(tab)

  if has_unseen_output then
    title = string.format(' %s %s  %s ', process_icon, wezterm.nerdfonts.fa_asterisk, ttitle)
  else
    title = string.format(' %s  %s ', process_icon, ttitle)
  end

  return wezterm.format({
    { Attribute = { Intensity = 'Bold' } },
    { Text = title }
  })
end)


return config
