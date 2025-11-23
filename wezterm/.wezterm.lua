-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices.
config.default_prog = { 'pwsh.exe' }

-- For example, changing the initial geometry for new windows:
config.initial_cols = 120
config.initial_rows = 28

-- or, changing the font size and color scheme.
config.font = wezterm.font('JetBrainsMonoNL Nerd Font', { weight = 'DemiBold' })
config.font_size = 12
config.color_scheme = 'Catppuccin Mocha'

config.prefer_egl = true

-- keymap
config.disable_default_key_bindings = true
config.leader = { key = 'a', mods = 'CTRL', timeout_milliseconds = 1000 }
local act = wezterm.action

config.keys = {
  { key = 't',   mods = 'ALT',          action = act.SpawnTab 'CurrentPaneDomain' },
  { key = 'w',   mods = 'ALT',          action = act.CloseCurrentPane { confirm = true } },
  { key = 'q',   mods = 'LEADER',       action = act.CloseCurrentPane { confirm = true } },
  { key = "v",   mods = "CTRL|SHIFT",   action = act.PasteFrom 'Clipboard' },
  { key = 'Tab', mods = 'CTRL',         action = act.ActivateTabRelative(1) },
  { key = 's',   mods = 'LEADER',       action = act.SplitVertical { domain = 'CurrentPaneDomain' } },
  { key = 'v',   mods = 'LEADER',       action = act.SplitHorizontal { domain = 'CurrentPaneDomain' } },
  { key = "h",   mods = "LEADER",       action = wezterm.action { ActivatePaneDirection = "Left" } },
  { key = "j",   mods = "LEADER",       action = wezterm.action { ActivatePaneDirection = "Down" } },
  { key = "k",   mods = "LEADER",       action = wezterm.action { ActivatePaneDirection = "Up" } },
  { key = "l",   mods = "LEADER",       action = wezterm.action { ActivatePaneDirection = "Right" } },
  { key = "H",   mods = "LEADER|SHIFT", action = wezterm.action { AdjustPaneSize = { "Left", 5 } } },
  { key = "J",   mods = "LEADER|SHIFT", action = wezterm.action { AdjustPaneSize = { "Down", 5 } } },
  { key = "K",   mods = "LEADER|SHIFT", action = wezterm.action { AdjustPaneSize = { "Up", 5 } } },
  { key = "L",   mods = "LEADER|SHIFT", action = wezterm.action { AdjustPaneSize = { "Right", 5 } } },
  { key = "c",   mods = "SHIFT|CTRL",   action = wezterm.action.CopyTo 'Clipboard' },
}

-- Finally, return the configuration to wezterm:
return config
