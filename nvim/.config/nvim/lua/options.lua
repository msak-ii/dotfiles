vim.cmd.colorscheme('warty')

vim.opt.clipboard = 'unnamed'

if vim.fn.has('win32') == 1 then
  vim.opt.shellslash = true
  vim.opt.completeslash = 'slash'
end

vim.opt.relativenumber = true

vim.opt.tabstop = 2
vim.opt.shiftwidth = 0
vim.opt.softtabstop = -1
vim.opt.expandtab = true

vim.opt.winborder = 'rounded'
vim.opt.pumborder = 'rounded'

vim.opt.laststatus = 3
