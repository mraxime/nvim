vim.loader.enable(true) -- https://github.com/neovim/neovim/pull/22668
require("max.disabled")
require("max.options")
require("max.mappings")
require("max.autocmds")
require("max.diagnostic")
require("max.plugins-manager")
require("max.lsp")

vim.cmd.colorscheme("catppuccin")
vim.keymap.del("n", "[d")
