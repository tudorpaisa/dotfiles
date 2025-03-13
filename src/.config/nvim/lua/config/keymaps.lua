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

  -- keymaps
  {
    key = "<ESC>",
    fn = "<cmd>noh<cr>",
    mode = "n",
    desc = "Clear any higlighting",
    type = "keymap",
  },
}

for _, kmap in ipairs(keymaps) do
  -- if kmap.type == "keymap" then
  --   vim.keymap.set(kmap.mode, kmap.key, kmap.fn, { desc = kmap.desc })
  -- end
end

return keymaps
