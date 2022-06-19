local status_ok, packer = pcall(require, "packer")

-- Clone packer if not already installed
if not status_ok then
  local packer_path = vim.fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"

  print("Cloning packer...")
  -- remove the dir before cloning
  vim.fn.delete(packer_path, "rf")
  vim.fn.system({
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    packer_path,
  })
  vim.cmd("packadd packer.nvim")
  status_ok, packer = pcall(require, "packer")

  if status_ok then
    print("Packer cloned successfully.")
  else
    error("Couldn't clone packer !\nPacker path: " .. packer_path .. "\n" .. packer)
  end
end

packer.init({
  compile_path = vim.fn.stdpath("config") .. "/lua/packer_compiled.lua",
  display = {
    open_fn = function()
      return require("packer.util").float({ border = "rounded" })
    end,
  },
  profile = {
    enable = true,
    threshold = 0.0001,
  },
  git = {
    clone_timeout = 300, -- seconds
    subcommands = {
      update = "pull --rebase",
    },
  },
  auto_clean = true,
  compile_on_sync = true,
})

return packer
