-- Nice to have plugins
local enabled = true

return {
  -- better yank/paste
  {
    "gbprod/yanky.nvim",
    enabled = enabled,
    event = "VeryLazy",
    opts = {
      highlight = { timer = 150 },
    },
    keys = {
      { "y", "<Plug>(YankyYank)",      mode = { "n", "x" } },
      { "p", "<Plug>(YankyPutAfter)",  mode = { "n", "x" } },
      { "P", "<Plug>(YankyPutBefore)", mode = { "n", "x" } },
    },
  },

  -- search/replace in multiple files
  {
    "nvim-pack/nvim-spectre",
    enabled = enabled,
    cmd = "Spectre",
    keys = {
      { "<leader>lR", function() require("spectre").open() end, desc = "Replace in files (Spectre)" },
    },
  },

  -- annotation comments generator
  {
    "danymat/neogen",
    enabled = enabled,
    dependencies = { 'L3MON4D3/LuaSnip' },
    keys = {
      {
        "<leader>cc",
        function()
          require("neogen").generate({})
        end,
        desc = "Neogen annotation comment",
      },
    },
    opts = { snippet_engine = "luasnip" },
  },

  -- ChatGPT interaction
  {
    "jackMort/ChatGPT.nvim",
    enabled = enabled,
    dependencies = {
      "MunifTanjim/nui.nvim",
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim"
    },
    cmd = { "ChatGPTActAs", "ChatGPT" },
    keys = {
      { "<leader>H", "<cmd>ChatGPT<cr>", desc = "Open ChatGPT" }
    },
    opts = {
      api_key_cmd = "echo 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"
    },
    config = function(_, opts)
      require("chatgpt").setup(opts)
    end,
  },

  -- highlight references
  {
    "RRethy/vim-illuminate",
    enabled = enabled,
    event = { "BufReadPost", "BufNewFile" },
    opts = { delay = 200 },
    config = function(_, opts) require('illuminate').configure(opts) end
  },

  -- buffer remove
  {
    "echasnovski/mini.bufremove",
    enabled = false,
    keys = {
      { "<leader>c", function() require("mini.bufremove").delete(0, false) end, desc = "Delete Buffer" },
      { "<leader>C", function() require("mini.bufremove").delete(0, true) end,  desc = "Delete Buffer (Force)" },
    },
  },
}
