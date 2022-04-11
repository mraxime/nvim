local init = {
  "antoinemadec/FixCursorHold.nvim",
  event = { "BufRead", "BufNewFile" },
  config = function()
    vim.g.cursorhold_updatetime = 100
  end,
}

return init
