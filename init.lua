local impatient_ok, impatient = pcall(require, "impatient")
if impatient_ok then
  impatient.enable_profile()
else
  vim.notify("impatient.nvim not installed", vim.log.levels.WARN)
end

require("core")
