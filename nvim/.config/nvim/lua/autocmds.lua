vim.api.nvim_create_autocmd('CursorMoved', {
  group = vim.api.nvim_create_augroup('User_CursorMoved', { clear = true }),
  callback = function()
    if vim.api.nvim_get_mode().mode ~= 'n' then
      return
    end
    if vim.api.nvim_get_option_value('buftype', {}) ~= '' then
      return
    end
    vim.cmd.normal({ args = { 'zz' }, bang = true })
  end,
})

vim.api.nvim_create_autocmd('WinEnter', {
  group = vim.api.nvim_create_augroup('User_WinEnter', { clear = true }),
  callback = function()
    if vim.api.nvim_win_get_config(0).relative ~= '' then
      vim.keymap.set('n', '<Esc>', '<Cmd>close<CR>', { buffer = true })
    end
  end,
})

vim.api.nvim_create_autocmd('User', {
  group = vim.api.nvim_create_augroup('User_MiniFilesWindowOpen', { clear = true }),
  pattern = 'MiniFilesWindowOpen',
  callback = function(args)
    local files = require('mini.files')
    vim.keymap.set('n', '<C-h>', function()
      files.trim_right()
      files.go_out()
    end, { buffer = args.buf })
    vim.keymap.set('n', '<C-j>', 'j', { buffer = args.buf })
    vim.keymap.set('n', '<C-k>', 'k', { buffer = args.buf })
    vim.keymap.set('n', '<C-l>', function()
      files.trim_left()
      files.go_in()
    end, { buffer = args.buf })
  end,
})
