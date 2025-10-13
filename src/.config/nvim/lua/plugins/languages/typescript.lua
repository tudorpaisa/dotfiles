local langs = require("config.languages")

if not langs["ts"] then
  return {}
end

if not langs["ts"]["enabled"] then
  return {}
end

return {
  {
    "mfussenegger/nvim-dap",
    optional = true,
    dependencies = {
      {
        "mason-org/mason.nvim",
        opts = function(_, opts)
          opts.ensure_installed = opts.ensure_installed or {}
          table.insert(opts.ensure_installed, "js-debug-adapter")
        end,
      },
    },
  },

}
