local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

-- Mason install LSP
require('mason').setup()

local mason_lspconfig = require 'mason-lspconfig'

local lang_conf = require('config.languages')
local ensure_installed = {}
for k, v in pairs(lang_conf) do
  if v.enabled == true and v.lsp ~= nil then
    table.insert(ensure_installed, v.lsp)
  end
end

local function lsp_is_enabled(language, lsp)
  if lang_conf[language] ~= nil then
    if lang_conf[language].enabled == true and lang_conf[language].lsp == lsp then
      return true
    end
  end
  return false
end

local function setup_lsp(language, lsp, lsp_config)
  if lsp_is_enabled(language, lsp) then
    require("lspconfig")[lsp].setup(lsp_config)
  end
end

mason_lspconfig.setup {
  ensure_installed = ensure_installed
}

setup_lsp("python", "pyright", { capabilities = capabilities })
setup_lsp("dotnet", "omnisharp", { capabilities = capabilities })
setup_lsp("lua", "lua_ls", { capabilities = capabilities })
setup_lsp("html", "html", { capabilities = capabilities })
setup_lsp("vue", "volar", {
  capabilities = capabilities,
  init_options = {
    vue = {
      -- enable hybrid mode
      hybridMode = true,
    },
  },
})


if lsp_is_enabled("vue", "volar") then
  local mason_registry = require('mason-registry')
  local vue_language_server_path = mason_registry.get_package('vue-language-server'):get_install_path() ..
      '/node_modules/@vue/language-server'
  setup_lsp("ts", "ts_ls", {
    capabilities = capabilities,
    init_options = {
      plugins = {
        {
          name = "@vue/typescript-plugin",
          location = vue_language_server_path,
          languages = { "javascript", "typescript", "vue" },
        },
      },
    },
    filetypes = {
      "javascript",
      "javascriptreact",
      "javascript.jsx",
      "typescript",
      "typescriptreact",
      "typescript.tsx",
      "vue",
    },
  })
else
  setup_lsp("ts", "ts_ls", { capabilities = capabilities })
end
