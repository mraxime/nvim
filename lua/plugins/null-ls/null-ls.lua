local init = {
  "jose-elias-alvarez/null-ls.nvim",
  event = { "BufRead", "BufNewFile" },
  config = function()
    local null_ls = require("null-ls")
    require("null-ls").setup({
      sources = {
        null_ls.builtins.code_actions.eslint_d.with({
          prefer_local = "node_modules/.bin",
        }),
        null_ls.builtins.diagnostics.eslint_d.with({
          prefer_local = "node_modules/.bin",
        }),
        null_ls.builtins.diagnostics.markdownlint,
        null_ls.builtins.formatting.prettierd.with({
          env = {
            PRETTIERD_LOCAL_PRETTIER_ONLY = 1,
          },
        }),
        null_ls.builtins.formatting.stylua,
        null_ls.builtins.code_actions.gitsigns,
      },
      on_attach = function(client)
        if client.resolved_capabilities.document_formatting then
          vim.api.nvim_create_augroup("LspFormatting", { clear = true })
          vim.api.nvim_create_autocmd("BufWritePre", {
            callback = function()
              vim.lsp.buf.formatting_sync(nil, 3000)
            end,
            group = "LspFormatting",
            -- buffer = true,
            nested = true,
          })
        end
      end,
    })
  end,
}

return init
