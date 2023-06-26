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
    {
      "m1",
      function() require("harpoon.mark").set_current_at(1) end,
      desc = "Set current harpoon to file 1",
    },
    {
      "m2",
      function() require("harpoon.mark").set_current_at(2) end,
      desc = "Set current harpoon to file 2",
    },
    {
      "m3",
      function() require("harpoon.mark").set_current_at(3) end,
      desc = "Set current harpoon to file 3",
    },
    {
      "m4",
      function() require("harpoon.mark").set_current_at(4) end,
      desc = "Set current harpoon to file 4",
    },
  },
}
