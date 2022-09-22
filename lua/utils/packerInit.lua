local packer_avail, packer = pcall(require, "packer")

-- Clone packer if not already installed
if not packer_avail then
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
  print("Initializing Packer...\n\n")
  vim.cmd({ cmd = "packadd", args = { "packer.nvim" } })

  packer_avail, packer = pcall(require, "packer")

  if packer_avail then
    print("Packer cloned successfully.")
  else
    error("Failed to load packer at:" .. packer_path)
  end
end

-- Custom config
packer.init({
  compile_path = vim.fn.stdpath("config") .. "/lua/packer_compiled.lua",
  display = {
    open_fn = function()
      return require("packer.util").float({ border = "rounded" })
    end,
  },
  --[[ profile = { ]]
  --[[   enable = true, ]]
  --[[   threshold = 0.0001, ]]
  --[[ }, ]]
})

return packer
