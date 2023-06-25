-- Fancier statusline
return {
  -- "nvim-lualine/lualine.nvim",
  "tamighi/lualine.nvim",
  enabled = false,
  branch = "feat/harpoon_files",
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
            'harpoon_files'
          }
        }
      }
    })
  end,
}
