local M = {}

M.init = {
  "nvim-lualine/lualine.nvim",
  config = function()
    local lualine = require("lualine")
    local status = require("utils.status")
    local colors = require("themes.onedark.colors")

    local conditions = {
      buffer_not_empty = function()
        return vim.fn.empty(vim.fn.expand("%:t")) ~= 1
      end,
      hide_in_width = function()
        return vim.fn.winwidth(0) > 80
      end,
      check_git_workspace = function()
        local filepath = vim.fn.expand("%:p:h")
        local gitdir = vim.fn.finddir(".git", filepath .. ";")
        return gitdir and #gitdir > 0 and #gitdir < #filepath
      end,
    }

    local spacer = {
      function()
        return " "
      end,
      padding = { left = 0, right = 0 },
    }

    local config = {
      options = {
        disabled_filetypes = { "NvimTree", "neo-tree", "dashboard", "Outline" },
        component_separators = "",
        section_separators = "",
        globalstatus = true,
      },
      sections = {
        lualine_a = { spacer },
        lualine_b = {},
        lualine_c = {
          {
            "branch",
            icon = "",
            color = { fg = colors.purple_1, gui = "bold" },
            padding = { left = 2, right = 1 },
          },
          {
            "filetype",
            cond = conditions.buffer_not_empty,
            padding = { left = 2, right = 1 },
          },
          {
            "diff",
            symbols = { added = " ", modified = "柳", removed = " " },
            cond = conditions.hide_in_width,
            padding = { left = 2, right = 1 },
          },
          {
            "diagnostics",
            sources = { "nvim_diagnostic" },
            symbols = { error = " ", warn = " ", info = " ", hint = " " },
            padding = { left = 2, right = 1 },
          },
          {
            function()
              return "%="
            end,
          },
        },
        lualine_x = {
          {
            status.lsp_progress,
            color = { gui = "none" },
            padding = { left = 0, right = 1 },
            cond = conditions.hide_in_width,
          },
          {
            status.lsp_name,
            icon = " ",
            color = { gui = "none" },
            padding = { left = 0, right = 1 },
            cond = conditions.hide_in_width,
          },
          {
            status.treesitter_status,
            color = { fg = colors.green },
            padding = { left = 1, right = 0 },
            cond = conditions.hide_in_width,
          },
          {
            "location",
            padding = { left = 1, right = 1 },
          },
          {
            "progress",
            color = { gui = "none" },
            padding = { left = 0, right = 2 },
          },
          -- {
          --   status.progress_bar,
          --   padding = { left = 1, right = 2 },
          --   color = { fg = colors.yellow },
          --   cond = nil,
          -- },
        },
        lualine_y = {},
        lualine_z = { spacer },
      },
      inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_y = {},
        lualine_z = {},
        lualine_c = {},
        lualine_x = {},
      },
    }

    lualine.setup(config)
  end,
}

return M
