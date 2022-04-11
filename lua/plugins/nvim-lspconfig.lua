local M = {}

M.init = {
  "neovim/nvim-lspconfig",
  event = "BufWinEnter",
  config = function()
    require("lsp")
  end,
}

return M
