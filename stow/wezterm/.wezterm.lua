-- Pull in the wezterm APIwezterm
local wezterm = require("wezterm")

-- This table will hold the configuration.
local config = {}

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
  config = wezterm.config_builder()
end

-- This is where you actually apply your config choices

-- For example, changing the color scheme:
config.color_scheme = "Tokyo Night Storm" -- 'AdventureTime'

config.hide_tab_bar_if_only_one_tab = true

config.font = wezterm.font(
  "Victor Mono Nerd Font" -- 14
  -- "Monofur Nerd Font" -- 15
)
config.font_size = 14

config.use_fancy_tab_bar = false

-- This function returns the suggested title for a tab.
-- It prefers the title that was set via `tab:set_title()`
-- or `wezterm cli set-tab-title`, but falls back to the
-- title of the active pane in that tab.
function TabTitle(tab_info)
  local title = tab_info.tab_title
  -- if the tab title is explicitly set, take that
  if title and #title > 0 then
    return title
  end
  -- Otherwise, use the title from the active pane
  -- in that tab
  return tab_info.active_pane.title
end

wezterm.on("format-tab-title", function(tab)
  local title = TabTitle(tab)
  -- title = title.sub(title, 1, 10)

  -- if title == "nvim" then
  --   title = ""
  -- end

  if tab.is_active then
    title = " (" .. title .. ") "
  else
    title = "  " .. title .. "  "
  end

  return title
end)

-- and finally, return the configuration to wezterm
return config
