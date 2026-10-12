-- Common dialogs and utility windows should float.
local floating_matches = {
  { class = "^(org\\.kde\\.polkit-kde-authentication-agent-1)$" },
  { class = "^(org\\.kde\\.ark)$" },
  { class = "^(org\\.pulseaudio\\.pavucontrol|blueman-manager|nm-connection-editor)$" },
  { class = "^(xdg-desktop-portal-gtk)$" },
  { class = "^(hyprland-share-picker)$" },
  { title = "^(Open|Save As|Choose Files|Authentication Required|File Upload)(.*)$" },
  { title = "^(Picture-in-Picture)(.*)$" },
}

for _, match in ipairs(floating_matches) do
  hl.window_rule({
    match = match,
    float = true,
    center = true,
  })
end

hl.window_rule({
  match = { title = "^([Pp]icture[-\\s]?[Ii]n[-\\s]?[Pp]icture)(.*)$" },
  float = true,
  keep_aspect_ratio = true,
  pin = true,
  size = { "monitor_w*0.28", "monitor_h*0.28" },
})

hl.window_rule({
  match = { class = "^(dev\\.noctalia\\.Noctalia(\\.Settings)?)$" },
  float = true,
  center = true,
  size = { "monitor_w*0.72", "monitor_h*0.76" },
})

-- Keep primary work apps visually crisp even though inactive windows are dimmed.
local opaque_apps = {
  "^(com\\.mitchellh\\.ghostty|ghostty)$",
  "^(zen|zen-browser|firefox)$",
  "^(org\\.kde\\.dolphin)$",
  "^(org\\.kde\\.okular)$",
}

for _, class in ipairs(opaque_apps) do
  hl.window_rule({
    match = { class = class },
    opacity = "1.0 override",
  })
end

-- Ignore applications that ask to maximize themselves automatically.
hl.window_rule({
  name = "suppress-maximize-events",
  match = { class = ".*" },
  suppress_event = "maximize",
})

-- XWayland drag compatibility.
hl.window_rule({
  name = "fix-xwayland-drags",
  match = {
    class = "^$",
    title = "^$",
    xwayland = true,
    float = true,
    fullscreen = false,
    pin = false,
  },
  no_focus = true,
})
