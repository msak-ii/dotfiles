vim.keymap.set('i', 'jj', '<Esc>')
vim.keymap.set('n', '<Esc>', '<Cmd>nohlsearch<Cr>')

vim.keymap.set('n', '[c', function()
  if vim.wo.diff then
    vim.cmd.normal({ '[c', bang = true })
  else
    require('gitsigns').nav_hunk('prev')
  end
end)
vim.keymap.set('n', ']c', function()
  if vim.wo.diff then
    vim.cmd.normal({ ']c', bang = true })
  else
    require('gitsigns').nav_hunk('next')
  end
end)

local satellite_enabled = true
vim.keymap.set('n', '\\s', function()
  if satellite_enabled then
    vim.cmd('SatelliteDisable')
  else
    vim.cmd('SatelliteEnable')
  end
  satellite_enabled = not satellite_enabled
end, { desc = 'Toggle Satellite' })

vim.keymap.set({ 'n', 'x' }, 'ga', '<Plug>(EasyAlign)')

vim.keymap.set('n', 'grD', function()
  vim.lsp.buf.declaration()
end, { desc = 'vim.lsp.buf.declaration()' })
vim.keymap.set('n', 'grI', function()
  vim.lsp.buf.incoming_calls()
end, { desc = 'vim.lsp.buf.incoming_calls()' })
vim.keymap.set('n', 'grO', function()
  vim.lsp.buf.outgoing_calls()
end, { desc = 'vim.lsp.buf.outgoing_calls()' })
vim.keymap.set('n', 'grd', function()
  vim.lsp.buf.definition()
end, { desc = 'vim.lsp.buf.definition()' })

vim.keymap.set('n', '<S-b>', function()
  require('gitsigns').blame_line()
end, { desc = 'blame line' })
vim.keymap.set('n', '<S-d>', function()
  vim.diagnostic.open_float()
end, { desc = 'diagnostic' })
vim.keymap.set('n', '<S-h>', function()
  require('gitsigns').preview_hunk()
end, { desc = 'preview hunk' })
vim.keymap.set('n', '<S-s>', function()
  vim.lsp.buf.signature_help()
end, { desc = 'signature help' })

vim.keymap.set('n', '<Leader><Leader>', function()
  require('fzf-lua').buffers()
end, { desc = 'buffers' })
vim.keymap.set('n', '<Leader>=', 'gg=G``', { desc = 'indent' })
vim.keymap.set('n', '<Leader>D', function()
  local t = vim.api.nvim_get_current_tabpage()
  for _, v in ipairs(require('diffview.lib').views) do
    if v.tabpage == t then
      v:close()
      return
    end
  end
  require('diffview').open({ 'HEAD' })
end, { desc = 'diff HEAD' })
vim.keymap.set('n', '<Leader>E', function()
  require('mini.files').open(nil, false)
end, { desc = 'explorer root' })
vim.keymap.set('n', '<Leader>G', function()
  require('fzf-lua').live_grep()
end, { desc = 'grep' })
vim.keymap.set('n', '<Leader>O', function()
  require('fzf-lua').lsp_live_workspace_symbols()
end, { desc = 'workspace symbols' })
vim.keymap.set('n', '<Leader>a', '<Cmd>quitall!<Cr>', { desc = 'quitall' })
vim.keymap.set('n', '<Leader>d', function()
  local t = vim.api.nvim_get_current_tabpage()
  for _, v in ipairs(require('diffview.lib').views) do
    if v.tabpage == t then
      v:close()
      return
    end
  end
  require('diffview').open()
end, { desc = 'diff' })
vim.keymap.set('n', '<Leader>e', function()
  require('mini.files').open(vim.api.nvim_buf_get_name(0), false)
end, { desc = 'explorer' })
vim.keymap.set('n', '<Leader>g', function()
  require('fzf-lua').git_status()
end, { desc = 'git status' })
vim.keymap.set('n', '<Leader>h', function()
  local t = vim.api.nvim_get_current_tabpage()
  for _, v in ipairs(require('diffview.lib').views) do
    if v.tabpage == t then
      v:close()
      return
    end
  end
  require('diffview').file_history(nil, { '%' })
end, { desc = 'history' })
vim.keymap.set('n', '<Leader>o', function()
  require('fzf-lua').lsp_document_symbols()
end, { desc = 'symbols' })
vim.keymap.set('n', '<Leader>p', function()
  local p = vim.uv.cwd() or ''
  if vim.fn.has('win32') == 1 then
    p = p:gsub('\\', '/')
  end
  require('fzf-lua').files({ fzf_opts = { ['--header'] = 'Directory: ' .. p } })
end, { desc = 'files' })
vim.keymap.set('n', '<Leader>q', '<Cmd>quit!<Cr>', { desc = 'quit' })
vim.keymap.set('n', '<Leader>r', '<Cmd>restart<Cr>', { desc = 'restart' })
vim.keymap.set('n', '<Leader>s', '<Cmd>split<Cr>', { desc = 'split' })
vim.keymap.set('n', '<Leader>t', function()
  require('mini.trailspace').trim()
  require('mini.trailspace').trim_last_lines()
end, { desc = 'trim' })
vim.keymap.set('n', '<Leader>v', '<Cmd>vsplit<Cr>', { desc = 'vsplit' })
vim.keymap.set('n', '<Leader>w', '<Cmd>write<Cr>', { desc = 'write' })
vim.keymap.set('n', '<Leader>yh', function()
  vim.fn.setreg('+', vim.fn.expand('%:h'))
end, { desc = 'directory' })
vim.keymap.set('n', '<Leader>yp', function()
  vim.fn.setreg('+', vim.fn.expand('%'))
end, { desc = 'filepath' })
vim.keymap.set('n', '<Leader>yt', function()
  vim.fn.setreg('+', vim.fn.expand('%:t'))
end, { desc = 'filename' })
vim.keymap.set({ 'n', 'x' }, '<Leader>f', function()
  require('conform').format({ async = true, lsp_format = 'fallback' })
end, { desc = 'format' })
