local init = {
  "Darazaki/indent-o-matic",
  event = "BufRead",
  config = function()
    require("indent-o-matic").setup({
      max_lines = 2048,
      standard_widths = { 2, 4, 8 },
    })
  end,
}

return init
