return {
  codecompanion = {
    enabled = true,
    adapter = "copilot",
    model = "claude-sonnet-4.6",
    -- adapter = "gemini",
    -- model = "gemini-3-flash-preview",
    log_level = "TRACE"
  },
  mcphub = {
    enabled = false,
    bundled_build = false, -- Enable when global binary installations aren't possible.
  },
  copilot = {
    enabled = true,
  }
}
