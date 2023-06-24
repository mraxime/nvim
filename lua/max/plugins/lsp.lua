return {
  "VonHeikemen/lsp-zero.nvim",
  branch = "v2.x",
  dependencies = {
    -- LSP Support
    { "neovim/nvim-lspconfig" }, -- Required
    {                            -- Optional
      "williamboman/mason.nvim",
      build = ":MasonUpdate",
    },
    { "williamboman/mason-lspconfig.nvim" }, -- Optional

    -- Autocompletion
    { "hrsh7th/nvim-cmp" },         -- Required
    { "hrsh7th/cmp-nvim-lsp" },     -- Required
    { "L3MON4D3/LuaSnip" },         -- Required
    { "hrsh7th/cmp-buffer" },       -- Optional
    { "hrsh7th/cmp-path" },         -- Optional
    { "hrsh7th/cmp-nvim-lua" },     -- Optional
    { "saadparwaiz1/cmp_luasnip" }, -- Optional

    -- Snippets
    { 'L3MON4D3/LuaSnip' },
    { 'rafamadriz/friendly-snippets' },

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

    local cmp = require('cmp')
    local cmp_select = { behavior = cmp.SelectBehavior.Replace } -- or cmp.SelectBehavior.Select
    local cmp_mappings = lsp.defaults.cmp_mappings({
      ["<C-Space>"] = cmp.mapping.complete(),
      ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
      ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
      ['<C-u>'] = cmp.mapping.scroll_docs(-4),
      ['<C-d>'] = cmp.mapping.scroll_docs(4),
      ['<CR>'] = cmp.mapping.confirm({ select = true }),
      ['<C-y>'] = cmp.mapping.confirm({ select = true }),
    })

    -- luasnip
    require("luasnip.loaders.from_vscode").lazy_load()
    local cmp_action = require('lsp-zero').cmp_action()
    cmp_mappings['<Tab>'] = cmp_action.luasnip_jump_forward()
    cmp_mappings['<S-Tab>'] = cmp_action.luasnip_jump_backward()

    -- cmp_mappings['<Tab>'] = nil
    -- cmp_mappings['<S-Tab>'] = nil


    -- or lsp.setup_nvim_cmp
    cmp.setup({
      sources = {
        { name = "path" },
        { name = "nvim_lsp" },
        { name = "nvim_lua" },
        { name = "buffer",  keyword_length = 3 },
        { name = "luasnip", keyword_length = 2 },
      },
      mapping = cmp_mappings
    })

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
