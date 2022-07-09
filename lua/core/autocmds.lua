local M = {}

local cmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup

augroup("packer_conf", { clear = true })
cmd("BufWritePost", {
  desc = "Sync packer after modifying plugins.lua",
  group = "packer_conf",
  pattern = "plugins.lua",
  command = "source <afile> | PackerSync",
})

return M
