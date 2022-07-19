local init = {
  "jose-elias-alvarez/null-ls.nvim",
  event = { "BufRead", "BufNewFile" },
  config = function()
    local null_ls = require("null-ls")
    null_ls.setup({
      sources = {
        -- null_ls.builtins.code_actions.eslint_d.with({
        --   prefer_local = "node_modules/.bin",
        -- }),
        null_ls.builtins.code_actions.eslint_d,
        null_ls.builtins.diagnostics.eslint_d,
        -- null_ls.builtins.diagnostics.eslint_d.with({
        --   condition = function(utils)
        --     return utils.has_file({ ".eslintrc", ".eslintrc.js", ".eslintrc.cjs", ".eslintrc.json" })
        --   end,
        -- }),
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
        if client.server_capabilities.documentFormattingProvider then
          vim.api.nvim_create_autocmd("BufWritePre", {
            desc = "Auto format before save",
            pattern = "<buffer>",
            callback = function()
              vim.lsp.buf.format()
            end,
          })
        end
      end,
    })
  end,
}

return init
