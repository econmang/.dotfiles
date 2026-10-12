hl.config({
  general = {
    gaps_in = 5,
    gaps_out = 10,
    border_size = 2,
    resize_on_border = true,
    extend_border_grab_area = 10,
    layout = "dwindle",
    col = {
      active_border = {
        colors = { BLUE_BRIGHT, BLUE_DARK },
        angle = 45,
      },
      inactive_border = SLATE,
    },
  },

  decoration = {
    rounding = 12,
    rounding_power = 2,
    active_opacity = 0.97,
    inactive_opacity = 0.90,
    fullscreen_opacity = 1.0,
    dim_special = 0.25,
    shadow = {
      enabled = true,
      range = 8,
      render_power = 3,
      color = 0xaa080b10,
    },
    blur = {
      enabled = true,
      size = 5,
      passes = 3,
      vibrancy = 0.17,
      special = true,
      popups = true,
    },
  },

  animations = {
    enabled = true,
  },

  dwindle = {
    preserve_split = true,
  },

  misc = {
    force_default_wallpaper = 0,
    disable_hyprland_logo = true,
    middle_click_paste = false,
    enable_swallow = true,
    swallow_regex = "(ghostty|kitty|[Kk]onsole|Alacritty|gnome-terminal|xfce[0-9]?-terminal)",
    vrr = 3,
  },

  xwayland = {
    force_zero_scaling = true,
  },

  ecosystem = {
    no_update_news = true,
    no_donation_nag = true,
  },
})

-- Let Noctalia animate its own surfaces while retaining Hyprland blur.
hl.layer_rule({
  name = "noctalia",
  match = {
    namespace = "^noctalia-(bar-.+|notification|dock|panel|attached-panel|osd|window-switcher)$",
  },
  no_anim = true,
  ignore_alpha = 0.5,
  blur = true,
  blur_popups = true,
})
