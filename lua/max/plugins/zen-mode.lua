return {
  {
    "folke/zen-mode.nvim",
    enabled = true,
    cmd = "ZenMode",
    opts = {
      plugins = {
        gitsigns = false,
        tmux = true,
        kitty = { enabled = false, font = "+2" },
      },
    },
    keys = { { "<leader>z", "<cmd>ZenMode<cr>", desc = "Zen Mode" } },
  },
}
