local M = {}

M.init = {
  "L3MON4D3/LuaSnip",
  requires = {
    {
      "rafamadriz/friendly-snippets", -- Snippet collection
      after = "nvim-cmp",
    },
  },
  config = function()
    local status_ok, loader = pcall(require, "luasnip/loaders/from_vscode")
    if not status_ok then
      return
    end

    loader.lazy_load()
  end,
}

return M
