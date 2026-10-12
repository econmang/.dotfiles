hl.config({
  input = {
    kb_layout = "us",
    repeat_rate = 35,
    repeat_delay = 300,
    follow_mouse = 1,
    sensitivity = 0,
    natural_scroll = false,
    touchpad = {
      tap_to_click = true,
      natural_scroll = false,
      disable_while_typing = false,
      tap_and_drag = true,
    },
  },
  gestures = {
    workspace_swipe_create_new = false,
    workspace_swipe_use_r = true,
  },
})

hl.gesture({
  fingers = 3,
  direction = "horizontal",
  action = "workspace",
})
