local init = {
  "CosmicNvim/cosmic-ui",
  event = "BufWinEnter",
  requires = {
    "MunifTanjim/nui.nvim",
  },
  config = function()
    local defaults = {
      border_style = "rounded",
    }

    require("cosmic-ui").setup(defaults)
  end,
}

return init
