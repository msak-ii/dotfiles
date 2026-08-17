vim.api.nvim_create_autocmd('CursorMoved', {
  group = vim.api.nvim_create_augroup('CenterCursor', { clear = true }),
  pattern = '*',
  callback = function(args)
    if vim.api.nvim_buf_get_option(0, 'buftype') ~= '' then
      return
    end
    vim.cmd.normal({ args = { 'zz' }, bang = true })
  end,
})

vim.api.nvim_create_autocmd('User', {
  group = vim.api.nvim_create_augroup('MiniFilesWindowMappings', { clear = true }),
  pattern = 'MiniFilesWindowOpen',
  callback = function(args)
    vim.keymap.set('n', '<C-h>', function()
      require('mini.files').trim_right()
      require('mini.files').go_out()
    end, { buffer = args.buf })
    vim.keymap.set('n', '<C-j>', 'j', { buffer = args.buf })
    vim.keymap.set('n', '<C-k>', 'k', { buffer = args.buf })
    vim.keymap.set('n', '<C-l>', function()
      require('mini.files').trim_left()
      require('mini.files').go_in()
    end, { buffer = args.buf })
  end,
})
