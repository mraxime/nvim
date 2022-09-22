local map = vim.keymap.set
map("n", "<S-l>", "<cmd>BufferLineCycleNext<CR>")
map("n", "<S-h>", "<cmd>BufferLineCyclePrev<CR>")
map("n", "sp", "<cmd>BufferLineCyclePrev<CR>")
map("n", "sn", "<cmd>BufferLineCycleNext<CR>")
map("n", "}", "<cmd>BufferLineMoveNext<CR>")
map("n", "{", "<cmd>BufferLineMovePrev<CR>")
map("n", "<space>bh", "<cmd>BufferLineCloseLeft<CR>")
map("n", "<space>bl", "<cmd>BufferLineCloseRight<CR>")
