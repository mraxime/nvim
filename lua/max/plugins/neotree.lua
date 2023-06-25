return {
  -- file explorer
  {
    "nvim-neo-tree/neo-tree.nvim",
    cmd = "Neotree",
    keys = {
      {
        "<leader>e",
        function() require("neo-tree.command").execute({ toggle = true }) end,
        desc = "Explorer NeoTree (root dir)",
      },
    },
    deactivate = function() vim.cmd([[Neotree close]]) end,
    init = function()
      vim.g.neo_tree_remove_legacy_commands = 1
      if vim.fn.argc() == 1 then
        local stat = vim.loop.fs_stat(vim.fn.argv(0))
        if stat and stat.type == "directory" then require("neo-tree") end
      end
    end,
    opts = {
      filesystem = {
        bind_to_cwd = false,
        follow_current_file = true,
      },
      window = {
        width = 32,
        mappings = {
          ["<space>"] = "none",
          o = "system_open",
          O = "system_open",
          l = "open",
          h = "close_node",
          s = false,
        },
      },
      commands = {
        system_open = function(state)
          local node = state.tree:get_node()
          local path = node:get_id()
          -- macOs: open file in default application in the background.
          -- Probably you need to adapt the Linux recipe for manage path with spaces. I don't have a mac to try.
          vim.api.nvim_command("silent !open -g " .. path)
          -- Linux: open file in default application
          vim.api.nvim_command(string.format("silent !xdg-open '%s'", path))
        end,
      },
    },
  },

  -- search/replace in multiple files
  {
    "windwp/nvim-spectre",
    -- stylua: ignore
    keys = {
      { "<leader>lR", function() require("spectre").open() end, desc = "Replace in files (Spectre)" },
    },
  },

  -- fuzzy finder
  {
    "nvim-telescope/telescope.nvim",
    cmd = "Telescope",
    version = false, -- telescope did only one release, so use HEAD for now
    dependencies = {
      { "nvim-telescope/telescope-file-browser.nvim" },
    },
    keys = {
      { "st",         utils.telescope("live_grep"),                   desc = "Search Text (Grep)" },
      { "sf",         utils.telescope("files", { cwd = false }),      desc = "Search Files (cwd)" },
      { "sF",         utils.telescope("files"),                       desc = "Search Files (root dir)" },
      { "sb",         "<cmd>Telescope buffers<cr>",                   desc = "Buffers" },
      { "sr",         "<cmd>Telescope oldfiles<cr>",                  desc = "Recent" },
      -- git
      { "<leader>gc", "<cmd>Telescope git_commits<CR>",               desc = "commits" },
      { "<leader>gs", "<cmd>Telescope git_status<CR>",                desc = "status" },
      -- search
      { "<leader>sa", "<cmd>Telescope autocommands<cr>",              desc = "Auto Commands" },
      { "<leader>sb", "<cmd>Telescope current_buffer_fuzzy_find<cr>", desc = "Buffer" },
      { "<leader>sc", "<cmd>Telescope command_history<cr>",           desc = "Command History" },
      { "<leader>sC", "<cmd>Telescope commands<cr>",                  desc = "Commands" },
      { "<leader>sd", "<cmd>Telescope diagnostics<cr>",               desc = "Diagnostics" },
      { "<leader>sg", utils.telescope("live_grep"),                   desc = "Grep (root dir)" },
      { "<leader>sG", utils.telescope("live_grep", { cwd = false }),  desc = "Grep (cwd)" },
      { "<leader>sh", "<cmd>Telescope help_tags<cr>",                 desc = "Help Pages" },
      { "<leader>sH", "<cmd>Telescope highlights<cr>",                desc = "Search Highlight Groups" },
      { "<leader>sk", "<cmd>Telescope keymaps<cr>",                   desc = "Key Maps" },
      { "<leader>sM", "<cmd>Telescope man_pages<cr>",                 desc = "Man Pages" },
      { "<leader>sm", "<cmd>Telescope marks<cr>",                     desc = "Jump to Mark" },
      { "<leader>so", "<cmd>Telescope vim_options<cr>",               desc = "Options" },
      { "<leader>sR", "<cmd>Telescope resume<cr>",                    desc = "Resume" },
      {
        "<leader>ss",
        utils.telescope("lsp_document_symbols", {
          symbols = {
            "Class",
            "Function",
            "Method",
            "Constructor",
            "Interface",
            "Module",
            "Struct",
            "Trait",
            "Field",
            "Property",
          },
        }),
        desc = "Goto Symbol",
      },
      {
        "<leader>sS",
        utils.telescope("lsp_workspace_symbols", {
          symbols = {
            "Class",
            "Function",
            "Method",
            "Constructor",
            "Interface",
            "Module",
            "Struct",
            "Trait",
            "Field",
            "Property",
          },
        }),
        desc = "Goto Symbol (Workspace)",
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
          prompt_prefix = " ",
          selection_caret = " ",
          mappings = {
            i = {
              ["<c-t>"] = function(...) return require("trouble.providers.telescope").open_with_trouble(...) end,
              ["<a-t>"] = function(...) return require("trouble.providers.telescope").open_selected_with_trouble(...) end,
              ["<a-i>"] = function() utils.telescope("find_files", { no_ignore = true })() end,
              ["<a-h>"] = function() utils.telescope("find_files", { hidden = true })() end,
              ["<C-Down>"] = function(...) return require("telescope.actions").cycle_history_next(...) end,
              ["<C-Up>"] = function(...) return require("telescope.actions").cycle_history_prev(...) end,
              ["<C-f>"] = function(...) return require("telescope.actions").preview_scrolling_down(...) end,
              ["<C-b>"] = function(...) return require("telescope.actions").preview_scrolling_up(...) end,
              ["<C-j>"] = actions.move_selection_next,
              ["<C-k>"] = actions.move_selection_previous,
            },
            n = {
              ["q"] = function(...) return require("telescope.actions").close(...) end,
            },
          },
        },
        extensions = {
          file_browser = {
            theme = "dropdown",
            -- disables netrw and use telescope-file-browser in its place
            hijack_netrw = false,
            select_buffer = false, -- auto focus file from current buffer
            mappings = {
              -- your custom insert mode mappings
              ["i"] = {
                ["<C-w>"] = function() vim.cmd("normal vbd") end,
              },
              ["n"] = {
                -- your custom normal mode mappings
                ["n"] = fb_actions.create,
                ["h"] = fb_actions.goto_parent_dir,
                ["l"] = actions.select_default,
                ["gh"] = fb_actions.goto_home_dir,
                ["H"] = fb_actions.toggle_hidden,
                ["v"] = fb_actions.toggle_all,
                ["p"] = fb_actions.copy,
                ["m"] = fb_actions.move,
                ["q"] = actions.close,
                ["/"] = function() vim.cmd("startinsert") end,
              },
            },
          },
        },
      })
      telescope.load_extension("file_browser")
    end,
  },

  -- easily jump to any location and enhanced f/t motions for Leap
  {
    "ggandor/flit.nvim",
    keys = function()
      ---@type LazyKeys[]
      local ret = {}
      for _, key in ipairs({ "f", "F", "t", "T" }) do
        ret[#ret + 1] = { key, mode = { "n", "x", "o" }, desc = key }
      end
      return ret
    end,
    opts = { labeled_modes = "nx" },
  },
  {
    "ggandor/leap.nvim",
    commit = "9a69feb",
    keys = {
      { "s",  mode = { "n", "x", "o" }, desc = "Leap forward to" },
      { "S",  mode = { "n", "x", "o" }, desc = "Leap backward to" },
      { "gs", mode = { "n", "x", "o" }, desc = "Leap from windows" },
    },
    config = function(_, opts)
      local leap = require("leap")
      for k, v in pairs(opts) do
        leap.opts[k] = v
      end
      leap.add_default_mappings(true)
      vim.keymap.del({ "x", "o" }, "x")
      vim.keymap.del({ "x", "o" }, "X")
    end,
  },

  -- which-key
  -- {
  --   "folke/which-key.nvim",
  --   event = "VeryLazy",
  --   opts = {
  --     plugins = { spelling = true },
  --   },
  --   config = function(_, opts)
  --     local wk = require("which-key")
  --     wk.setup(opts)
  --     local keymaps = {
  --       mode = { "n", "v" },
  --       ["g"] = { name = "+goto" },
  --       ["gz"] = { name = "+surround" },
  --       ["]"] = { name = "+next" },
  --       ["["] = { name = "+prev" },
  --       ["<leader><tab>"] = { name = "+tabs" },
  --       ["<leader>b"] = { name = "+buffer" },
  --       ["<leader>c"] = { name = "+code" },
  --       ["<leader>f"] = { name = "+file/find" },
  --       ["<leader>g"] = { name = "+git" },
  --       ["<leader>gh"] = { name = "+hunks" },
  --       ["<leader>s"] = { name = "+search" },
  --       ["<leader>q"] = { name = "+quit/session" },
  --       ["<leader>u"] = { name = "+ui" },
  --       ["<leader>w"] = { name = "+windows" },
  --       ["<leader>x"] = { name = "+diagnostics/quickfix" },
  --     }
  --     if utils.has("noice.nvim") then
  --       keymaps["<leader>sn"] = { name = "+noice" }
  --     end
  --     wk.register(keymaps)
  --   end,
  -- },

  -- git signs
  {
    "lewis6991/gitsigns.nvim",
    event = { "BufReadPre", "BufNewFile" },
    opts = {
      signs = {
        add = { text = "▎" },
        change = { text = "▎" },
        delete = { text = "" },
        topdelete = { text = "" },
        changedelete = { text = "▎" },
        untracked = { text = "▎" },
      },
      on_attach = function(buffer)
        local gs = package.loaded.gitsigns

        local function map(mode, l, r, desc) vim.keymap.set(mode, l, r, { buffer = buffer, desc = desc }) end

        -- stylua: ignore start
        map("n", "]h", gs.next_hunk, "Next Hunk")
        map("n", "[h", gs.prev_hunk, "Prev Hunk")
        map({ "n", "v" }, "<leader>ghs", ":Gitsigns stage_hunk<CR>", "Stage Hunk")
        map({ "n", "v" }, "<leader>ghr", ":Gitsigns reset_hunk<CR>", "Reset Hunk")
        map("n", "<leader>gS", gs.stage_buffer, "Stage Buffer")
        map("n", "<leader>gu", gs.undo_stage_hunk, "Undo Stage Hunk")
        map("n", "<leader>gR", gs.reset_buffer, "Reset Buffer")
        map("n", "<leader>gp", gs.preview_hunk, "Preview Hunk")
        map("n", "<leader>gb", function() gs.blame_line({ full = true }) end, "Blame Line")
        map("n", "<leader>gd", gs.diffthis, "Diff This")
        map("n", "<leader>gD", function() gs.diffthis("~") end, "Diff This ~")
        map({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>", "GitSigns Select Hunk")
      end,
    },
  },

  -- references
  {
    "RRethy/vim-illuminate",
    event = { "BufReadPost", "BufNewFile" },
    opts = { delay = 200 },
    config = function(_, opts)
      require("illuminate").configure(opts)

      local function map(key, dir, buffer)
        vim.keymap.set(
          "n",
          key,
          function() require("illuminate")["goto_" .. dir .. "_reference"](false) end,
          { desc = dir:sub(1, 1):upper() .. dir:sub(2) .. " Reference", buffer = buffer }
        )
      end

      map("]]", "next")
      map("[[", "prev")

      -- also set it after loading ftplugins, since a lot overwrite [[ and ]]
      vim.api.nvim_create_autocmd("FileType", {
        callback = function()
          local buffer = vim.api.nvim_get_current_buf()
          map("]]", "next", buffer)
          map("[[", "prev", buffer)
        end,
      })
    end,
    keys = {
      { "]]", desc = "Next Reference" },
      { "[[", desc = "Prev Reference" },
    },
  },

  -- buffer remove
  {
    "echasnovski/mini.bufremove",
    -- stylua: ignore
    keys = {
      { "<leader>c", function() require("mini.bufremove").delete(0, false) end, desc = "Delete Buffer" },
      { "<leader>C", function() require("mini.bufremove").delete(0, true) end,  desc = "Delete Buffer (Force)" },
    },
  },

  -- better diagnostics list and others
  -- {
  --   "folke/trouble.nvim",
  --   cmd = { "TroubleToggle", "Trouble" },
  --   opts = { use_diagnostic_signs = true },
  --   keys = {
  --     { "<leader>xx", "<cmd>TroubleToggle document_diagnostics<cr>", desc = "Document Diagnostics (Trouble)" },
  --     { "<leader>xX", "<cmd>TroubleToggle workspace_diagnostics<cr>", desc = "Workspace Diagnostics (Trouble)" },
  --   },
  -- },

  -- todo comments
  {
    "folke/todo-comments.nvim",
    cmd = { "TodoTrouble", "TodoTelescope" },
    event = { "BufReadPost", "BufNewFile" },
    config = true,
    -- stylua: ignore
    keys = {
      { "]T",         function() require("todo-comments").jump_next() end, desc = "Next todo comment" },
      { "[T",         function() require("todo-comments").jump_prev() end, desc = "Previous todo comment" },
      { "<leader>xt", "<cmd>TodoTrouble<cr>",                              desc = "Todo (Trouble)" },
      { "<leader>xT", "<cmd>TodoTrouble keywords=TODO,FIX,FIXME<cr>",      desc = "Todo/Fix/Fixme (Trouble)" },
      { "<leader>sT", "<cmd>TodoTelescope<cr>",                            desc = "Todo" },
    },
  },
}
