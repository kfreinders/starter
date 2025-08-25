return {
  "kkoomen/vim-doge",
  build = ":call doge#install()",
  event = "FileType",
  init = function()
    vim.g.doge_python_settings = {
      ['single_quotes'] = 0,
      ['omit_redundant_param_types'] = 0
    }
    vim.g.doge_doc_standard_python = "numpy"
  end,
}
