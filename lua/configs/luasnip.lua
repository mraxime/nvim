local loader_avail, loader = pcall(require, "luasnip/loaders/from_vscode")
if not loader_avail then
  return
end

loader.lazy_load()
