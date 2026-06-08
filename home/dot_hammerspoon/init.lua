-- https://github.com/twpayne/dotfiles/blob/master/home/dot_hammerspoon/init.lua
-- https://github.com/artnc/dotfiles/blob/master/hammerspoon/init.lua

-- Auto-reload Hammerspoon config
hs.alert("Config reloaded")
_configWatcher = hs.pathwatcher.new("~/.hammerspoon/init.lua", function()
  hs.reload()
end):start()

hs.grid.setGrid("4x4")
hs.grid.setMargins({ 0, 0 })
-- hs.window.animationDuration = 0

local grid = {
  leftHalf = "0,0 2x4",
  rightHalf = "2,0 2x4",
  leftTopHalf = "0,0 2x2",
  leftBottomHalf = "0,2 2x2",
  rightTopHalf = "2,0 2x2",
  rightBottomHalf = "2,2 2x2",
  maximize = "0,0 4x4",
}

function launchOrFocus(app)
  return function()
    hs.application.launchOrFocus(app)
  end
end

function moveFrontmostWindow(where)
  return function()
    local window = hs.window.frontmostWindow()
    local screen = window:screen()
    hs.grid.set(window, where, screen)
  end
end

local bindings = {
  [{ "cmd", "ctrl" }] = {
    t = launchOrFocus("Ghostty"),
    f = launchOrFocus("ForkLift"),
    e = launchOrFocus("Sublime Text"),
    g = launchOrFocus("Sublime Merge"),
    m = launchOrFocus("Messages"),
    b = launchOrFocus("Google Chrome"),
    a = launchOrFocus("Activity Monitor"),
    c = launchOrFocus("Pixie"),
  },

  -- [{ "alt", "ctrl" }] = {
  --   n = moveFrontmostWindow(grid.leftHalf),
  --   m = moveFrontmostWindow(grid.rightHalf),
  --   u = moveFrontmostWindow(grid.leftTopHalf),
  --   j = moveFrontmostWindow(grid.leftBottomHalf),
  --   i = moveFrontmostWindow(grid.rightTopHalf),
  --   k = moveFrontmostWindow(grid.rightBottomHalf),
  --   ["return"] = moveFrontmostWindow(grid.maximize),
  -- },
}
for modifier, keyActions in pairs(bindings) do
  for key, action in pairs(keyActions) do
    hs.hotkey.bind(modifier, tostring(key), action)
  end
end
