local tools = require("config.tools")

if not tools["codecompanion"] then
  return {}
end

if not tools["codecompanion"]["enabled"] then
  return {}
end

local default_adapter = {
  adapter = {
    name = tools["codecompanion"]["adapter"],
    model = tools["codecompanion"]["model"],
  }
}

return {
  {
    "olimorris/codecompanion.nvim",
    version = "^18.0.0",
    opts = {
      interactions = {
        chat = default_adapter,
        inline = default_adapter,
        cmd = default_adapter,
        background = default_adapter,
      },
      opts = {
        log_level = tools["codecompanion"]["log_level"],
      },
    },
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
    },
  },
}
