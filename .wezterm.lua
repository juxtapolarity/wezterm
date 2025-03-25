-- Pull in the wezterm API
local wezterm = require 'wezterm'
local mux = wezterm.mux
local act = wezterm.action

-- This will hold the configuration.
local config = wezterm.config_builder()

wezterm.on('update-right-status', function(window, pane)
  window:set_right_status(window:active_workspace())
end)

-- This is where you actually apply your config choices
-- Base font setting for regular text
config.font = wezterm.font { family = 'FiraCode Nerd Font' }
config.font_size = 11  -- Adjust to your preferred size

-- Font rules for different styles (bold, semi-bold, etc.)
config.font_rules = {
  -- Rule for bold text
  {
    intensity = 'Bold',
    font = wezterm.font {
      family = 'FiraCode Nerd Font',  -- Use the correct family name
      weight = 'Bold',  -- This will map to FiraCodeNerdFont-Bold
    },
  },
}

-- Ensure bold text is rendered correctly
config.bold_brightens_ansi_colors = true

-- color scheme
config.color_scheme = 'Tokyo Night (Gogh)'

-- transparency
config.window_background_opacity = 0.9
-- config.macos_window_background_blur = 20

-- tab bar
config.enable_tab_bar = false

-- title bar
config.window_decorations = "RESIZE"
-- config.window_decorations = "NONE"

-- full screen
config.keys = {
  {
    key = 'F11',
    mods = 'SHIFT',
    action = wezterm.action.ToggleFullScreen,
  },
  { key = 'F9', mods = 'ALT', action = wezterm.action.ShowTabNavigator },
}

-- wezterm.on('gui-startup', function(cmd)
--   -- allow `wezterm start -- something` to affect what we spawn
--   -- in our initial window
--   local args = {}
--   if cmd then
--     args = cmd.args
--   end
--
--   -- workspace: main
--   local tab, build_pane, window = mux.spawn_window {
--     workspace = 'main',
--     cwd = wezterm.home_dir,
--     args = args,
--   }
--
--   -- workspace: main 2
--   local tab, build_pane, window = mux.spawn_window {
--     workspace = 'main2',
--     cwd = wezterm.home_dir,
--     args = args,
--   }
--
--   -- workspace: obsidian
--   local obsidian_dir = wezterm.home_dir .. '/obsidian'
--   local tab, build_pane, window = mux.spawn_window {
--     workspace = 'obsidian',
--     cwd = obsidian_dir,
--     args = args,
--   }
--
--   -- Set a workspace for coding on a current project
--   -- Top pane is for the editor, bottom pane is for the build tool
--   local project_dir = wezterm.home_dir .. '/.config/nvim'
--   local tab, build_pane, window = mux.spawn_window {
--     workspace = 'neovim',
--     cwd = project_dir,
--     args = args,
--   }
--   local editor_pane = build_pane:split {
--     direction = 'Right',
--     size = 0.6,
--     cwd = project_dir,
--   }
--
--   -- We want to startup in the coding workspace
--   mux.set_active_workspace 'main'
-- end)

config.keys = {
  -- Switch to the default workspace
  {
    key = '1',
    mods = 'CTRL|ALT',
    action = act.SwitchToWorkspace {
      name = 'main',
    },
  },
  -- Switch to the default 2 workspace
  {
    key = '2',
    mods = 'CTRL|ALT',
    action = act.SwitchToWorkspace {
      name = 'btop',
    },
  },
  -- Switch to the obsidian workspace
  {
    key = '3',
    mods = 'CTRL|ALT',
    action = act.SwitchToWorkspace {
      name = 'obsidian',
    },
  },
  -- Switch to the obsidian workspace
  {
    key = '4',
    mods = 'CTRL|ALT',
    action = act.SwitchToWorkspace {
      name = 'neovim',
    },
  },
}

-- show launcher (only tabs)
-- config.keys = {
--   {
--     key = '9',
--     mods = 'ALT',
--     action = wezterm.action.ShowLauncherArgs { flags = 'FUZZY|TABS' },
--   },
-- }

-- and finally, return the configuration to wezterm
return config
