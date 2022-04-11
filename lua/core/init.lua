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
    error(("Error loading %s...\n\n%s"):format(source, err))
  end
end
