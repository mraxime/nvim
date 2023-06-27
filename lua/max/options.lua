vim.opt.mouse = "a"
vim.opt.clipboard = "unnamedplus" -- yank sync with system clipboard
vim.opt.cursorline = true
vim.opt.fillchars = { eob = " " } -- Disable `~` on nonexistent lines
vim.opt.laststatus = 3 -- globalstatus
vim.opt.timeoutlen = 275 -- time alowed between key combinaisons
vim.opt.updatetime = 300 -- interval for writing swap file to disk, also used by CursorHold autocommand event

-- Numbers
vim.opt.number = true
vim.opt.numberwidth = 2
vim.opt.relativenumber = false
--vim.opt.ruler = false

-- Indenting
vim.opt.expandtab = true
vim.opt.shiftwidth = 2
vim.opt.smartindent = true
vim.opt.tabstop = 2
vim.opt.softtabstop = 2

-- Search
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.isfname:append("@-@")
vim.opt.shortmess:append("sI") -- disable nvim intro

-- Disk
vim.opt.backup = false
vim.opt.swapfile = false
vim.opt.undofile = true
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"

-- UI
vim.opt.scrolloff = 5
vim.opt.pumheight = 10
vim.opt.cmdheight = 0
vim.opt.signcolumn = "yes"
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.termguicolors = true
-- vim.opt.colorcolumn = "80" -- ruler
