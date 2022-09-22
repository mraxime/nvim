local packer = require("utils.packerInit")

packer.startup(function(use)
  use("wbthomason/packer.nvim") -- Plugin manager
  use("lewis6991/impatient.nvim") -- Optimiser
  use("nvim-lua/plenary.nvim") -- Lua functions

  use("nvim-lua/popup.nvim") --Popup API

  -- Neovim UI Enhancer
  use({
    "stevearc/dressing.nvim",
    event = "UIEnter",
    config = function()
      require("configs.dressing")
    end,
  })

  --[[ use({ ]]
  --[[   "glepnir/lspsaga.nvim", ]]
  --[[   branch = "main", ]]
  --[[   event = "UIEnter", ]]
  --[[   config = function() ]]
  --[[     require("configs.lspsaga") ]]
  --[[   end, ]]
  --[[ }) ]]

  -- Cursorhold fix
  use({
    "antoinemadec/FixCursorHold.nvim",
    event = { "BufRead", "BufNewFile" },
    config = function()
      vim.g.cursorhold_updatetime = 100
    end,
  })

  -- Smarter Splits
  use({
    "mrjones2014/smart-splits.nvim",
    module = "smart-splits",
    config = function()
      require("configs.smart-splits")
    end,
  })

  -- Icons
  use({
    "kyazdani42/nvim-web-devicons",
    module = "nvim-web-devicons",
    config = function()
      require("configs.nvim-web-devicons")
    end,
  })

  -- LSP Icons
  use({
    "onsails/lspkind.nvim",
    module = "lspkind",
    config = function()
      require("configs.lspkind")
    end,
  })

  -- Bufferline
  use({
    "akinsho/bufferline.nvim",
    event = "UIEnter",
    config = function()
      require("configs.bufferline")
    end,
  })

  -- Better buffer closing
  use({ "famiu/bufdelete.nvim", cmd = { "Bdelete", "Bwipeout" } })

  -- Statusline TODOOOOOOOOOOOOOOOOOO
  --[[ use("rebelot/heirline.nvim") ]]
  use({
    "nvim-lualine/lualine.nvim",
    config = function()
      require("configs.lualine")
    end,
  })

  -- Parenthesis highlighting
  --[[ use({ "p00f/nvim-ts-rainbow", after = "nvim-treesitter" }) ]]

  -- Autoclose tags
  use({ "windwp/nvim-ts-autotag", after = "nvim-treesitter" })

  -- Autopairs
  use({
    "windwp/nvim-autopairs",
    --[[ event = "InsertEnter", ]]
    config = function()
      require("configs.autopairs")
    end,
  })

  -- Context based commenting
  use({ "JoosepAlviste/nvim-ts-context-commentstring", after = "nvim-treesitter" })

  -- Syntax highlighting
  use({
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
    event = { "BufRead", "BufNewFile" },
    cmd = {
      "TSInstall",
      "TSInstallInfo",
      "TSInstallSync",
      "TSUninstall",
      "TSUpdate",
      "TSUpdateSync",
      "TSDisableAll",
      "TSEnableAll",
    },
    config = function()
      require("configs.nvim-treesitter")
    end,
  })

  -- Snippet engine
  use({
    "L3MON4D3/LuaSnip",
    module = "luasnip",
    config = function()
      require("configs.luasnip")
    end,
  })

  -- Snippet collection
  --[[ use("rafamadriz/friendly-snippets") ]]

  -- Completion engine
  use({
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    config = function()
      require("configs.cmp")
    end,
  })

  -- Snippet completion source TODOOOOOOOOOOOOOOOOOO
  use({ "saadparwaiz1/cmp_luasnip", after = "nvim-cmp" })

  -- Buffer completion source
  use({ "hrsh7th/cmp-buffer", after = "nvim-cmp" })

  -- Path completion source
  use({ "hrsh7th/cmp-path", after = "nvim-cmp" })

  -- LSP completion source
  use({ "hrsh7th/cmp-nvim-lsp", after = "nvim-cmp" })

  -- Linters/Formaters/DAP Manager
  use({
    "williamboman/mason.nvim",
    config = function()
      require("configs.mason")
    end,
  })
  use({
    "williamboman/mason-lspconfig.nvim",
    after = "mason.nvim",
    config = function()
      require("configs.mason-lspconfig")
    end,
  })

  -- Builtin LSP
  use({
    "neovim/nvim-lspconfig",
    config = function()
      require("configs.lspconfig")
    end,
  })

  -- Formatting and linting
  use({
    "jose-elias-alvarez/null-ls.nvim",
    config = function()
      require("configs.null-ls")
    end,
  })

  -- Fuzzy finder
  use({
    "nvim-telescope/telescope.nvim",
    module = "telescope",
    cmd = "Telescope",
    config = function()
      require("configs.telescope")
    end,
  })

  -- Sample configuration is supplied
  use({
    "lmburns/lf.nvim",
    config = function()
      -- This feature will not work if the plugin is lazy-loaded
      --[[ vim.g.lf_netrw = 1 ]]

      require("lf").setup({
        escape_quit = false,
        default_cmd = "lfub",
        border = "rounded",
        border = "single", -- 'single' | 'double' | 'shadow' | 'curved'
        width = 150,
        height = 150,
        winblend = 15,
      })

      vim.keymap.set("n", "sO", "<cmd>Lf<CR>")
    end,
    requires = { "plenary.nvim", "toggleterm.nvim" },
  })

  -- Fuzzer finder syntax support
  use({
    "nvim-telescope/telescope-fzf-native.nvim",
    after = "telescope.nvim",
    run = "make",
    config = function()
      require("telescope").load_extension("fzf")
    end,
  })

  -- File Explorer
  use({
    "nvim-telescope/telescope-file-browser.nvim",
    after = "telescope.nvim",
    config = function()
      require("telescope").load_extension("file_browser")
    end,
  })

  -- Git integration
  use({
    "lewis6991/gitsigns.nvim",
    event = "BufEnter",
    config = function()
      require("configs.gitsigns")
    end,
  })

  -- Color highlighting
  use({
    "NvChad/nvim-colorizer.lua",
    event = { "BufRead", "BufNewFile" },
    config = function()
      require("configs.nvim-colorizer")
    end,
  })

  -- Terminal
  use({
    "akinsho/toggleterm.nvim",
    cmd = "ToggleTerm",
    module = { "toggleterm", "toggleterm.terminal" },
    config = function()
      require("configs.toggleterm")
    end,
  })

  -- Commenting
  use({
    "numToStr/Comment.nvim",
    module = { "Comment", "Comment.api" },
    keys = { "gc", "gb", "g<", "g>" },
    config = function()
      require("configs.comment")
    end,
  })

  -- Indentation
  use({
    "lukas-reineke/indent-blankline.nvim",
    event = "BufRead",
    config = function()
      require("configs.indent-blankline")
    end,
  })

  -- Indent detection
  use({
    "Darazaki/indent-o-matic",
    event = "BufReadPost",
    config = function()
      require("configs.indent-o-matic")
    end,
  })

  -- Smooth escaping
  --[[ use({ ]]
  --[[   "max397574/better-escape.nvim", ]]
  --[[   event = "InsertCharPre", ]]
  --[[   config = function() ]]
  --[[     require("configs.better-escape") ]]
  --[[   end, ]]
  --[[ }) ]]

  -- Get exstra JSON schemas
  use({ "b0o/SchemaStore.nvim", module = "schemastore" })

  -- Session manager
  --[[ use({ ]]
  --[[   "Shatur/neovim-session-manager", ]]
  --[[   module = "session_manager", ]]
  --[[   cmd = "SessionManager", ]]
  --[[   event = "BufWritePost", ]]
  --[[   config = function() ]]
  --[[     require("configs.session-manager") ]]
  --[[   end, ]]
  --[[ }) ]]

  --[[ local enabled_plugins = { ]]
  --[[   "project", -- project manangement ]]
  --[[]]
  --[[   -- "auto-session", -- Auto session management ]]
  --[[   -- "nui", -- Neovim UI Enhancer ]]
  --[[   -- "neo-tree", -- File explorer ]]
  --[[   -- "nvim-ts-rainbow", -- Parenthesis highlighting ]]
  --[[   -- "neoscroll", -- Smooth scrolling ]]
  --[[   -- "dashboard-nvim", -- Start screen ]]
  --[[   -- "symbols-outline", -- LSP symbols ]]
  --[[ } ]]
  --[[ -- Load main plugins ]]
  --[[ for _, path in ipairs(enabled_plugins) do ]]
  --[[   use(require("plugins." .. path .. "." .. path)) ]]
  --[[ end ]]

  -- Surround
  use({
    "kylechui/nvim-surround",
    tag = "main", -- Use for stability; omit to use `main` branch for the latest features
    config = function()
      require("nvim-surround").setup({})
    end,
  })
  --[[ use({ "tpope/vim-surround" }) ]]

  use({ "kevinhwang91/nvim-bqf", ft = "qf" })

  use({ "amadeus/vim-mjml", ft = "mjml" })

  --[[ use({ ]]
  --[[   "ahmedkhalf/project.nvim", ]]
  --[[   config = function() ]]
  --[[     require("project_nvim").setup({ ]]
  --[[       detection_methods = { "pattern" }, ]]
  --[[       patterns = { ".git", "_darcs", ".hg", ".bzr", ".svn", "Makefile", "package.json" }, ]]
  --[[       datapath = vim.fn.stdpath("cache"), ]]
  --[[     }) ]]
  --[[   end, ]]
  --[[ }) ]]

  use({
    "folke/tokyonight.nvim",
    config = function()
      vim.cmd([[colorscheme tokyonight-night]])
    end,
  })
end)
