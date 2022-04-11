local M = {}

local _user_terminals = {}

M.base_notification = { title = "AstroVim" }

function M.list_registered_providers_names(filetype)
  local s = require("null-ls.sources")
  local available_sources = s.get_available(filetype)
  local registered = {}
  for _, source in ipairs(available_sources) do
    for method in pairs(source.methods) do
      registered[method] = registered[method] or {}
      table.insert(registered[method], source.name)
    end
  end
  return registered
end

function M.list_registered_formatters(filetype)
  local null_ls_methods = require("null-ls.methods")
  local formatter_method = null_ls_methods.internal["FORMATTING"]
  local registered_providers = M.list_registered_providers_names(filetype)
  return registered_providers[formatter_method] or {}
end

function M.list_registered_linters(filetype)
  local null_ls_methods = require("null-ls.methods")
  local formatter_method = null_ls_methods.internal["DIAGNOSTICS"]
  local registered_providers = M.list_registered_providers_names(filetype)
  return registered_providers[formatter_method] or {}
end

function M.toggle_term_cmd(cmd)
  if _user_terminals[cmd] == nil then
    _user_terminals[cmd] = require("toggleterm.terminal").Terminal:new({ cmd = cmd, hidden = true })
  end
  _user_terminals[cmd]:toggle()
end

function M.label_plugins(plugins)
  local labelled = {}
  for _, plugin in ipairs(plugins) do
    labelled[plugin[1]] = plugin
  end
  return labelled
end

function M.is_available(plugin)
  return packer_plugins ~= nil and packer_plugins[plugin] ~= nil
end

function M.update()
  local Job = require("plenary.job")

  Job
    :new({
      command = "git",
      args = { "pull", "--ff-only" },
      cwd = vim.fn.stdpath("config"),
      on_exit = function(_, return_val)
        if return_val == 0 then
          vim.notify("Updated!", "info", M.base_notification)
        else
          vim.notify("Update failed! Please try pulling manually.", "error", M.base_notification)
        end
      end,
    })
    :sync()
end

return M
