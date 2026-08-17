vim.opt.clipboard = 'unnamed'

vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.shiftwidth = 0
vim.opt.softtabstop = -1
vim.opt.expandtab = true

vim.opt.winborder = 'rounded'
vim.opt.pumborder = 'rounded'

vim.opt.foldmethod = 'marker'

vim.cmd.colorscheme('miniwinter')
require('mini.colors').get_colorscheme():add_transparency():apply()
