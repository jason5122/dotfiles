function launchOrFocus(app)
  return function()
    hs.application.launchOrFocus(app)
  end
end

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
