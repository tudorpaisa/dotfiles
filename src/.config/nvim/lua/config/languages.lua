return {
  python = {
    enabled = true,
    lsp = "pyright",
    linter = "flake8",
    formatter = "black",
  },
  dotnet = {
    enabled = true,
    lsp = "omnisharp",
    formatter = "csharpier",
    debugger = "netcoredbg",
  },
  lua = {
    enabled = true,
    lsp = "lua_ls",
    linter = "luacheck",
    -- formatter = "luaformatter",
  },
  yaml = {
    enabled = true,
    linter = "yamllint",
    formatter = "yamlfmt",
  },
  html = {
    enabled = true,
    lsp = "html",
  },
  css = {
    enabled = true,
    lsp = "tailwindcss",
  },
  ts = {
    enabled = true,
    lsp = "ts_ls",
    formatter = "prettierd",
    debugger = "js-debug-adapter",
  },
  vue = {
    enabled = true,
    lsp = "volar",
    formatter = "prettierd",
    debugger = "js-debug-adapter",
  },
}
