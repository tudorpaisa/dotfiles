keymaps_conf = require('config.keymaps')
mappings = {
  {
    "<leader>?",
    function()
      require("which-key").show({ global = false })
    end,
    desc = "Buffer Local Keymaps (which-key)",
  },
}

for _, v in ipairs(keymaps_conf) do
  if v.type == "group" then
    table.insert(mappings, {v.key, desc = v.desc, group = v.group})
  end

  if v.type == "whichkeymap" then
    table.insert(mappings, {v.key, v.fn, desc = v.desc, mode = v.mode})
  end
end

return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  opts = {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
  },
  keys = mappings
}
