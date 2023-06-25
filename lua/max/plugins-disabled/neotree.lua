return {
  -- file explorer
  {
    "nvim-neo-tree/neo-tree.nvim",
    enabled = true,
    branch = "v2.x",
    cmd = "Neotree",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
    },
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
}
