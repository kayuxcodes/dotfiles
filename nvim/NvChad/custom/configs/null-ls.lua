local present, null_ls = pcall(require, "null-ls")

if not present then
  return
end

local b = null_ls.builtins
local formatters = b.formatting
-- local linters = b.linters
local sources = {

  -- webdev stuff
  formatters.deno_fmt, -- choosed deno for ts/js files cuz its very fast!
  formatters.prettierd.with { filetypes = { "html", "markdown", "css", "astro" } }, -- so prettier works only on these filetypes

  -- Lua
  formatters.stylua,

  -- cpp
  formatters.clang_format,
  --py
  formatters.black,
}

null_ls.setup {
  debug = true,
  sources = sources,
  -- setting auto format on save
  on_attach = function(client, bufnr)
    local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
    if client.supports_method "textDocument/formatting" then
      vim.api.nvim_clear_autocmds { group = augroup, buffer = bufnr }
      vim.api.nvim_create_autocmd("BufWritePre", {
        group = augroup,
        buffer = bufnr,
        callback = function()
          -- on 0.8, you should use vim.lsp.buf.format({ bufnr = bufnr }) instead
          -- on later neovim version, you should use vim.lsp.buf.format({ async = false }) instead
          vim.lsp.buf.format { async = true }
        end,
      })
    end
  end,
}
-- vim.cmd [[autocmd BufWritePre * Format]]
