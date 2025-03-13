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
  }
}
