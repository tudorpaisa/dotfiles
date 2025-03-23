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
    formatter = "luaformatter",
  },
  yaml = {
    enabled = true,
    linter = "yamllint",
    formatter = "yamlfmt",
  },
}
