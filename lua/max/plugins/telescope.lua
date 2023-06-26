return {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    'nvim-lua/plenary.nvim',
    "nvim-tree/nvim-web-devicons",
    "nvim-telescope/telescope-file-browser.nvim",
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
  },
  keys = {
    {
      "<leader>f",
      function() require("telescope.builtin").find_files() end,
      desc = "Search Files",
    },
    {
      "<leader>/",
      function() require("telescope.builtin").find_files() end,
      desc = "Search Files",
    },
    {
      "<leader>t",
      function() require("telescope.builtin").live_grep() end,
      desc = "Search Text",
    },
    {
      "<leader>o",
      function()
        require("telescope").extensions.file_browser.file_browser({
          path = "%:p:h",
          cwd = vim.fn.expand("%:p:h"),
          respect_gitignore = false,
          hidden = false,
          grouped = true,
          initial_mode = "normal",
          previewer = false,
          layout_config = { height = 40 },
        })
      end,
    },
    -- old muscle memory
    {
      "sf",
      function() require("telescope.builtin").find_files() end,
      desc = "Search Files",
    },
    {
      "st",
      function() require("telescope.builtin").live_grep() end,
      desc = "Search Text",
    },
    {
      "so",
      function()
        require("telescope").extensions.file_browser.file_browser({
          path = "%:p:h",
          cwd = vim.fn.expand("%:p:h"),
          respect_gitignore = false,
          hidden = false,
          grouped = true,
          initial_mode = "normal",
          previewer = false,
          layout_config = { height = 40 },
        })
      end,
    },
  },
  config = function()
    local telescope = require("telescope")
    local actions = require("telescope.actions")
    local fb_actions = require("telescope").extensions.file_browser.actions

    telescope.setup({
      defaults = {
        prompt_prefix = "  ",
        selection_caret = " ",
        path_display = { "truncate" },
        sorting_strategy = "ascending",
        layout_config = {
          horizontal = {
            prompt_position = "top",
            preview_width = 0.55,
            results_width = 0.8,
          },
          vertical = {
            mirror = false,
          },
          width = 0.87,
          height = 0.80,
          preview_cutoff = 120,
        },

        mappings = {
          n = {
            ["q"] = actions.close,
            ["<Space>"] = actions.toggle_selection
          },
        },
      },
      extensions = {
        file_browser = {
          theme = "dropdown",
          -- disables netrw and use telescope-file-browser in its place
          hijack_netrw = true,
          select_buffer = false, -- auto focus file from current buffer
          mappings = {
            -- your custom insert mode mappings
            ["i"] = {
              ["<C-w>"] = function() vim.cmd("normal vbd") end,
            },
            ["n"] = {
              -- your custom normal mode mappings
              ["a"] = fb_actions.create,
              ["h"] = fb_actions.goto_parent_dir,
              ["l"] = actions.select_default,
              ["gh"] = fb_actions.goto_home_dir,
              ["H"] = fb_actions.toggle_hidden,
              ["v"] = fb_actions.toggle_all,
              ["p"] = fb_actions.copy,
              ["m"] = fb_actions.move,
              ["x"] = fb_actions.move,
              ["q"] = actions.close,
              ["/"] = function() vim.cmd("startinsert") end,
            },
          },
        },
      },
    })
    telescope.load_extension("fzf")
    telescope.load_extension("file_browser")

    -- vim.keymap.set("n", "st", function() require("telescope.builtin").live_grep() end)
    -- vim.keymap.set("n", "<leader>sgs", function() require("telescope.builtin").git_status() end)
    -- vim.keymap.set("n", "<leader>sgb", function() require("telescope.builtin").git_branches() end)
    -- vim.keymap.set("n", "<leader>sgc", function() require("telescope.builtin").git_commits() end)
    -- vim.keymap.set("n", "sf", function() require("telescope.builtin").find_files() end)
    -- vim.keymap.set("n", "<leader>sb", function() require("telescope.builtin").buffers() end)
    -- vim.keymap.set("n", "<leader>sh", function() require("telescope.builtin").help_tags() end)
    -- vim.keymap.set("n", "<leader>sm", function() require("telescope.builtin").marks() end)
    -- vim.keymap.set("n", "<leader>sh", function() require("telescope.builtin").help_tags() end)
    -- vim.keymap.set("n", "<leader>sm", function() require("telescope.builtin").man_pages() end)
    -- vim.keymap.set("n", "<leader>sn", function() require("telescope").extensions.notify.notify() end)
    -- vim.keymap.set("n", "<leader>sr", function() require("telescope.builtin").registers() end)
    -- vim.keymap.set("n", "<leader>sk", function() require("telescope.builtin").keymaps() end)
    -- vim.keymap.set("n", "<leader>sc", function() require("telescope.builtin").commands() end)
    -- vim.keymap.set("n", "<leader>ss", function() require("telescope.builtin").resume() end)
    -- vim.keymap.set("n", "<leader>sl", function() require("telescope.builtin").resume() end)
  end,
}
