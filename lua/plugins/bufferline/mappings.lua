local map = vim.keymap.set
map("n", "<S-l>", "<cmd>BufferLineCycleNext<CR>")
map("n", "<S-h>", "<cmd>BufferLineCyclePrev<CR>")
map("n", "}", "<cmd>BufferLineMoveNext<CR>")
map("n", "{", "<cmd>BufferLineMovePrev<CR>")
