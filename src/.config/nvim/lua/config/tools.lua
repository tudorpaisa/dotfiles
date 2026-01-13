return {
  codecompanion = {
    enabled = true,
    adapter = "copilot",
    model = "gpt-4.1",
    -- adapter = "gemini",
    -- model = "gemini-3-flash-preview",
    log_level = "TRACE"
  },
  mcphub = {
    enabled = true,
    bundled_build = false, -- Enable when global binary installations aren't possible.
  },
  copilot = {
    enabled = true,
  }
}
