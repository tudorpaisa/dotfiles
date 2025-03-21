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

  for _, lang in ipairs({ "cs", "fsharp", "vb" }) do
    dap.configurations[lang] = {
      {
        type = "netcoredbg",
        name = "Launch - netcoredbg",
        request = "launch",
        program = function()
            return vim.fn.input('Path to dll', vim.fn.getcwd() .. '/', 'file')
            -- return vim.ui.input({prompt = 'Path to dll', default = vim.fn.getcwd() .. '/', completion = "file"}, function() end)
        end,
        cwd = "${workspaceFolder}"
      },
    }
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
