local packer = require("utils.packerInit")

packer.startup(function(use)
  use({
    "wbthomason/packer.nvim", -- Plugin manager
    "nvim-lua/plenary.nvim", -- Lua functions
    "lewis6991/impatient.nvim", -- Optimiser
  })

  -- use({ -- Boost startup time
  --   "nathom/filetype.nvim",
  --   config = function()
  --     require("filetype").setup()
  --   end,
  -- })

  local enabled_plugins = {
    "popup", -- Popup API
    "indent-o-matic", -- Indent detection
    -- "notify", -- Notification Enhancer
    "project", -- project manangement
    "cosmic-ui", -- Neovim UI Enhancer
    "fix-cursor-hold", -- Cursorhold fix
    "smart-splits", -- Smarter Splits
    "nvim-web-devicons", -- Icons
    "bufferline", -- Bufferline
    "vim-bbye", -- Better buffer closing
    "nvim-tree", -- File explorer
    "lualine", -- Statusline
    "ts-autotag", -- Autoclose tags
    "ts-context-commentstring", -- Context based commenting
    "treesitter", -- Syntax highlighting
    "luasnip", -- Snippet engine
    "nvim-cmp", -- Completion engine
    "lsp-installer", -- LSP manager
    "lspconfig", -- Built-in LSP
    "null-ls", -- Formatting and linting
    "telescope", -- Fuzzy finder
    "telescope-fzf-native", -- Fuzzy finder syntax support
    "gitsigns", -- Git integration
    "colorizer", -- Color highlighting
    "autopairs", -- Autopairs
    "toggleterm", -- Terminal
    "comment", -- Commenting
    "indent-blankline", -- Indentation
    "which-key", -- Keymaps popup
    "better-escape", -- Smooth escaping
    "schema-store", -- Get extra JSON schemas

    -- "auto-session", -- Auto session management
    -- "nui", -- Neovim UI Enhancer
    -- "neo-tree", -- File explorer
    -- "nvim-ts-rainbow", -- Parenthesis highlighting
    -- "neoscroll", -- Smooth scrolling
    -- "dashboard-nvim", -- Start screen
    -- "symbols-outline", -- LSP symbols
  }
  -- Load main plugins
  for _, path in ipairs(enabled_plugins) do
    use(require("plugins." .. path .. "." .. path))
  end

  use({ "tpope/vim-surround" })

  use({ "kevinhwang91/nvim-bqf", ft = "qf" })

  use({ "amadeus/vim-mjml", ft = "mjml" })

  use({ -- color scheme
    "folke/tokyonight.nvim",
    as = "tokyonight",
    config = function()
      vim.g.tokyonight_style = "night"
      vim.cmd({ cmd = "color", args = { "tokyonight-night" } })
      vim.g.tokyonight_sidebars = { "qf" }
    end,
  })
end)
