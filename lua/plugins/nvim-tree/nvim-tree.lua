local init = {
  "kyazdani42/nvim-tree.lua",
  module = "nvim-tree",
  config = function()

    -- set up args
    local args = {
      respect_buf_cwd = true, -- will change cwd of nvim-tree to that of new buffer's
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
      renderer = {
        highlight_git = true,
        special_files = {},
        icons = {
          show  = {
            git = false,
            folder = true,
            file = true,
            folder_arrow = false,
          },
          glyphs = {
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
          }
        }
      }
    }

    require("nvim-tree").setup(args)
  end,
}

return init
