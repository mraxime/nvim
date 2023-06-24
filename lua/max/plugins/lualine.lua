-- Fancier statusline
return {
  "nvim-lualine/lualine.nvim",
  dependencies = {
    -- LSP Support
    { "folke/noice.nvim" }, -- Required
  },
  config = function()
    require('lualine').setup({
      options = {
        icons_enabled = true,
        theme = 'onedark',
        component_separators = '|',
        section_separators = '',
      },
      sections = {
        lualine_x = {
          {
            color = { fg = "#ff9e64" },
          }
        },
        lualine_a = {
          {
            'buffers',
          }
        }
      }
    })
  end,
}
