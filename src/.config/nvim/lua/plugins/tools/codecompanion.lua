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
  },
  tools = {
    read_file = {
      require_approval_before = false,
    },
    grep_file = {
      require_approval_before = false,
    },
    file_search = {
      require_approval_before = false,
    },
  }
}

local dependencies = {
  "nvim-lua/plenary.nvim",
  "nvim-treesitter/nvim-treesitter",
}
local extensions = {}

-- McpHub setup
if tools["mcphub"] and tools["mcphub"]["enabled"] then
  table.insert(dependencies, "ravitemer/mcphub.nvim")
  extensions["mcphub"] = {
    callback = "mcphub.extensions.codecompanion",
    opts = {
      -- MCP Tools
      make_tools = true,              -- Make individual tools (@server__tool) and server groups (@server) from MCP servers
      show_server_tools_in_chat = true, -- Show individual tools in chat completion (when make_tools=true)
      add_mcp_prefix_to_tool_names = false, -- Add mcp__ prefix (e.g `@mcp__github`, `@mcp__neovim__list_issues`)
      show_result_in_chat = true,      -- Show tool results directly in chat buffer

      -- MCP Resources
      make_vars = true,                -- Convert MCP resources to #variables for prompts
      -- MCP Prompts
      make_slash_commands = true,      -- Add MCP prompts as /slash commands
    }
  }
end

local out = { }

-- Copilot setup
if tools["copilot"] and tools["copilot"]["enabled"] then
  table.insert(dependencies, "github/copilot.vim")
  table.insert(
    out,
    {
      "github/copilot.vim",
      config = function ()
        vim.g.copilot_filetypes = { ["*"] = false, }
        vim.g.copilot_no_tab_map = true

        -- Toggle suggestions
        vim.keymap.set(
          'n',
          '<leader>ao',
          function()
            vim.g.copilot_filetypes = { ["*"] = not vim.g.copilot_filetypes["*"] }
            vim.g.copilot_no_tab_map = not vim.g.copilot_no_tab_map
          end,
          {
            desc = "Toggle OpenAI suggestions",
            expr = true,
            replace_keycodes = false,
        })

      end
    }
  )
end


table.insert(
  out,
  {
    "olimorris/codecompanion.nvim",
    version = "^19.0.0",
    opts = {
    },
    dependencies = dependencies,
    config = function ()
      require("codecompanion").setup({
        extensions = extensions,
        interactions = {
          chat = default_adapter,
          inline = default_adapter,
          cmd = default_adapter,
          background = default_adapter,
        },
        strategies = {
          chat = {
            opts = {
              require_approval = false,
            }
          }
        },
        opts = {
          log_level = tools["codecompanion"]["log_level"],
        },
      })

      if tools["mcphub"] and tools["mcphub"]["enabled"] then
        require("mcphub").setup({
          port = 37373,
        })
      end
    end
  }
)

return out
