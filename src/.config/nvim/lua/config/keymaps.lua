keymaps = {
  {
    key = "<leader>o",
    group = "open",
    desc = "Open",
    type = "group",
  },
  {
    key = "<leader>op",
    fn = "<cmd>Neotree toggle<cr>",
    mode = "n",
    desc = "Open file browser",
    type = "whichkeymap",
  },

  -- telescope
  {
    key = "<leader> ",
    fn = "<cmd>Telescope find_files<cr>",
    mode = "n",
    desc = "Telescope find files",
    type = "whichkeymap",
  },
  {
    key = "<leader>/",
    fn = "<cmd>Telescope live_grep<cr>",
    mode = "n",
    desc = "Telescope live grep",
    type = "whichkeymap",
  },
  {
    key = "<leader>b",
    fn = "<cmd>Telescope buffers<cr>",
    mode = "n",
    desc = "Telescope buffers",
    type = "whichkeymap",
  },

  -- git
  {
    key = "<leader>g",
    group = "git",
    desc = "Git",
    type = "group",
  },
  {
    key = "<leader>gg",
    fn = "<cmd>Neogit<cr>",
    mode = "n",
    desc = "Open NeoGit",
    type = "whichkeymap",
  },
  {
    key = "<leader>gc",
    fn = "<cmd>Neogit commit<cr>",
    mode = "n",
    desc = "Open commit popup",
    type = "whichkeymap",
  },
  {
    key = "<leader>gf",
    fn = "<cmd>Neogit cwd=%:p:h<cr>",
    mode = "n",
    desc = "Open NeoGit with the repository of the current file",
    type = "whichkeymap",
  },

  -- tabs
  {
    key = "<leader><TAB>",
    group = "Tab",
    desc = "Tab management",
    type = "group",
  },
  {
    key = "<leader><TAB>n",
    fn = "<cmd>tabnew<cr>",
    mode = "n",
    desc = "New Tab",
    type = "whichkeymap",
  },
  {
    key = "<leader><TAB>d",
    fn = "<cmd>tabclose<cr>",
    mode = "n",
    desc = "Close Tab",
    type = "whichkeymap",
  },
  {
    key = "<leader><TAB>]",
    fn = "<cmd>tabnext<cr>",
    mode = "n",
    desc = "Next Tab",
    type = "whichkeymap",
  },
  {
    key = "<leader><TAB>[",
    fn = "<cmd>tabprevious<cr>",
    mode = "n",
    desc = "Previous Tab",
    type = "whichkeymap",
  },

  -- Trouble
  {
    key = "<leader>xx",
    fn = "<cmd>Trouble diagnostics toggle<cr>",
    mode = "n",
    desc = "Diagnostics (Trouble)",
    type = "whichkeymap",
  },
  {
    key = "<leader>xX",
    fn = "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
    mode = "n",
    desc = "Buffer Diagnostics (Trouble)",
    type = "whichkeymap",
  },
  {
    key = "<leader>xL",
    fn = "<cmd>Trouble loclist toggle<cr>",
    mode = "n",
    desc = "Location List (Trouble)",
    type = "whichkeymap",
  },
  {
    key = "<leader>xQ",
    fn = "<cmd>Trouble qflist toggle<cr>",
    mode = "n",
    desc = "Quickfix List (Trouble)",
    type = "whichkeymap",
  },

  -- Debugger
  {
    key = "<leader>d",
    group = "debugger",
    desc = "Debugger",
    type = "group",
  },
  {
    key = "<leader>dt",
    fn = "<cmd>lua require('dap').toggle_breakpoint()<cr>",
    desc = "Toggle Breakpoint",
    mode = "n",
    type = "whichkeymap",
  },
  {
    key = "<leader>dc",
    fn = "<cmd>lua require('dap').continue()<cr>",
    desc = "Continue",
    mode = "n",
    type = "whichkeymap",
  },
  {
    key = "<leader>di",
    fn = "<cmd>lua require('dap').step_into()<cr>",
    desc = "Step Into",
    mode = "n",
    type = "whichkeymap",
  },
  {
    key = "<leader>do",
    fn = "<cmd>lua require('dap').step_over()<cr>",
    desc = "Step Over",
    mode = "n",
    type = "whichkeymap",
  },
  {
    key = "<leader>du",
    fn = "<cmd>lua require('dap').step_out()<cr>",
    desc = "Step Out",
    mode = "n",
    type = "whichkeymap",
  },
  {
    key = "<leader>dr",
    fn = "<cmd>lua require('dap').repl.open()<cr>",
    desc = "Open REPL",
    mode = "n",
    type = "whichkeymap",
  },
  {
    key = "<leader>dl",
    fn = "<cmd>lua require('dap').run_last()<cr>",
    desc = "Run Last",
    mode = "n",
    type = "whichkeymap",
  },
  {
    key = "<leader>dq",
    fn = function()
        require("dap").terminate()
        require("dapui").close()
        require("nvim-dap-virtual-text").toggle()
    end,
    desc = "Terminate",
    mode = "n",
    type = "whichkeymap",
  },
  {
    key = "<leader>db",
    fn = function()
        require("dap").list_breakpoints()
    end,
    desc = "List Breakpoints",
    mode = "n",
    type = "whichkeymap",
  },
  {
    key = "<leader>de",
    fn = function()
        require("dap").set_exception_breakpoints({ "all" })
    end,
    desc = "Set Exception Breakpoints",
    mode = "n",
    type = "whichkeymap",
  },

  -- code
  {
    key = "<leader>c",
    group = "Code",
    desc = "Code management",
    type = "group",
  },
  {
    key = "<leader>cf",
    fn = "<cmd>FormatBuffer<cr>",
    desc = "Format Buffer",
    mode = "n",
    type = "whichkeymap",
  },
  {
    key = "<leader>cs",
    fn = "<cmd>Trouble symbols toggle focus=false<cr>",
    mode = "n",
    desc = "Symbols (Trouble)",
    type = "whichkeymap",
  },
  {
    key = "<leader>cl",
    fn = "<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
    mode = "n",
    desc = "LSP Definitions / references / ... (Trouble)",
    type = "whichkeymap",
  },
  {
    key = "<leader>ca",
    fn = vim.lsp.buf.code_action,
    mode = { "n", "v" },
    desc = "Code Action",
    has = "codeAction",
    type = "whichkeymap",
  },
  {
    key = "<leader>cc",
    fn = vim.lsp.codelens.run,
    mode = { "n", "v" },
    desc = "Run Codelens",
    has = "codeLens",
    type = "whichkeymap",
  },
  {
    key = "<leader>cC",
    fn = vim.lsp.codelens.refresh,
    mode = { "n" },
    desc = "Refresh & Display Codelens",
    has = "codeLens",
    type = "whichkeymap",
  },
  {
    key = "<leader>cr",
    fn = vim.lsp.buf.rename,
    mode = "n",
    desc = "Rename",
    has = "rename",
    type = "whichkeymap",
  },

  -- keymaps
  {
    key = "<ESC>",
    fn = "<cmd>noh<cr><ESC>",
    mode = "n",
    desc = "Clear any higlighting",
    type = "keymap",
  },
  {
    key = "gd",
    fn = vim.lsp.buf.definition,
    mode = "n",
    desc = "Goto Definition",
    has = "definition",
    type = "keymap",
  },
  {
    key = "gr",
    fn = vim.lsp.buf.references,
    mode = "n",
    desc = "references",
    nowait = true,
    type = "keymap",
  },
  {
    key = "gI",
    fn = vim.lsp.buf.implementation,
    mode = "n",
    desc = "Goto Implementation",
    type = "keymap",
  },
  {
    key = "gy",
    fn = vim.lsp.buf.type_definition,
    mode = "n",
    desc = "Goto Type Definition",
    type = "keymap",
  },
  {
    key = "gD",
    fn = vim.lsp.buf.declaration,
    mode = "n",
    desc = "Goto Declaration",
    type = "keymap",
  },
  {
    key = "K",
    fn = function() return vim.lsp.buf.hover() end,
    mode = "n",
    desc = "Hover",
    type = "keymap",
  },
  {
    key = "gK",
    fn = function() return vim.lsp.buf.signature_help() end,
    mode = "n",
    desc = "Signature Help",
    has = "signatureHelp",
    type = "keymap",
  },
  {
    key = "<c-k>",
    fn = function() return vim.lsp.buf.signature_help() end,
    mode = "i",
    desc = "Signature Help",
    has = "signatureHelp",
    type = "keymap",
  },
}

for _, kmap in ipairs(keymaps) do
  if kmap.type == "keymap" then
    local opts = { desc = kmap.desc }

    if kmap.has ~= nil then
      -- opts["has"] = kmap.has
    end

    if kmap.nowait ~= nil then
      opts["nowait"] = kmap.nowait
    end

    vim.keymap.set(kmap.mode, kmap.key, kmap.fn, opts)
  end
end

return keymaps
