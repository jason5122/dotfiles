function open_app(name)
    return function()
        hs.application.launchOrFocus(name)
        if name == 'Finder' then
            hs.appfinder.appFromName(name):activate()
        end
    end
end

--- quick open applications
hs.hotkey.bind({"cmd", "ctrl"}, "T", open_app("Alacritty"))
hs.hotkey.bind({"cmd", "ctrl"}, "F", open_app("Finder"))
hs.hotkey.bind({"cmd", "ctrl"}, "S", open_app("Sublime Text.app"))
hs.hotkey.bind({"cmd", "ctrl"}, "M", open_app("Messages.app"))

hs.hotkey.bind({"cmd", "ctrl"}, "R", open_app("Reminders.app"))
hs.hotkey.bind({"cmd", "ctrl"}, "E", open_app("Mail.app"))
hs.hotkey.bind({"cmd", "ctrl"}, "I", open_app("ObjCppApp.app"))
-- hs.hotkey.bind({"cmd", "ctrl"}, "U", open_app("window-thumbnails.app"))
hs.hotkey.bind({"cmd", "ctrl"}, "B", open_app("Chromium.app"))
-- hs.hotkey.bind({"cmd", "ctrl"}, "L", open_app("Lapce.app"))
-- hs.hotkey.bind({"cmd", "ctrl"}, "Z", open_app("Zed.app"))
-- hs.hotkey.bind({"cmd", "ctrl"}, "T", open_app("Warp.app"))
hs.hotkey.bind({"cmd", "ctrl"}, "C", open_app("Pixie.app"))
hs.hotkey.bind({"cmd", "ctrl"}, "D", open_app("Quartz Debug.app"))
hs.hotkey.bind({"cmd", "ctrl"}, "A", open_app("Activity Monitor.app"))
