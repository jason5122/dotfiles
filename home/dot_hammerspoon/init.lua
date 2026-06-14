-- https://github.com/twpayne/dotfiles/blob/master/home/dot_hammerspoon/init.lua
-- https://github.com/artnc/dotfiles/blob/master/hammerspoon/init.lua

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

local function launchOrFocus(app)
  return function()
    hs.application.launchOrFocus(app)
  end
end

local function moveFrontmostWindow(where)
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

  [{ "alt", "ctrl" }] = {
    n = moveFrontmostWindow(grid.leftHalf),
    m = moveFrontmostWindow(grid.rightHalf),
    u = moveFrontmostWindow(grid.leftTopHalf),
    j = moveFrontmostWindow(grid.leftBottomHalf),
    i = moveFrontmostWindow(grid.rightTopHalf),
    k = moveFrontmostWindow(grid.rightBottomHalf),
    ["return"] = moveFrontmostWindow(grid.maximize),
  },
}
for modifier, keyActions in pairs(bindings) do
  for key, action in pairs(keyActions) do
    hs.hotkey.bind(modifier, key, action)
  end
end

-- Hide Ghostty when the last window is closed. This is a pseudo "quit after last window closed",
-- but without actually quitting. Keeping the app open means new windows open quicker.
local ghosttyFilter = hs.window.filter.new("Ghostty")
ghosttyFilter:subscribe(hs.window.filter.windowDestroyed, function()
  local app = hs.application.get("Ghostty")
  if app and #app:visibleWindows() == 0 then
    app:hide()
  end
end)

hs.loadSpoon("ReloadConfiguration")
spoon.ReloadConfiguration:start()
hs.alert.show("Hammerspoon config loaded")
