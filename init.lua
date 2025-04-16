vim.loader.enable(true) -- https://github.com/neovim/neovim/pull/22668
require("max.disabled")
require("max.options")
require("max.mappings")
require("max.autocmds")
require("max.plugins-manager")

vim.cmd.colorscheme("catppuccin")
vim.keymap.del("n", "[d")
