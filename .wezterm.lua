local wezterm = require 'wezterm'

local config = {}

if wezterm.config_builder then
  config = wezterm.config_builder()
end

config.hide_tab_bar_if_only_one_tab = true

--config.color_scheme = "Github"

config.color_scheme = "One Dark (Gogh)"
-- the one dark foreground is too low contrast for my colorblind eyes
config.colors = {
  foreground = 'silver',
}
--config.color_scheme = "One Light (Gogh)"
--config.color_scheme = "Nord Light (Gogh)"


--config.font = wezterm.font 'Fira Code'
config.font = wezterm.font 'Iosevka'
config.font_size = 16

config.keys = {
  -- remap ctrl+pagdown/pageup to alt+pagedown/pageup; the default interferes
  -- with vim bindings for switching tabs
  { key = 'PageDown', mods = 'ALT', action = wezterm.action.ActivateTabRelative(1) },
  { key = 'PageDown', mods = 'CTRL', action = wezterm.action.DisableDefaultAssignment },
  { key = 'PageUp', mods = 'ALT', action = wezterm.action.ActivateTabRelative(-1) },
  { key = 'PageUp', mods = 'CTRL', action = wezterm.action.DisableDefaultAssignment },
}

return config
