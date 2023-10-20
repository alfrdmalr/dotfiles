local wezterm = require 'wezterm'

local config = {}

if wezterm.config_builder then
  config = wezterm.config_builder()
end

config.hide_tab_bar_if_only_one_tab = true

--config.color_scheme = "Github"

--config.color_scheme = "Ocean (light) (terminal.sexy)"
--config.color_scheme = "Ocean (dark) (terminal.sexy)"

config.color_scheme = "One Dark (Gogh)"
--config.color_scheme = "One Light (Gogh)"

--config.color_scheme = "Nord (base16)"


return config
