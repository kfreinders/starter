return {
  "lervag/vimtex",
  lazy=false,
  init = function()
    vim.g.syntax_on = 0
    vim.g.vimtex_view_method = 'zathura'
    vim.g.vimtex_compiler_method = 'latexmk'
    vim.g.vimtex_fold_enabled = 0
    vim.g.vimtex_fold_manual = 1
    vim.g.vimtex_fold_bib_enabled = 0
  end
}
