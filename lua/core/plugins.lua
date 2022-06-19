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
    "notify", -- Notification Enhancer
    -- "auto-session", -- Auto session management
    "project", -- project manangement
    -- "nui", -- Neovim UI Enhancer
    "cosmic-ui", -- Neovim UI Enhancer
    "fix-cursor-hold", -- Cursorhold fix
    "smart-splits", -- Smarter Splits
    "nvim-web-devicons", -- Icons
    "bufferline", -- Bufferline
    "vim-bbye", -- Better buffer closing
    -- "neo-tree", -- File explorer
    "nvim-tree", -- File explorer
    "lualine", -- Statusline
    -- "nvim-ts-rainbow", -- Parenthesis highlighting
    "ts-autotag", -- Autoclose tags
    "ts-context-commentstring", -- Context based commenting
    "treesitter", -- Syntax highlighting
    "luasnip", -- Snippet engine
    "nvim-cmp", -- Completion engine
    "lsp-installer", -- LSP manager
    "lspconfig", -- Built-in LSP
    -- "symbols-outline", -- LSP symbols
    "null-ls", -- Formatting and linting
    "telescope", -- Fuzzy finder
    "telescope-fzf-native", -- Fuzzy finder syntax support
    "gitsigns", -- Git integration
    -- "dashboard-nvim", -- Start screen
    "colorizer", -- Color highlighting
    "autopairs", -- Autopairs
    "toggleterm", -- Terminal
    "comment", -- Commenting
    "indent-blankline", -- Indentation
    "which-key", -- Keymaps popup
    -- "neoscroll", -- Smooth scrolling
    "better-escape", -- Smooth escaping
    "schema-store", -- Get extra JSON schemas
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
      vim.g.tokyonight_sidebars = { "qf" }
      vim.cmd("color tokyonight")
    end,
  })
end)
