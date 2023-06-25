return {
  "ThePrimeagen/harpoon",
  config = function()
    local mark = require("harpoon.mark")
    local ui = require("harpoon.ui")

    vim.keymap.set("n", "ss", function() ui.toggle_quick_menu() end)
    vim.keymap.set("n", "mm", function() mark.add_file() end)
    vim.keymap.set("n", "sj", function() ui.nav_file(1) end)
    vim.keymap.set("n", "sk", function() ui.nav_file(2) end)
    vim.keymap.set("n", "sl", function() ui.nav_file(3) end)
    vim.keymap.set("n", "s;", function() ui.nav_file(4) end)
  end
}
