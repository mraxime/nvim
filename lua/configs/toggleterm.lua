local status_ok, toggleterm = pcall(require, "toggleterm")
if not status_ok then
  return
end

toggleterm.setup({
  size = 10,
  shading_factor = 2,
  open_mapping = [[<A-i>]],
  direction = "float",
  float_opts = {
    width = 90,
    border = "curved",
    highlights = {
      border = "Normal",
      background = "Normal",
    },
  },
})
