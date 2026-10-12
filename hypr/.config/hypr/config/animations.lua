hl.curve("easeOutQuint", {
  type = "bezier",
  points = { { 0.23, 1 }, { 0.32, 1 } },
})

hl.curve("quick", {
  type = "bezier",
  points = { { 0.15, 0 }, { 0.10, 1 } },
})

hl.curve("almostLinear", {
  type = "bezier",
  points = { { 0.50, 0.50 }, { 0.75, 1 } },
})

hl.curve("easy", {
  type = "spring",
  mass = 1,
  stiffness = 71.2633,
  dampening = 15.8273644,
})

hl.animation({ leaf = "global", enabled = true, speed = 3, bezier = "quick" })
hl.animation({ leaf = "windows", enabled = true, speed = 3, spring = "easy", style = "slide" })
hl.animation({ leaf = "windowsOut", enabled = true, speed = 2, bezier = "quick", style = "popin 90%" })
hl.animation({ leaf = "fade", enabled = true, speed = 3, bezier = "almostLinear" })
hl.animation({ leaf = "workspaces", enabled = true, speed = 5, bezier = "quick", style = "slide" })
hl.animation({ leaf = "specialWorkspaceIn", enabled = true, speed = 2, bezier = "quick", style = "slide top" })
hl.animation({ leaf = "specialWorkspaceOut", enabled = true, speed = 2, bezier = "quick", style = "slide bottom" })
