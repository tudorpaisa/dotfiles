local langs = require("config.languages")

if not langs["dotnet"] then
  return {}
end

if not langs["dotnet"]["enabled"] then
  return {}
end

return {
  { 'BatMichoo/nvim-dap-cs', dependencies = { 'mfussenegger/nvim-dap' } },
  { "Hoffs/omnisharp-extended-lsp.nvim", lazy = true },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = { ensure_installed = { "c_sharp" } },
  },
  {
    "nvimtools/none-ls.nvim",
    optional = true,
    opts = function(_, opts)
      local nls = require("null-ls")
      opts.sources = opts.sources or {}
      table.insert(opts.sources, nls.builtins.formatting.csharpier)
    end,
  },
}
