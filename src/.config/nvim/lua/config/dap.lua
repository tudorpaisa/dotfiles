local langs = require("config.languages")
local dap = require("dap")
local ui = require("dapui")
local dap_virtual_text = require("nvim-dap-virtual-text")
local async = require("plenary.async")

--
local input = async.wrap(function(prompt, text, completion, callback)
    vim.ui.input({
        prompt = prompt,
        default = text,
        completion = completion,
    }, callback)
end, 4)

-- Dap Virtual Text
dap_virtual_text.setup()

-- Configurations

-- C#
if langs.dotnet ~= nil and langs.dotnet.enabled == true then
  require("dap").adapters["netcoredbg"] = {
    type = "executable",
    command = vim.fn.exepath("netcoredbg"),
    args = { "--interpreter=vscode" },
    options = {
      detached = false,
    }
  }

  require("dap-cs").setup()
  -- for _, lang in ipairs({ "cs", "fsharp", "vb" }) do
  --   dap.configurations[lang] = {
  --     {
  --       type = "netcoredbg",
  --       name = "Launch - netcoredbg",
  --       request = "launch",
  --       program = function()
  --           return vim.fn.input('Path to dll', vim.fn.getcwd() .. '/', 'file')
  --           -- return vim.ui.input({prompt = 'Path to dll', default = vim.fn.getcwd() .. '/', completion = "file"}, function() end)
  --       end,
  --       cwd = "${workspaceFolder}"
  --     },
  --   }
  -- end

end

-- Clang
if langs.clang ~= nil and langs.clang.enabled == true then
  require("dap").adapters["codelldb"] = {
    type = "server",
    host = "localhost",
    port = "${port}",
    executable = {
      command = "codelldb",
      args = {
        "--port",
        "${port}",
      },
    },
  }
  for _, lang in ipairs({ "c", "cpp" }) do
    dap.configurations[lang] = {
      {
        type = "codelldb",
        request = "launch",
        name = "Launch file",
        program = function()
          return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
        end,
        cwd = "${workspaceFolder}",
      },
      {
        type = "codelldb",
        request = "attach",
        name = "Attach to process",
        pid = require("dap.utils").pick_process,
        cwd = "${workspaceFolder}",
      },
    }
  end
end

-- Typescript
if langs.dotnet ~= nil and langs.dotnet.enabled == true then
  local dap = require("dap")
  if not dap.adapters["pwa-node"] then
    require("dap").adapters["pwa-node"] = {
      type = "server",
      host = "localhost",
      port = "${port}",
      executable = {
        command = "node",
      },
    }
  end
  if not dap.adapters["node"] then
    dap.adapters["node"] = function(cb, config)
      if config.type == "node" then
        config.type = "pwa-node"
      end
      local nativeAdapter = dap.adapters["pwa-node"]
      if type(nativeAdapter) == "function" then
        nativeAdapter(cb, config)
      else
        cb(nativeAdapter)
      end
    end
  end

  local js_filetypes = { "typescript", "javascript", "typescriptreact", "javascriptreact" }

  local vscode = require("dap.ext.vscode")
  vscode.type_to_filetypes["node"] = js_filetypes
  vscode.type_to_filetypes["pwa-node"] = js_filetypes

  for _, language in ipairs(js_filetypes) do
    if not dap.configurations[language] then
      dap.configurations[language] = {
        {
          type = "pwa-node",
          request = "launch",
          name = "Launch file",
          program = "${file}",
          cwd = "${workspaceFolder}",
        },
        {
          type = "pwa-node",
          request = "attach",
          name = "Attach",
          processId = require("dap.utils").pick_process,
          cwd = "${workspaceFolder}",
        },
      }
    end
  end
end


-- Dap UI

ui.setup()

vim.fn.sign_define("DapBreakpoint", { text = "🔴" })

dap.listeners.before.attach.dapui_config = function()
	ui.open()
end
dap.listeners.before.launch.dapui_config = function()
	ui.open()
end
dap.listeners.before.event_terminated.dapui_config = function()
	ui.close()
end
dap.listeners.before.event_exited.dapui_config = function()
	ui.close()
end
