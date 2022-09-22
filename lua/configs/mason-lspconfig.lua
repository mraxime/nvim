local status_ok, mason_lspconfig = pcall(require, "mason-lspconfig")
if not status_ok then
  return
end

mason_lspconfig.setup({
  ensure_installed = {
    "css-lsp",
    "emmet-ls",
    "eslint_d",
    "html-lsp",
    "lua-language-server",
    "markdownlint",
    "prettierd",
    "stylua",
    "svelte-language-server",
    "typescript-language-server",
  },
})

mason_lspconfig.setup_handlers({
  function(server_name)
    local server = require("lspconfig")[server_name]
    local opts = {}
    opts.on_attach = require("lsp.handlers").on_attach
    opts.capabilities = require("lsp.handlers").capabilities

    -- Apply Custom server settings (if available)
    local present, av_overrides = pcall(require, "lsp.server-settings." .. server.name)
    if present then
      opts = vim.tbl_deep_extend("force", av_overrides, opts)
    end

    server.setup(opts)
  end,
})
