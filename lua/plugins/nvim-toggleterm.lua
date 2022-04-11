local M = {}

M.init = {
  "akinsho/nvim-toggleterm.lua",
  cmd = "ToggleTerm",
  module = { "toggleterm", "toggleterm.terminal" },
  config = function()
    require("toggleterm").setup({
      -- size can be a number or function which is passed the current terminal
      size = 20,
      open_mapping = [[<A-i>]],
      -- open_mapping = [[<c-t>]],
      shading_factor = 1, -- the degree by which to darken to terminal colour
      persist_size = false,
      direction = "float", -- 'vertical' | 'horizontal' | 'window' | 'float',
      close_on_exit = true, -- close the terminal window when the process exits
      -- This field is only relevant if direction is set to 'float'
      float_opts = {
        border = "curved", -- 'single' | 'double' | 'shadow' | 'curved'
        width = 100,
        height = 25,
        winblend = 10,
        -- highlights = {
        --   border = 'Normal',
        --   background = 'Normal',
        -- },
      },
    })
  end,
}

return M
