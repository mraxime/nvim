local init = {
  "akinsho/bufferline.nvim",
  after = "nvim-web-devicons",
  config = function()
    require("bufferline").setup({
      options = {
        mode = "tabs",
        offsets = {
          { filetype = "NvimTree", text = "", padding = 1 },
          { filetype = "neo-tree", text = "", padding = 1 },
          { filetype = "Outline", text = "", padding = 1 },
        },
        always_show_bufferline = true,
        buffer_close_icon = "",
        close_icon = "",
        diagnostics = false,
        enforce_regular_tabs = false,
        left_trunc_marker = "",
        max_name_length = 14,
        max_prefix_length = 13,
        modified_icon = "",
        right_trunc_marker = "",
        separator_style = "thin",
        show_buffer_close_icons = true,
        show_close_icon = true,
        show_tab_indicators = true,
        tab_size = 20,
        view = "multiwindow",
      },
    })

    require("plugins.bufferline.mappings")
  end,
}

return init
