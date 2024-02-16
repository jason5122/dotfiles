hs.grid.setGrid("4x4")
hs.grid.setMargins({ 0, 0 })
hs.window.animationDuration = 0

local grid = {
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

-- https://github.com/twpayne/dotfiles/blob/master/home/dot_hammerspoon/init.lua
local bindings = {
  [{ "cmd", "ctrl" }] = {
    t = launchOrFocus("Alacritty"),
    f = launchOrFocus("Finder"),
    s = launchOrFocus("Sublime Text"),
    m = launchOrFocus("Messages"),
    r = launchOrFocus("Reminders"),
    e = launchOrFocus("Mail"),
    b = launchOrFocus("Chromium"),
    a = launchOrFocus("Activity Monitor"),
    c = launchOrFocus("Pixie"),
    d = launchOrFocus("Quartz Debug"),
    i = launchOrFocus("Simple Text"),
  },

  [{ "alt", "ctrl" }] = {
    u = moveFrontmostWindow(grid.leftTopHalf),
    j = moveFrontmostWindow(grid.leftBottomHalf),
    i = moveFrontmostWindow(grid.rightTopHalf),
    k = moveFrontmostWindow(grid.rightBottomHalf),
    ["return"] = moveFrontmostWindow(grid.maximize),
  },
}
for modifier, keyActions in pairs(bindings) do
  for key, action in pairs(keyActions) do
    hs.hotkey.bind(modifier, tostring(key), action)
  end
end

function reloadConfig(files)
  for _, file in pairs(files) do
    if file:sub(-4) == ".lua" then
      hs.reload()
    end
  end
end
hs.pathwatcher.new(os.getenv("HOME") .. "/.config/hammerspoon/", reloadConfig):start()
