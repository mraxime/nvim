local init = {
  "max397574/better-escape.nvim",
  event = { "InsertEnter" },
  config = function()
    require("better_escape").setup({
      mapping = { "jj", "jk", "kj" },
      timeout = vim.o.timeoutlen,
      keys = "<ESC>",
    })
  end,
}

return init
