local mod = "SUPER"
local resize_step = 50

local function bind(keys, dispatcher, description, flags)
  flags = flags or {}
  flags.description = description
  hl.bind(keys, dispatcher, flags)
end

-- Applications and shell surfaces.
bind(mod .. " + Return", hl.dsp.exec_cmd(LAUNCH .. TERMINAL), "Open Ghostty")
bind(mod .. " + E", hl.dsp.exec_cmd(LAUNCH .. FILE_MANAGER), "Open Dolphin")
bind(mod .. " + B", hl.dsp.exec_cmd(LAUNCH .. BROWSER), "Open Zen Browser")
bind("CONTROL + SHIFT + Escape", hl.dsp.exec_cmd(LAUNCH .. SYSTEM_MONITOR), "Open btop")

bind(mod .. " + R", hl.dsp.exec_cmd(NOCTALIA .. "panel-toggle launcher"), "Application runner")
bind(mod .. " + X", hl.dsp.exec_cmd(NOCTALIA .. "panel-toggle control-center"), "Control center")
bind(mod .. " + Z", hl.dsp.exec_cmd(NOCTALIA .. "settings-toggle"), "Noctalia settings")
bind(mod .. " + V", hl.dsp.exec_cmd(NOCTALIA .. "panel-toggle clipboard"), "Clipboard history")
bind(mod .. " + period", hl.dsp.exec_cmd(NOCTALIA .. "panel-toggle launcher /emo"), "Emoji picker")
bind(mod .. " + A", hl.dsp.exec_cmd(NOCTALIA .. "panel-toggle control-center notifications"), "Notification history")
bind(mod .. " + CONTROL + Escape", hl.dsp.exec_cmd(NOCTALIA .. "session lock"), "Lock session")
bind(mod .. " + ALT + C", hl.dsp.exec_cmd(NOCTALIA .. "panel-toggle session"), "Session menu")

-- Window lifecycle and display mode.
bind(mod .. " + Q", hl.dsp.window.close(), "Close window")
bind(mod .. " + F", hl.dsp.window.fullscreen({ mode = "fullscreen" }), "Toggle fullscreen")
bind(mod .. " + D", hl.dsp.window.fullscreen({ mode = "maximized" }), "Toggle maximize")
bind(mod .. " + ALT + Space", hl.dsp.window.float({ action = "toggle" }), "Toggle floating")
bind("ALT + Tab", hl.dsp.window.cycle_next(), "Cycle windows")
bind(mod .. " + Tab", hl.dsp.exec_cmd(NOCTALIA .. "window-switcher"), "Visual window switcher")

-- Focus windows: Vim keys plus arrows.
local focus_keys = {
  h = "l", j = "d", k = "u", l = "r",
  Left = "l", Down = "d", Up = "u", Right = "r",
}
for key, direction in pairs(focus_keys) do
  bind(mod .. " + " .. key, hl.dsp.focus({ direction = direction }), "Focus " .. direction)
end

-- Move tiled/floating windows.
local move_keys = {
  h = "l", j = "d", k = "u", l = "r",
  Left = "l", Down = "d", Up = "u", Right = "r",
}
for key, direction in pairs(move_keys) do
  bind(mod .. " + SHIFT + " .. key, hl.dsp.window.move({ direction = direction }), "Move window " .. direction)
end

-- Resize active window/split.
local resize_keys = {
  h = { -resize_step, 0 },
  j = { 0, resize_step },
  k = { 0, -resize_step },
  l = { resize_step, 0 },
  Left = { -resize_step, 0 },
  Down = { 0, resize_step },
  Up = { 0, -resize_step },
  Right = { resize_step, 0 },
}
for key, delta in pairs(resize_keys) do
  bind(
    mod .. " + CONTROL + " .. key,
    hl.dsp.window.resize({ x = delta[1], y = delta[2], relative = true }),
    "Resize window"
  )
end

-- Focus a monitor and move the entire current workspace between monitors.
local monitor_keys = {
  h = "l", j = "d", k = "u", l = "r",
  Left = "l", Down = "d", Up = "u", Right = "r",
}
for key, direction in pairs(monitor_keys) do
  bind(mod .. " + ALT + " .. key, hl.dsp.focus({ monitor = direction }), "Focus monitor " .. direction)
  bind(
    mod .. " + ALT + SHIFT + " .. key,
    hl.dsp.workspace.move({ monitor = direction }),
    "Move workspace to monitor " .. direction
  )
end

-- Absolute global workspaces. Repeated number presses never cycle windows.
for i = 1, 10 do
  local key = i % 10
  bind(mod .. " + " .. key, hl.dsp.focus({ workspace = i }), "Workspace " .. i)
  bind(
    mod .. " + SHIFT + " .. key,
    hl.dsp.window.move({ workspace = i, follow = true }),
    "Move window and follow to workspace " .. i
  )
  bind(
    mod .. " + ALT + " .. key,
    hl.dsp.window.move({ workspace = i, follow = false }),
    "Move window silently to workspace " .. i
  )
end

-- Scratchpad.
bind(mod .. " + S", hl.dsp.workspace.toggle_special("scratch"), "Toggle scratchpad")
bind(mod .. " + SHIFT + S", hl.dsp.window.move({ workspace = "special:scratch" }), "Send window to scratchpad")

-- Mouse manipulation.
bind(mod .. " + mouse:272", hl.dsp.window.drag(), "Drag window", { mouse = true })
bind(mod .. " + mouse:273", hl.dsp.window.resize(), "Resize window with mouse", { mouse = true })

-- Monitor and compositor maintenance.
bind(mod .. " + M", hl.dsp.exec_cmd(LAUNCH .. "nwg-displays"), "Open display settings")
bind(mod .. " + ALT + M", hl.dsp.exec_cmd(MONITOR_RECONCILE), "Reconcile connected monitors")
bind(mod .. " + SHIFT + R", hl.dsp.exec_cmd("hyprctl reload"), "Reload Hyprland config")

-- Common laptop lid switch names. Nonexistent switch names are harmless.
bind("switch:on:Lid Switch", hl.dsp.exec_cmd(MONITOR_RECONCILE), "Lid closed", { locked = true })
bind("switch:off:Lid Switch", hl.dsp.exec_cmd(MONITOR_RECONCILE), "Lid opened", { locked = true })
bind("switch:on:Lid Switch 1", hl.dsp.exec_cmd(MONITOR_RECONCILE), "Lid closed", { locked = true })
bind("switch:off:Lid Switch 1", hl.dsp.exec_cmd(MONITOR_RECONCILE), "Lid opened", { locked = true })

-- Hardware controls handled by Noctalia.
bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd(NOCTALIA .. "volume-up"), "Volume up", { locked = true, repeating = true })
bind("XF86AudioLowerVolume", hl.dsp.exec_cmd(NOCTALIA .. "volume-down"), "Volume down", { locked = true, repeating = true })
bind("XF86AudioMute", hl.dsp.exec_cmd(NOCTALIA .. "volume-mute"), "Mute audio", { locked = true })
bind("XF86AudioMicMute", hl.dsp.exec_cmd(NOCTALIA .. "mic-mute"), "Mute microphone", { locked = true })
bind("XF86AudioPlay", hl.dsp.exec_cmd(NOCTALIA .. "media toggle"), "Play/pause", { locked = true })
bind("XF86AudioPause", hl.dsp.exec_cmd(NOCTALIA .. "media toggle"), "Play/pause", { locked = true })
bind("XF86AudioNext", hl.dsp.exec_cmd(NOCTALIA .. "media next"), "Next track", { locked = true })
bind("XF86AudioPrev", hl.dsp.exec_cmd(NOCTALIA .. "media previous"), "Previous track", { locked = true })
bind("XF86MonBrightnessUp", hl.dsp.exec_cmd(NOCTALIA .. "brightness-up"), "Brightness up", { locked = true, repeating = true })
bind("XF86MonBrightnessDown", hl.dsp.exec_cmd(NOCTALIA .. "brightness-down"), "Brightness down", { locked = true, repeating = true })

-- Screenshots and color picking.
bind("Print", hl.dsp.exec_cmd(NOCTALIA .. "screenshot-region"), "Region screenshot")
bind(mod .. " + Print", hl.dsp.exec_cmd(NOCTALIA .. "screenshot-fullscreen"), "Fullscreen screenshot")
bind(mod .. " + P", hl.dsp.exec_cmd("hyprpicker -a"), "Pick color")
