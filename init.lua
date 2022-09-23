local impatient_ok, impatient = pcall(require, "impatient")
if impatient_ok then
  impatient.enable_profile()
end

local utils = require("core.utils")

utils.bootstrap()

local sources = {
  "core.disabled",
  "core.options",
  "core.plugins",
  "core.autocmds",
  "core.mappings",
  "configs.which-key-register",
}

for _, source in ipairs(sources) do
  local status_ok, fault = pcall(require, source)
  if not status_ok then
    error("Failed to load " .. source .. "\n\n" .. fault)
  elseif source == "core.plugins" then
    utils.compiled()
  end
end

-- Custom UIs
local ui = require("core.ui")
for _, ui_addition in ipairs(ui) do
  ui[ui_addition]()
end
