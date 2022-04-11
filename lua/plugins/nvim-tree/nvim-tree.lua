local init = {
  "kyazdani42/nvim-tree.lua",
  module = "nvim-tree",
  config = function()
    local g = vim.g

    -- settings
    g.nvim_tree_git_hl = 1
    g.nvim_tree_refresh_wait = 300

    g.nvim_tree_respect_buf_cwd = 1 -- will change cwd of nvim-tree to that of new buffer's
    g.nvim_tree_special_files = {}

    g.nvim_tree_icons = {
      default = "",
      symlink = "",
      git = {
        unstaged = "✗",
        staged = "✓",
        unmerged = "",
        renamed = "➜",
        untracked = "★",
        deleted = "",
        ignored = "◌",
      },
      folder = {
        arrow_open = "",
        arrow_closed = "",
        default = "",
        open = "",
        empty = "",
        empty_open = "",
        symlink = "",
        symlink_open = "",
      },

      lsp = {
        hint = "",
        info = "",
        warning = "",
        error = "",
      },
    }

    g.nvim_tree_show_icons = {
      git = 0,
      folders = 1,
      files = 1,
      folder_arrows = 0,
    }

    -- set up args
    local args = {
      diagnostics = {
        enable = true,
      },
      ignore_ft_on_setup = {
        "startify",
        "dashboard",
        "alpha",
      },
      update_cwd = true,
      update_focused_file = {
        enable = true,
        -- update_cwd = true,
      },
      git = {
        enable = true,
        ignore = true,
        timeout = 200,
      },
      filters = {
        dotfiles = true, -- hide dotfiles by default
      },
      actions = {
        change_dir = {
          global = false,
        },
        open_file = {
          resize_window = true,
        },
      },
      view = {
        mappings = {
          list = {
            { key = { "l", "<CR>", "o" }, action = "edit", mode = "n" },
            { key = "h", action = "close_node" },
            { key = "v", action = "vsplit" },
            { key = "C", action = "cd" },
          },
        },
      },
    }

    require("nvim-tree").setup(args)
  end,
}

return init
