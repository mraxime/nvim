return {
  "ThePrimeagen/harpoon",
  enabled = true,
  keys = {
    {
      "<leader>m",
      function() require("harpoon.ui").toggle_quick_menu() end,
      desc = "Toggle harpoon menu",
    },
    {
      "mm",
      function() require("harpoon.mark").add_file() end,
      desc = "Add buffer to harpoon",
    },
    {
      "sj",
      function() require("harpoon.ui").nav_file(1) end,
      desc = "Go to harpoon file 1",
    },
    {
      "sk",
      function() require("harpoon.ui").nav_file(2) end,
      desc = "Go to harpoon file 2",
    },
    {
      "sl",
      function() require("harpoon.ui").nav_file(3) end,
      desc = "Go to harpoon file 3",
    },
    {
      "s;",
      function() require("harpoon.ui").nav_file(4) end,
      desc = "Go to harpoon file 4",
    },
  },
}
