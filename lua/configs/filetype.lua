local M = {}

function M.config()
  local present, filetype = pcall(require, "filetype")
  if not present then
    return
  end

  filetype.setup({})
end

return M
