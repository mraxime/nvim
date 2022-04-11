local M = {}

M.init = {
  "nvim-telescope/telescope-fzf-native.nvim",
  after = "telescope.nvim",
  run = "make",
  config = function()
    require("telescope").load_extension("fzf")
  end,
}

return M
