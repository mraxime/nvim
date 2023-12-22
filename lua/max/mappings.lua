vim.g.mapleader = " "

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
vim.keymap.set("n", "<C-s>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")
vim.keymap.set("n", "<leader>lf", vim.lsp.buf.format)

vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

vim.keymap.set("n", "<leader><leader>", "<nop>")

-- buffers
vim.keymap.set("n", "gn", "<cmd>bnext<CR>", { noremap = true })
vim.keymap.set("n", "gp", "<cmd>bprev<CR>", { noremap = true })

-- Plugin Manager
vim.keymap.set("n", "<leader>p", "<cmd>Lazy<cr>")

-- Easily edit config file
vim.keymap.set("n", "<leader>.", "<cmd>edit ~/.config/nvim/init.lua<cr>")

-- old muscle memory
vim.keymap.set("n", "<C-h>", "<c-w>h")
vim.keymap.set("n", "<C-l>", "<c-w>l")

-- easier mapping
vim.keymap.set("n", "sp", "<C-^>")

-- anoying
vim.keymap.set("n", "s", "<nop>")

local function goto_or_create_tab(tab_index)
	local tab_count = vim.fn.tabpagenr("$")
	if tab_count < tab_index then
		vim.cmd("tablast") -- create new tabs from the last one
		for _ = tab_count, tab_index - 1 do
			vim.cmd("tabnew")
		end
	end
	vim.cmd("tabnext " .. tab_index)
end

vim.keymap.set("n", "sj", function()
	goto_or_create_tab(1)
end)

vim.keymap.set("n", "sk", function()
	goto_or_create_tab(2)
end)

vim.keymap.set("n", "sl", function()
	goto_or_create_tab(3)
end)

vim.keymap.set("n", "s;", function()
	goto_or_create_tab(4)
end)

-- vim.keymap.set("n", "<c-w>j", function()
-- 	goto_or_create_tab(1)
-- end)
--
-- vim.keymap.set("n", "<c-w>k", function()
-- 	goto_or_create_tab(2)
-- end)
--
-- vim.keymap.set("n", "<c-w>l", function()
-- 	goto_or_create_tab(3)
-- end)
--
-- vim.keymap.set("n", "<c-w>;", function()
-- 	goto_or_create_tab(4)
-- end)
