return {
  "VonHeikemen/lsp-zero.nvim",
  branch = "v2.x",
  event = { "BufReadPost", "BufNewFile" },
  dependencies = {
    -- LSP Support
    { "neovim/nvim-lspconfig" }, -- Required
    {                            -- Optional
      "williamboman/mason.nvim",
      build = ":MasonUpdate",
    },
    { "williamboman/mason-lspconfig.nvim" }, -- Optional

    -- load cmp before
    { "hrsh7th/nvim-cmp" }

    -- Formatter
    -- { 'jose-elias-alvarez/null-ls' },
    -- { 'jay-babu/mason-null-ls' },

  },
  config = function()
    local lsp = require("lsp-zero")
    lsp.preset({})

    -- lsp.ensure_installed({
    --   'tsserver',
    --   'rust_analyzer',
    -- })

    -- Fix Undefined global 'vim'
    require("lspconfig").lua_ls.setup(lsp.nvim_lua_ls())

    lsp.set_preferences({
      suggest_lsp_servers = false,
      sign_icons = {
        error = 'E',
        warn = 'W',
        hint = 'H',
        info = 'I'
      }
    })

    lsp.on_attach(function(client, bufnr)
      local opts = { buffer = bufnr, remap = false }
      vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
      vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
      vim.keymap.set("n", "gD", function() vim.lsp.buf.declaration() end, opts)
      vim.keymap.set("n", "gi", function() vim.lsp.buf.implementation() end, opts)
      vim.keymap.set("n", "gt", function() vim.lsp.buf.type_definition() end, opts)
      vim.keymap.set("n", "gr", function() vim.lsp.buf.references() end, opts)
      vim.keymap.set("n", "gs", function() vim.lsp.buf.signature_help() end, opts)
      vim.keymap.set("n", "gl", function() vim.diagnostic.open_float() end, opts)
      vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
      vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
      vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
      vim.keymap.set("n", "<leader>la", function() vim.lsp.buf.code_action() end, opts)
      vim.keymap.set("n", "<leader>lr", function() vim.lsp.buf.rename() end, opts)
      vim.keymap.set("n", "<F2>", function() vim.lsp.buf.rename() end, opts)
      vim.keymap.set({ "n", "x" }, "<F3>", function() vim.lsp.buf.format({ async = true }) end, opts)
    end)

    lsp.format_on_save({
      format_opts = {
        async = false,
        timeout_ms = 10000,
      },
      servers = {
        ['lua_ls'] = { 'lua' },
        ['rust_analyzer'] = { 'rust' },
        ['svelte'] = { 'svelte' },
        -- if you have a working setup with null-ls
        -- you can specify filetypes it can format.
        -- ['null-ls'] = {'javascript', 'typescript'},
      }
    })

    lsp.setup()
    --    local null_ls = require('null-ls')

    -- null_ls.setup({
    --   sources = {
    -- Here you can add tools not supported by mason.nvim
    -- make sure the source name is supported by null-ls
    -- https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md
    --   }
    -- })

    -- See mason-null-ls.nvim's documentation for more details:
    -- https://github.com/jay-babu/mason-null-ls.nvim#setup
    -- require('mason-null-ls').setup({
    --  ensure_installed = nil,
    --  automatic_installation = false, -- You can still set this to `true`
    --  handlers = {
    --      -- Here you can add functions to register sources.
    --      -- See https://github.com/jay-babu/mason-null-ls.nvim#handlers-usage
    --      --
    --     -- If left empty, mason-null-ls will  use a "default handler"
    --      -- to register all sources
    --  }
    -- })

    vim.diagnostic.config({
      virtual_text = false
    })
  end,
}
