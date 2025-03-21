local langs = require("config.languages")
local language_formatters = {}
local formatters = {
  shfmt = {
    prepend_args = { "-i", "2" },
  },
}

if langs.dotnet ~= nil and langs.dotnet.enabled == true then
  language_formatters["cs"] = { langs.dotnet.formatter }
  formatters["csharpier"] = {
    command = "dotnet-csharpier",
    args = { "--write-stdout" },
  }
end

if langs.python ~= nil and langs.python.enabled == true then
  language_formatters["python"] = { langs.python.formatter }
end

-- Setup plugin
conform = require("conform")
conform.setup({
  -- Define your formatters
  formatters_by_ft = language_formatters,
  -- Set default options
  default_format_opts = {
    lsp_format = "fallback",
  },
  -- Set up format-on-save
  format_on_save = { timeout_ms = 500 },
  -- Customize formatters
  formatters = formatters,
})

-- Format command
vim.api.nvim_create_user_command("FormatBuffer", function(args)
  local range = nil
  if args.count ~= -1 then
    local end_line = vim.api.nvim_buf_get_lines(0, args.line2 - 1, args.line2, true)[1]
    range = {
      start = { args.line1, 0 },
      ["end"] = { args.line2, end_line:len() },
    }
  end
  require("conform").format({ async = true, lsp_format = "fallback", range = range })
end, { range = true })
