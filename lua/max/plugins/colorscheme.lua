return {
  {
    "folke/tokyonight.nvim",
    enabled = true,
    lazy = false,
    priority = 1000,
    opts = function()
      return {
        style = "night",
        -- transparent = true,
        -- styles = {
        --   sidebars = "transparent",
        --   floats = "transparent",
        -- },
        sidebars = {
          "qf",
          "vista_kind",
          "terminal",
          "spectre_panel",
          "startuptime",
          "Outline",
        },
        on_highlights = function(hl, c)
          hl.CursorLineNr = { fg = c.orange, bold = true }
          hl.LineNr = { fg = c.orange, bold = true }
          hl.LineNrAbove = { fg = c.fg_gutter }
          hl.LineNrBelow = { fg = c.fg_gutter }
          local prompt = "#2d3149"
          hl.TelescopeNormal = { bg = c.bg_dark, fg = c.fg_dark }
          hl.TelescopeBorder = { bg = c.bg_dark, fg = c.bg_dark }
          hl.TelescopePromptNormal = { bg = prompt }
          hl.TelescopePromptBorder = { bg = prompt, fg = prompt }
          hl.TelescopePromptTitle = { bg = c.fg_gutter, fg = c.orange }
          hl.TelescopePreviewTitle = { bg = c.bg_dark, fg = c.bg_dark }
          hl.TelescopeResultsTitle = { bg = c.bg_dark, fg = c.bg_dark }
        end,
      }
    end,
    config = function(_, opts)
      require('tokyonight').setup(opts)
      -- load the colorscheme here
      vim.cmd([[colorscheme tokyonight]])
    end,
  },
  {
    "ellisonleao/gruvbox.nvim",
    enabled = false,
    lazy = false,
    priority = 1000,
    opts = {
      contrast = "hard",
      -- transparent_mode = true,
      overrides = {
        CursorLineNr = { bg = "" },
        DiffDelete = { reverse = false },
        DiffAdd = { reverse = false },
        DiffChange = { reverse = false },
        DiffText = { reverse = false },
        IndentContext1 = { link = "GruvboxRed" },
        IndentContext2 = { link = "GruvboxOrange" },
        IndentContext3 = { link = "GruvboxYellow" },
        IndentContext4 = { link = "GruvboxGreen" },
        IndentContext5 = { link = "GruvboxAqua" },
        IndentContext6 = { link = "GruvboxBlue" },
        IndentContext7 = { link = "GruvboxViolet" },

        -- See: https://github.com/ellisonleao/gruvbox.nvim/pull/255
        ["@lsp.type.class"] = { link = "@type" },
        ["@lsp.type.decorator"] = { link = "@macro" },
        ["@lsp.type.interface"] = { link = "@constructor" },
        ["@lsp.type.struct"] = { link = "@type" },
      },
    },
    config = function(_, opts)
      require('gruvbox').setup(opts)
      -- load the colorscheme here
      vim.cmd([[colorscheme gruvbox]])
    end,
  },

  -- { "shaunsingh/oxocarbon.nvim" },
  -- { "rose-pine/neovim", name = "rose-pine" },
}
