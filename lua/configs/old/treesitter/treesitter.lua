local init = {
  "nvim-treesitter/nvim-treesitter",
  run = ":TSUpdate",
  config = function()
    require("nvim-treesitter.configs").setup({
      ensure_installed = {
        "css",
        "html",
        "javascript",
        "jsdoc",
        "json",
        "lua",
        "markdown",
        "php",
        "prisma",
        "python",
        "scss",
        "svelte",
        "tsx",
        "typescript",
        "vue",
        "yaml",
        "astro",
      },
      sync_install = false,
      ignore_install = {},
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
      },
      context_commentstring = {
        enable = true,
        enable_autocmd = false,
      },
      autopairs = {
        enable = true,
      },
      incremental_selection = {
        enable = true,
      },
      indent = {
        enable = false,
      },
      -- rainbow = {
      --   enable = true,
      --   disable = { "html" },
      --   extended_mode = false,
      --   max_file_lines = nil,
      -- },
      autotag = {
        enable = true,
      },
    })
  end,
}

return init
