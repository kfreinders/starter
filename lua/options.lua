require "nvchad.options"
local autocmd = vim.api.nvim_create_autocmd
local opt = vim.opt

-- Override NvChad indentation and line numbers
autocmd("BufEnter", {
  pattern = "*",
  callback = function ()
    opt.expandtab = true
    opt.shiftwidth = 4
    opt.smartindent = true
    opt.tabstop = 4
    opt.softtabstop = 4
    opt.relativenumber = true
  end
})

-- Vertical ruler
autocmd("VimEnter", {
  pattern = "*",
  command = "set colorcolumn=80",
})

vim.cmd([[
set signcolumn=yes
autocmd CursorHold * lua vim.diagnostic.open_float(nil, { focusable = false })
]])
