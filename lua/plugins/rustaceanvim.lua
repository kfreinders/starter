return {
  "mrcjkb/rustaceanvim",
  version = "^5",
  lazy = false,
  ft = { "rust" },
  config = function()
    vim.g.rustaceanvim = {
      server = {
        on_attach = function(client, bufnr)
          local buf_map = function(mode, lhs, rhs, desc)
            vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, desc = desc })
          end

          -- Code actions
          buf_map("n", "<leader>la", vim.lsp.buf.code_action, "LSP: Code Action")
          buf_map("v", "<leader>la", vim.lsp.buf.code_action, "LSP: Code Action")
          buf_map("n", "<leader>ln", vim.lsp.buf.rename, "LSP: Rename Symbol")

          -- Format on save
          if client.server_capabilities.documentFormattingProvider then
            vim.api.nvim_create_autocmd("BufWritePre", {
              buffer = bufnr,
              callback = function()
                vim.lsp.buf.format({ async = false })
              end,
            })
          end
        end,
      },
    }
  end,
}

