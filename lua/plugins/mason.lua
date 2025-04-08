return{
  "williamboman/mason.nvim",
  opts = {
      ensure_installed = {
          "clangd",
          "clang-format",
          "texlab",
          "ltex-ls",
          "codelldb",
          "rust-analyzer",
        }
    }
}
