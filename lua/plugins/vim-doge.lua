return {
  "kkoomen/vim-doge",
  build = ":call doge#install()",
  cmd = { "DogeGenerate" },
  init = function()
    vim.g.doge_python_settings = {
      ['single_quotes'] = 0,
      ['omit_redundant_param_types'] = 1
    }
  end,
}
