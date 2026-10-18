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
