-- Autocompletion
return {
  "hrsh7th/nvim-cmp",
  enabled = true,
  dependencies = {
    { "hrsh7th/cmp-path" },
    { "hrsh7th/cmp-buffer" },
    { "hrsh7th/cmp-nvim-lsp" },
    { "hrsh7th/cmp-nvim-lua" },
    -- Snippets
    { 'L3MON4D3/LuaSnip' },
    { 'rafamadriz/friendly-snippets' },
    { "saadparwaiz1/cmp_luasnip" },
  },
  config = function()
    local cmp = require('cmp')
    local cmp_select_options = { behavior = cmp.SelectBehavior.Replace } -- or cmp.SelectBehavior.Select
    local cmp_mappings = {
      ["<C-Space>"] = cmp.mapping.complete(),
      ['<C-n>'] = cmp.mapping.select_next_item(cmp_select_options),
      ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select_options),
      ['<C-u>'] = cmp.mapping.scroll_docs(-4),
      ['<C-d>'] = cmp.mapping.scroll_docs(4),
      ['<CR>'] = cmp.mapping.confirm({ select = true }),
      ['<C-y>'] = cmp.mapping.confirm({ select = true }),
    }

    -- luasnip
    require("luasnip.loaders.from_vscode").lazy_load()
    local cmp_action = require('lsp-zero').cmp_action()
    cmp_mappings['<Tab>'] = cmp_action.luasnip_jump_forward()
    cmp_mappings['<S-Tab>'] = cmp_action.luasnip_jump_backward()

    -- Init
    cmp.setup({
      sources = {
        { name = "path" },
        { name = "nvim_lsp" },
        { name = "nvim_lua" },
        { name = "buffer",  keyword_length = 3 },
        { name = "luasnip", keyword_length = 2 },
      },
      mapping = cmp_mappings,
      snippet = {
        expand = function(args)
          require('luasnip').lsp_expand(args.body)
        end,
      },
      window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
      },
      formatting = {
        fields = { 'abbr', 'menu', 'kind' },
        format = function(entry, item)
          local short_name = {
            nvim_lsp = 'LSP',
            nvim_lua = 'nvim'
          }

          local menu_name = short_name[entry.source.name] or entry.source.name

          item.menu = string.format('[%s]', menu_name)
          return item
        end,
      },
    })
  end
}
