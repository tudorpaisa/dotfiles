return {
  {
    "mason-org/mason.nvim",
  },

  {
    "mason-org/mason-lspconfig.nvim",
    dependencies = {
      "mason-org/mason.nvim",
      "neovim/nvim-lspconfig",
      "hrsh7th/cmp-nvim-lsp",
    },
  },

  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    dependencies = {
      "mason-org/mason.nvim",
      "mfussenegger/nvim-dap",
    },
    config = function()
      local lang_conf = require('config.languages')
      local ensure_installed = {}
      for k, v in pairs(lang_conf) do
        if v.enabled == true and v.linter ~= nil then
          table.insert(ensure_installed, v.linter)
        end

        if v.enabled == true and v.formatter ~= nil then
          table.insert(ensure_installed, v.formatter)
        end

        if v.enabled == true and v.debugger ~= nil then
          table.insert(ensure_installed, v.debugger)
        end
      end

      require("mason-tool-installer").setup({
        ensure_installed = ensure_installed
      })
    end
  },

  {
    "mfussenegger/nvim-lint"
  },

  {
    "mhartington/formatter.nvim"
  }
}
