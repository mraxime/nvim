local M = {}

M.init = {
  "max397574/better-escape.nvim",
  event = { "InsertEnter" },
  config = function()
    local present, better_escape = pcall(require, "better_escape")
    if not present then
      return
    end

    better_escape.setup({
      mapping = { "ii", "jj", "jk", "kj" },
      timeout = vim.o.timeoutlen,
      keys = "<ESC>",
    })
  end,
}

return M
