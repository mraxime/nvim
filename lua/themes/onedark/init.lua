vim.cmd("highlight clear")
if vim.fn.exists("syntax_on") then
  vim.cmd("syntax reset")
end
vim.o.background = "dark"
vim.o.termguicolors = true
vim.g.colors_name = "onedark"

local utils = require("themes.utils")

local modules = {
  "base",
  "treesitter",
  "lsp",
  "other",
}

local highlights = {}

C = require("themes.onedark.colors")

for _, module in ipairs(modules) do
  highlights = vim.tbl_deep_extend("force", highlights, require("themes.onedark." .. module))
end

for group, spec in pairs(highlights) do
  -- allow for old api for style
  vim.api.nvim_set_hl(0, group, utils.parse_style(spec))
end
