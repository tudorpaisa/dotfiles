return {
  {
    "ellisonleao/gruvbox.nvim",

    config = function()

      local ok, _ = pcall(vim.cmd, 'colorscheme gruvbox')
      if not ok then
        vim.cmd 'colorscheme default'  -- use default if all fails
      end

    end
  }
}
