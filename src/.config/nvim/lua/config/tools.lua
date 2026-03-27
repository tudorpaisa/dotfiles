return {
  codecompanion = {
    enabled = true,
    adapter = "opencode",
    model = "github-copilot/claude-sonnet-4.6",
    log_level = "TRACE"
  },
  mcphub = {
    enabled = false,
    bundled_build = false, -- Enable when global binary installations aren't possible.
  },
  copilot = {
    enabled = false,
  }
}
