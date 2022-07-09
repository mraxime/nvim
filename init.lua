local impatient_ok, impatient = pcall(require, "impatient")
if impatient_ok then
  impatient.enable_profile()
else
  vim.notify("impatient.nvim not installed", vim.log.levels.WARN)
end

local sources = {
  "core.disabled",
  "core.editor",
  "core.plugins",
  "packer_compiled",
  "core.autocmds",
  "core.mappings",
  "plugins.which-key-register",
}

for _, source in ipairs(sources) do
  local status_ok, err = pcall(require, source)
  if not status_ok then
    vim.api.nvim_err_writeln("Failed to load " .. source .. "\n\n" .. err)
  end
end
