return {
  {
    "williamboman/mason.nvim"
  },

  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = {
      "neovim/nvim-lspconfig",
      "hrsh7th/cmp-nvim-lsp",
    },

    config = function()

      local capabilities = vim.lsp.protocol.make_client_capabilities()
      capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

      require('mason').setup()
      local mason_lspconfig = require 'mason-lspconfig'
      
      lang_conf = require('config.languages')
      local ensure_installed = {}
      for k, v in pairs(lang_conf) do
        if v.enabled == true and v.lsp ~= nil then
          table.insert(ensure_installed, v.lsp)
        end
      end

      mason_lspconfig.setup {
          ensure_installed = ensure_installed
      }

      if lang_conf.python ~= nil then
        if lang_conf.python.enabled == true and lang_conf.python.lsp == "pyright" then
          require("lspconfig").pyright.setup {
              capabilities = capabilities,
          }
        end
      end

          require("lspconfig").omnisharp.setup {
              capabilities = capabilities,
          }
      if lang_conf.dotnet ~= nil then
        if lang_conf.dotnet.enabled == true and lang_conf.dotnet.lsp == "omnisharp" then
        end
      end

    end
  },

  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    dependencies = {
      "williamboman/mason.nvim",
      "mfussenegger/nvim-dap",
    },
    config = function()

      lang_conf = require('config.languages')
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
