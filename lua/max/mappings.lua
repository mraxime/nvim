vim.g.mapleader = " "
vim.g.maplocalleader = ","

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "J", "mzJ`z")
-- vim.keymap.set("n", "<C-d>", "<C-d>zz")
-- vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- avoid clipboard conflict
vim.keymap.set("x", "<leader>p", [["_dP]])

-- next greatest remap ever : asbjornHaland
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])
vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])

vim.keymap.set("n", "Q", "<nop>")
-- vim.keymap.set("n", "<leader>lf", vim.lsp.buf.format)

-- vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
vim.keymap.set("n", "<leader><leader>", "<nop>")

-- buffers
-- vim.keymap.set("n", "gn", "<cmd>bnext<CR>", { noremap = true })
-- vim.keymap.set("n", "gp", "<cmd>bprev<CR>", { noremap = true })
vim.keymap.set("n", "<C-l>", "<C-^>", { noremap = true })

-- Plugin Manager
vim.keymap.set("n", "<leader>p", "<cmd>Lazy<cr>")

-- Easily edit config file
vim.keymap.set("n", "<leader>.", "<cmd>edit ~/.config/nvim/init.lua<cr>")

-- old muscle memory
-- vim.keymap.set("n", "<C-h>", "<c-w>h")
-- vim.keymap.set("n", "<C-l>", "<c-w>l")

-- TODO: keep yank position
-- vim.keymap.set({ "n", "x" }, "y", "mcy`c", { noremap = true })

-- anoying
vim.keymap.set("n", "s", "<nop>")

-- quickfix navigation
-- vim.keymap.set("n", "[q", "<cmd>cprev<cr>")
-- vim.keymap.set("n", "]q", "<cmd>cnext<cr>")
-- vim.keymap.set("n", "[a", "<cmd>cprev<cr>")
-- vim.keymap.set("n", "]a", "<cmd>cnext<cr>")
-- vim.keymap.set("n", "[c", "<cmd>cprev<cr>")
-- vim.keymap.set("n", "]c", "<cmd>cnext<cr>")

-- experiments
vim.keymap.set("n", "<c-w>c", "<cmd>tabnew<cr>", { noremap = true })
vim.keymap.set("n", "<c-w>x", "<cmd>tabclose<cr>", { noremap = true })
vim.keymap.set("n", "sv", "<cmd>vsplit<cr>", { noremap = true })

vim.keymap.set("n", "U", "<c-r>")
vim.keymap.set({ "n", "v" }, "gh", "0")
-- vim.keymap.set({ "n", "v" }, "gl", "$")

-- vim.keymap.set("n", "ss", "<cmd>split<cr>", { noremap = true })
-- vim.keymap.set("n", "sq", "<cmd>close<cr>", { noremap = true })

-- local function goto_or_create_tab(tab_index)
-- 	local tab_count = vim.fn.tabpagenr("$")
-- 	if tab_count < tab_index then
-- 		vim.cmd("tablast") -- create new tabs from the last one
-- 		for _ = tab_count, tab_index - 1 do
-- 			vim.cmd("tabnew")
-- 		end
-- 	end
-- 	vim.cmd("tabnext " .. tab_index)
-- end
--
-- vim.keymap.set("n", "sj", function()
-- 	goto_or_create_tab(1)
-- end)
--
-- vim.keymap.set("n", "sk", function()
-- 	goto_or_create_tab(2)
-- end)
--
-- vim.keymap.set("n", "sl", function()
-- 	goto_or_create_tab(3)
-- end)
--
-- vim.keymap.set("n", "s;", function()
-- 	goto_or_create_tab(4)
-- end)
