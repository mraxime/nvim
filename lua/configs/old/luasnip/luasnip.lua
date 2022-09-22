local init = {
  "L3MON4D3/LuaSnip",
  requires = {
    {
      "rafamadriz/friendly-snippets", -- Snippet collection
      after = "nvim-cmp",
    },
  },
  config = function()
    require("luasnip/loaders/from_vscode").lazy_load()
  end,
}

return init
