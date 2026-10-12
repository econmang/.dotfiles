-- Persistent global workspaces: number keys always address the same workspace.
-- They are intentionally not pinned to monitors, so a whole workspace can be
-- moved between monitors during a session.
for i = 1, 10 do
  hl.workspace_rule({
    workspace = tostring(i),
    persistent = true,
  })
end
