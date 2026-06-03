return {
  codecompanion = {
    enabled = true,
    adapter = "claude_code",
    model = "Default (recommended)",
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
