return {
  "echasnovski/mini.nvim",
  config = function()
    require("mini.pairs").setup({})

    local jump_config = {
      mappings = {
        forward = "f",
        backward = "F",
        -- forward_till = "t",
        -- backward_till = "T",
        -- repeat_jump = ";",
      }
    }
    require("mini.jump").setup(jump_config)
  end
}
