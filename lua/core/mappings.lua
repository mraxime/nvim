local M = {}

local utils = require("utils")

local map = vim.keymap.set

-- leader key
vim.g.mapleader = " "

-- Normal --
if utils.is_available("smart-splits.nvim") then
  -- Better window navigation
  map("n", "<C-h>", function()
    require("smart-splits").move_cursor_left()
  end)
  map("n", "<C-j>", function()
    require("smart-splits").move_cursor_down()
  end)
  map("n", "<C-k>", function()
    require("smart-splits").move_cursor_up()
  end)
  map("n", "<C-l>", function()
    require("smart-splits").move_cursor_right()
  end)
  map("n", "sh", function()
    require("smart-splits").move_cursor_left()
  end)
  map("n", "sj", function()
    require("smart-splits").move_cursor_down()
  end)
  map("n", "sk", function()
    require("smart-splits").move_cursor_up()
  end)
  map("n", "sl", function()
    require("smart-splits").move_cursor_right()
  end)
  map("n", "ss", "<cmd>split<CR>")
  map("n", "sv", "<cmd>vsplit<CR>")
  map("n", "sq", "<cmd>close<CR>")

  -- Resize with arrows
  map("n", "<C-Up>", function()
    require("smart-splits").resize_up()
  end)
  map("n", "<C-Down>", function()
    require("smart-splits").resize_down()
  end)
  map("n", "<C-Left>", function()
    require("smart-splits").resize_left()
  end)
  map("n", "<C-Right>", function()
    require("smart-splits").resize_right()
  end)
end

-- Move text up and down
map("n", "<A-j>", "<Esc><cmd>m .+1<CR>==gi")
map("n", "<A-k>", "<Esc><cmd>m .-2<CR>==gi")

-- Standard Operations
map("n", "<leader>w", "<cmd>w<CR>")
map("n", "<leader>q", "<cmd>q<CR>")
map("n", "<leader>h", "<cmd>nohlsearch<CR>")

if utils.is_available("vim-bbye") then
  map("n", "<leader>c", "<cmd>Bdelete!<CR>")
end

-- Packer
map("n", "<leader>pc", "<cmd>PackerCompile<CR>")
map("n", "<leader>pi", "<cmd>PackerInstall<CR>")
map("n", "<leader>ps", "<cmd>PackerSync<CR>")
map("n", "<leader>pS", "<cmd>PackerStatus<CR>")
map("n", "<leader>pu", "<cmd>PackerUpdate<CR>")

-- NeoTree
if utils.is_available("neo-tree.nvim") then
  map("n", "<leader>e", "<cmd>Neotree toggle<CR>")
end

if utils.is_available("nvim-tree.lua") then
  map("n", "<leader>e", "<cmd>NvimTreeToggle<CR>")
  map("n", ";", "<cmd>NvimTreeCollapse<CR><C-h><C-l>")
end

-- Dashboard
if utils.is_available("dashboard-nvim") then
  map("n", "<leader>d", "<cmd>Dashboard<CR>")
  map("n", "<leader>fn", "<cmd>DashboardNewFile<CR>")
  map("n", "<leader>Sl", "<cmd>SessionLoad<CR>")
  map("n", "<leader>Ss", "<cmd>SessionSave<CR>")
end

-- GitSigns
if utils.is_available("gitsigns.nvim") then
  map("n", "<leader>gn", function()
    require("gitsigns").next_hunk()
  end)
  map("n", "<leader>gp", function()
    require("gitsigns").prev_hunk()
  end)
  map("n", "<leader>gl", function()
    require("gitsigns").blame_line()
  end)
  map("n", "<leader>gd", function()
    require("gitsigns").diffthis("HEAD")
  end)
end

-- Telescope
if utils.is_available("telescope.nvim") then
  map("n", "<leader>st", function()
    require("telescope.builtin").live_grep()
  end)
  map("n", "<leader>sgs", function()
    require("telescope.builtin").git_status()
  end)
  map("n", "<leader>sgb", function()
    require("telescope.builtin").git_branches()
  end)
  map("n", "<leader>sgc", function()
    require("telescope.builtin").git_commits()
  end)
  map("n", "<leader>sf", function()
    require("telescope.builtin").find_files()
  end)
  map("n", "<leader>sb", function()
    require("telescope.builtin").buffers()
  end)
  map("n", "<leader>sh", function()
    require("telescope.builtin").help_tags()
  end)
  map("n", "<leader>sm", function()
    require("telescope.builtin").marks()
  end)
  map("n", "<leader>sh", function()
    require("telescope.builtin").help_tags()
  end)
  map("n", "<leader>sm", function()
    require("telescope.builtin").man_pages()
  end)
  map("n", "<leader>sn", function()
    require("telescope").extensions.notify.notify()
  end)
  map("n", "<leader>sr", function()
    require("telescope.builtin").registers()
  end)
  map("n", "<leader>sk", function()
    require("telescope.builtin").keymaps()
  end)
  map("n", "<leader>sc", function()
    require("telescope.builtin").commands()
  end)
  map("n", "<leader>ss", function()
    require("telescope.builtin").resume()
  end)
  map("n", "<leader>sl", function()
    require("telescope.builtin").resume()
  end)
end

-- LSP
map("n", "gD", vim.lsp.buf.declaration)
map("n", "gd", vim.lsp.buf.definition, { desc = "Show the definition of current function" })
map("n", "gI", vim.lsp.buf.implementation)
map("n", "gr", vim.lsp.buf.references)
map("n", "gl", vim.diagnostic.open_float)
map("n", "[d", vim.diagnostic.goto_prev)
map("n", "]d", vim.diagnostic.goto_next)
map("n", "K", vim.lsp.buf.hover)
map("n", "<leader>la", require("cosmic-ui").code_actions)
map("v", "<leader>la", require("cosmic-ui").range_code_actions)
map("n", "<leader>lr", require("cosmic-ui").rename)
map("n", "<leader>lf", function()
  vim.lsp.buf.format()
end)
map("n", "<leader>ln", vim.diagnostic.goto_next)
map("n", "<leader>lp", vim.diagnostic.goto_prev)

-- Comment
if utils.is_available("Comment.nvim") then
  map("n", "<leader>/", function()
    require("Comment.api").toggle_current_linewise()
  end)
  map("v", "<leader>/", "<esc><cmd>lua require('Comment.api').toggle_linewise_op(vim.fn.visualmode())<CR>")
end

-- Terminal
if utils.is_available("nvim-toggleterm.lua") then
  map({ "n" }, "<leader>tn", function()
    utils.toggle_term_cmd("node")
  end)
  map({ "n", "t" }, "<A-l>", function()
    utils.toggle_term_cmd("lazygit", {
      direction = "float",
      float_opts = {
        border = "single", -- 'single' | 'double' | 'shadow' | 'curved'
        width = 150,
        height = 150,
        winblend = 0,
      },
    })
  end)
  map({ "n", "t" }, "<A-o>", function()
    utils.toggle_term_cmd("zsh")
  end)
  map("n", "<leader>tf", "<cmd>ToggleTerm direction=float<CR>")
  map("n", "<leader>th", "<cmd>ToggleTerm size=10 direction=horizontal<CR>")
end

-- SymbolsOutline
if utils.is_available("symbols-outline.nvim") then
  map("n", "<leader>lS", "<cmd>SymbolsOutline<CR>")
end

-- Visual --
-- Stay in indent mode
map("v", "<", "<gv")
map("v", ">", ">gv")

-- Move text up and down
map("v", "<A-j>", "<cmd>m .+1<CR>==")
map("v", "<A-k>", "<cmd>m .-2<CR>==")

-- Visual Block --
-- Move text up and down
map("x", "J", "<cmd>move '>+1<CR>gv-gv")
map("x", "K", "<cmd>move '<-2<CR>gv-gv")
map("x", "<A-j>", "<cmd>move '>+1<CR>gv-gv")
map("x", "<A-k>", "<cmd>move '<-2<CR>gv-gv")

-- disable Ex mode:
map("n", "Q", "<Nop>")

return M
