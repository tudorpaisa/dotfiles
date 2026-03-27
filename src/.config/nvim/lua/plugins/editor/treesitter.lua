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
      pattern = {
        -- installed treesitter grammars
        "bash", "sh",
        "c", "cpp",
        "c_sharp",
        "go", "gomod", "gowork", "gosum",
        "diff",
        "html",
        "javascript", "jsdoc",
        "json", "jsonc",
        "lua", "luadoc",
        "markdown", "markdown_inline",
        "python",
        "query",
        "regex",
        "toml",
        "tsx",
        "typescript",
        "vim", "vimdoc",
        "xml",
        "yaml",
        -- your language config extras
        "css", "scss",
        "vue",
        "java",
        "printf",
      },
      callback = function() vim.treesitter.start() end,
    })

    vim.wo[0][0].foldexpr = 'v:lua.vim.treesitter.foldexpr()'
    vim.wo[0][0].foldmethod = 'expr'
    vim.wo[0][0].foldlevel = 99

  end,
}
