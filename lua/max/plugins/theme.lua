return {
  {
    "rose-pine/neovim",
    enabled = false,
    config = function()
      vim.cmd('colorscheme rose-pine')
    end
  },
  {
    "folke/tokyonight.nvim",
    enabled = true,
    lazy = false,
    priority = 1000,
    opts = { style = "night" },
    config = function(_, opts)
      require('tokyonight').setup(opts)
      -- load the colorscheme here
      vim.cmd([[colorscheme tokyonight]])
    end,
  },
  {
    "ellisonleao/gruvbox.nvim",
    enabled = false,
    priority = 1000,
    config = function()
      vim.cmd([[colorscheme gruvbox]])
    end,
  }
}
