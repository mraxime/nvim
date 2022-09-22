local init = {
  "hrsh7th/nvim-cmp",
  event = "InsertEnter",
  requires = {
    { "hrsh7th/cmp-buffer", after = 'nvim-cmp' }, -- Buffer completion source
    { "hrsh7th/cmp-nvim-lsp", after = 'nvim-cmp' }, -- LSP completion source
    { "hrsh7th/cmp-path", after = 'nvim-cmp' }, -- Path completion source
    { "saadparwaiz1/cmp_luasnip", after = 'nvim-cmp' }, -- Snippet completion source
  },
  config = function()
    local cmp = require("cmp")
    local snip_status_ok, luasnip = pcall(require, "luasnip")
    if not snip_status_ok then
      return
    end

    local kind_icons = {
      Text = "",
      Method = "",
      Function = "",
      Constructor = "",
      Field = "ﰠ",
      Variable = "",
      Class = "",
      Interface = "",
      Module = "",
      Property = "",
      Unit = "",
      Value = "",
      Enum = "",
      Keyword = "",
      Snippet = "",
      Color = "",
      File = "",
      Reference = "",
      Folder = "",
      EnumMember = "",
      Constant = "",
      Struct = "פּ",
      Event = "",
      Operator = "",
      TypeParameter = "",
    }

    cmp.setup({
      preselect = cmp.PreselectMode.None,
      formatting = {
        -- The array of completion menu field to specify the order of them.
        fields = { "kind", "abbr", "menu" },
        -- The function to customize the completion menu appearance
        format = function(entry, vim_item)
          -- Kind icons
          -- vim_item.kind = string.format('%s %s', icons.kind_icons[vim_item.kind], vim_item.kind)
          vim_item.kind = kind_icons[vim_item.kind]
          vim_item.menu = ({
            nvim_lsp = "(LSP)",
            luasnip = "(Snippet)",
            buffer = "(Buffer)",
            path = "(Path)",
          })[entry.source.name]
          return vim_item
        end,
      },
      snippet = {
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end,
      },
      duplicates = {
        nvim_lsp = 1,
        luasnip = 1,
        cmp_tabnine = 1,
        buffer = 1,
        path = 1,
      },
      confirm_opts = {
        behavior = cmp.ConfirmBehavior.Replace,
        select = false,
      },
      window = {
        documentation = {
          border = "rounded",
        },
      },
      experimental = {
        ghost_text = false,
        native_menu = false,
      },
      completion = {
        keyword_length = 1,
      },
      sources = {
        { name = "nvim_lsp" },
        { name = "luasnip" },
        { name = "buffer" },
        { name = "path" },
      },
      mapping = cmp.mapping.preset.insert({
        ["<Up>"] = cmp.mapping.select_prev_item(),
        ["<Down>"] = cmp.mapping.select_next_item(),
        ["<C-p>"] = cmp.mapping.select_prev_item(),
        ["<C-n>"] = cmp.mapping.select_next_item(),
        ["<C-k>"] = cmp.mapping.select_prev_item(),
        ["<C-j>"] = cmp.mapping.select_next_item(),
        ["<C-d>"] = cmp.mapping(cmp.mapping.scroll_docs(-1), { "i", "c" }),
        ["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(1), { "i", "c" }),
        ["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
        ["<C-y>"] = cmp.config.disable,
        ["<C-e>"] = cmp.mapping({
          i = cmp.mapping.abort(),
          c = cmp.mapping.close(),
        }),
        ["<CR>"] = cmp.mapping.confirm({ select = true }),
        ["<Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_next_item()
          elseif luasnip.expandable() then
            luasnip.expand()
          elseif luasnip.expand_or_jumpable() then
            luasnip.expand_or_jump()
          else
            fallback()
          end
        end, {
          "i",
          "s",
        }),
        ["<S-Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_prev_item()
          elseif luasnip.jumpable(-1) then
            luasnip.jump(-1)
          else
            fallback()
          end
        end, {
          "i",
          "s",
        }),
      }),
    })
  end,
}

return init
