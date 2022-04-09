vim.cmd("hi clear")
if vim.fn.exists("syntax_on") then
  vim.cmd("syntax reset")
end
vim.o.background = "dark"
vim.o.termguicolors = true
vim.g.colors_name = "default_theme"

local util = require("default_theme.util")

local modules = {
  "base",
  "treesitter",
  "lsp",
  "others",
}

local highlights = {}

C = require("default_theme.colors")

for _, module in ipairs(modules) do
  highlights = vim.tbl_deep_extend("force", highlights, require("default_theme." .. module))
end

for group, colors in pairs(highlights) do
  util.highlight(group, colors)
end
