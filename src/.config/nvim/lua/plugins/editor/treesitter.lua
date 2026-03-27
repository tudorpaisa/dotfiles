return {
  "nvim-treesitter/nvim-treesitter",
  branch = "main",
  event = { "BufReadPre", "BufNewFile" },
  build = ":TSUpdate",
  dependencies = {
    "windwp/nvim-ts-autotag",
  },
  config = function()
    local treesitter = require("nvim-treesitter")
    treesitter.install {
        "bash",
        "c",
        "c_sharp",
        "go",
        "gomod",
        "gowork",
        "gosum",
        "diff",
        "html",
        "javascript",
        "jsdoc",
        "json",
        "lua",
        "luadoc",
        "luap",
        "markdown",
        "markdown_inline",
        "printf",
        "python",
        "query",
        "regex",
        "toml",
        "tsx",
        "typescript",
        "vim",
        "vimdoc",
        "xml",
        "yaml",
    }
    treesitter.setup()

    vim.api.nvim_create_autocmd('FileType', {
      callback = function() vim.treesitter.start() end,
    })

  end,
}
