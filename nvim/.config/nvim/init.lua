-- plugins
-- {{{ mini
vim.pack.add({ 'https://github.com/nvim-mini/mini.nvim' })

-- Text
require('mini.ai').setup()
-- require('mini.align').setup()
require('mini.comment').setup()
require('mini.completion').setup({
  mappings = {
    force_twostep = '<C-j>',
  },
})
-- require('mini.keymap').setup()
-- require('mini.move').setup()
-- require('mini.operators').setup()
-- require('mini.pairs').setup()
-- require('mini.snippets').setup()
-- require('mini.splitjoin').setup()
-- require('mini.surround').setup()
--
-- General
require('mini.basics').setup({
  options = {
    extra_ui = true,
  },
  mappings = {
    windows = true,
    move_with_alt = true,
  },
})
-- require('mini.bracketed').setup()
-- require('mini.bufremove').setup()
local miniclue = require('mini.clue')
miniclue.setup({
  triggers = {
    -- Leader triggers
    { mode = { 'n', 'x' }, keys = '<Leader>' },

    -- `[` and `]` keys
    { mode = 'n', keys = '[' },
    { mode = 'n', keys = ']' },

    -- Built-in completion
    { mode = 'i', keys = '<C-x>' },

    -- `g` key
    { mode = { 'n', 'x' }, keys = 'g' },

    -- Marks
    { mode = { 'n', 'x' }, keys = '\'' },
    { mode = { 'n', 'x' }, keys = '`' },

    -- Registers
    { mode = { 'n', 'x' }, keys = '"' },
    { mode = { 'i', 'c' }, keys = '<C-r>' },

    -- Window commands
    { mode = 'n', keys = '<C-w>' },

    -- `z` key
    { mode = { 'n', 'x' }, keys = 'z' },

    -- `\\` key
    { mode = { 'n', 'x' }, keys = '\\' },
  },

  clues = {
    -- Enhance this by adding descriptions for <Leader> mapping groups
    miniclue.gen_clues.square_brackets(),
    miniclue.gen_clues.builtin_completion(),
    miniclue.gen_clues.g(),
    miniclue.gen_clues.marks(),
    miniclue.gen_clues.registers(),
    miniclue.gen_clues.windows(),
    miniclue.gen_clues.z(),

    { mode = 'n', keys = '<Leader>y', desc = '+Yank' },
  },

  window = {
    config = {
      width = 'auto',
    },
  },
})
require('mini.cmdline').setup()
-- require('mini.deps').setup()
-- require('mini.diff').setup()
-- require('mini.extra').setup()
require('mini.files').setup({
  mappings = {
    close = '<Esc>',
    go_in = '',
    go_in_plus = '',
    go_out = '',
    go_out_plus = '',
  },
})
require('mini.git').setup()
-- require('mini.input').setup()
-- require('mini.jump').setup()
-- require('mini.jump2d').setup()
-- require('mini.misc').setup()
-- require('mini.pick').setup()
-- require('mini.sessions').setup()
-- require('mini.visits').setup()

-- Appearance
-- require('mini.animate').setup()
-- require('mini.base16').setup()
-- require('mini.colors').setup()
require('mini.cursorword').setup()
require('mini.hipatterns').setup()
-- require('mini.hues').setup()
require('mini.icons').setup({
  style = 'ascii',
})
require('mini.indentscope').setup()
-- require('mini.map').setup()
require('mini.notify').setup()
-- require('mini.starter').setup()
require('mini.statuscolumn').setup()
require('mini.statusline').setup({
  use_icons = false,
})
-- require('mini.tabline').setup()
require('mini.trailspace').setup()

-- Other
-- require('mini.doc').setup()
-- require('mini.fuzzy').setup()
-- require('mini.test').setup()

vim.api.nvim_create_autocmd('User', {
  group = vim.api.nvim_create_augroup('User_MiniFilesWindowOpen', { clear = true }),
  pattern = 'MiniFilesWindowOpen',
  callback = function(args)
    local minifiles = require('mini.files')
    vim.keymap.set('n', '<C-h>', function()
      minifiles.trim_right()
      minifiles.go_out()
    end, { buffer = args.buf })
    vim.keymap.set('n', '<C-j>', 'j', { buffer = args.buf })
    vim.keymap.set('n', '<C-k>', 'k', { buffer = args.buf })
    vim.keymap.set('n', '<C-l>', function()
      minifiles.trim_left()
      minifiles.go_in()
    end, { buffer = args.buf })
  end,
})

vim.keymap.set('n', '<Leader>E', function()
  require('mini.files').open(nil, false)
end, { desc = 'explorer root' })
vim.keymap.set('n', '<Leader>e', function()
  require('mini.files').open(vim.api.nvim_buf_get_name(0), false)
end, { desc = 'explorer' })

vim.keymap.set('n', '<Leader>t', function()
  local minitrailspace = require('mini.trailspace')
  minitrailspace.trim()
  minitrailspace.trim_last_lines()
end, { desc = 'trim' })
-- }}}

-- {{{ easy-align
vim.pack.add({ 'https://github.com/junegunn/vim-easy-align' })

vim.keymap.set({ 'n', 'x' }, 'ga', '<Plug>(EasyAlign)')
-- }}}

-- {{{ treesitter
vim.pack.add({
  'https://github.com/nvim-treesitter/nvim-treesitter',
  'https://github.com/nvim-treesitter/nvim-treesitter-context',
})

require('nvim-treesitter').setup()
require('treesitter-context').setup()
-- }}}

-- {{{ mason
vim.pack.add({
  'https://github.com/neovim/nvim-lspconfig',
  'https://github.com/mason-org/mason.nvim',
  'https://github.com/mason-org/mason-lspconfig.nvim',
})

require('mason').setup()
require('mason-lspconfig').setup({
  automatic_enable = false,
})
-- }}}

-- {{{ conform
vim.pack.add({ 'https://github.com/stevearc/conform.nvim' })

require('conform').setup({
  formatters_by_ft = {
    lua = { 'stylua' },
  },
})

vim.keymap.set({ 'n', 'x' }, '<Leader>f', function()
  require('conform').format({ async = true, lsp_format = 'fallback' })
end, { desc = 'format' })
-- }}}

-- {{{ fzf-lua
vim.pack.add({ 'https://github.com/ibhagwan/fzf-lua' })

local fzf_lua = require('fzf-lua')
local fzf_lua_actions = require('fzf-lua.actions')

local fd_opts = fzf_lua.config.defaults.files.fd_opts
local rg_opts = fzf_lua.config.defaults.grep.rg_opts
if vim.fn.has('win32') == 1 then
  fd_opts = [[--path-separator "/" ]] .. fd_opts
  rg_opts = [[--path-separator "/" ]] .. rg_opts
end

fzf_lua.setup({
  defaults = {
    formatter = 'path.filename_first',
  },
  winopts = {
    preview = {
      hidden = true,
    },
    on_create = function()
      vim.keymap.set('t', '<C-r>', [['<C-\><C-N>"'.nr2char(getchar()).'pi']], { expr = true, buffer = true })
    end,
  },
  files = {
    fd_ops = fd_opts,
    cwd_prompt = false,
    actions = {
      ['enter'] = fzf_lua_actions.file_edit,
    },
  },
  git = {
    status = {
      actions = {
        ['enter'] = fzf_lua_actions.file_edit,
      },
    },
  },
  grep = {
    rg_opts = rg_opts,
    hidden = true,
  },
  lsp = {
    symbols = {
      symbol_style = 3,
    },
  },
})

vim.keymap.set('n', '<Leader><Leader>', fzf_lua.buffers, { desc = 'buffers' })
vim.keymap.set('n', '<Leader>G', fzf_lua.live_grep, { desc = 'grep' })
vim.keymap.set('n', '<Leader>O', fzf_lua.lsp_live_workspace_symbols, { desc = 'workspace symbols' })
vim.keymap.set('n', '<Leader>g', fzf_lua.git_status, { desc = 'git status' })
vim.keymap.set('n', '<Leader>o', fzf_lua.lsp_document_symbols, { desc = 'symbols' })
vim.keymap.set('n', '<Leader>p', function()
  local cwd = vim.uv.cwd() or ''
  if vim.fn.has('win32') == 1 then
    cwd = cwd:gsub('\\', '/')
  end
  fzf_lua.files({ fzf_opts = { ['--header'] = 'cwd: ' .. cwd } })
end, { desc = 'files' })
-- }}}

-- {{{ gitsigns
vim.pack.add({ 'https://github.com/lewis6991/gitsigns.nvim' })

require('gitsigns').setup({
  on_attach = function(bufnr)
    local gitsigns = require('gitsigns')

    local function map(mode, l, r, opts)
      opts = opts or {}
      opts.buffer = bufnr
      vim.keymap.set(mode, l, r, opts)
    end

    -- Navigation
    map('n', ']c', function()
      if vim.wo.diff then
        vim.cmd.normal({ ']c', bang = true })
      else
        gitsigns.nav_hunk('next')
      end
    end)

    map('n', '[c', function()
      if vim.wo.diff then
        vim.cmd.normal({ '[c', bang = true })
      else
        gitsigns.nav_hunk('prev')
      end
    end)

    -- Actions
    -- map('n', '<leader>hs', gitsigns.stage_hunk)
    -- map('n', '<leader>hr', gitsigns.reset_hunk)
    --
    -- map('v', '<leader>hs', function()
    --   gitsigns.stage_hunk({ vim.fn.line('.'), vim.fn.line('v') })
    -- end)
    --
    -- map('v', '<leader>hr', function()
    --   gitsigns.reset_hunk({ vim.fn.line('.'), vim.fn.line('v') })
    -- end)
    --
    -- map('n', '<leader>hS', gitsigns.stage_buffer)
    -- map('n', '<leader>hR', gitsigns.reset_buffer)
    map('n', '<S-h>', gitsigns.preview_hunk, { desc = 'preview hunk' })
    -- map('n', '<leader>hi', gitsigns.preview_hunk_inline)
    --
    map('n', '<S-b>', function()
      gitsigns.blame_line({ full = true })
    end, { desc = 'blame line' })
    --
    -- map('n', '<leader>hd', gitsigns.diffthis)
    --
    -- map('n', '<leader>hD', function()
    --   gitsigns.diffthis('~')
    -- end)
    --
    -- map('n', '<leader>hQ', function()
    --   gitsigns.setqflist('all')
    -- end)
    -- map('n', '<leader>hq', gitsigns.setqflist)

    -- Toggles
    map('n', '\\b', gitsigns.toggle_current_line_blame, { desc = 'Toggle line blame' })
    -- map('n', '<leader>tw', gitsigns.toggle_word_diff)

    -- Text object
    map({ 'o', 'x' }, 'ih', gitsigns.select_hunk)
  end,
})
-- }}}

-- {{{ satellite
vim.pack.add({ 'https://github.com/lewis6991/satellite.nvim' })

require('satellite').setup()

local satellite_enabled = true
vim.keymap.set('n', '\\s', function()
  if satellite_enabled then
    vim.cmd('SatelliteDisable')
  else
    vim.cmd('SatelliteEnable')
  end
  satellite_enabled = not satellite_enabled
end, { desc = 'Toggle Satellite' })
-- }}}

-- {{{ diffview
vim.pack.add({ 'https://github.com/sindrets/diffview.nvim' })

require('diffview').setup({
  use_icons = false,
})

vim.keymap.set('n', '<Leader>D', function()
  local current_tabpage = vim.api.nvim_get_current_tabpage()
  for _, view in ipairs(require('diffview.lib').views) do
    if view.tabpage == current_tabpage then
      view:close()
      return
    end
  end
  require('diffview').open({ 'HEAD' })
end, { desc = 'diff HEAD' })
vim.keymap.set('n', '<Leader>d', function()
  local current_tabpage = vim.api.nvim_get_current_tabpage()
  for _, view in ipairs(require('diffview.lib').views) do
    if view.tabpage == current_tabpage then
      view:close()
      return
    end
  end
  require('diffview').open()
end, { desc = 'diff' })
vim.keymap.set('n', '<Leader>h', function()
  local current_tabpage = vim.api.nvim_get_current_tabpage()
  for _, view in ipairs(require('diffview.lib').views) do
    if view.tabpage == current_tabpage then
      view:close()
      return
    end
  end
  require('diffview').file_history(nil, { '%' })
end, { desc = 'history' })
-- }}}

-- neovim
-- {{{ options
vim.opt.clipboard = 'unnamed'

if vim.fn.has('win32') == 1 then
  vim.opt.shellslash = true
  vim.opt.completeslash = 'slash'
end

vim.opt.foldmethod = 'marker'

vim.opt.relativenumber = true

vim.opt.tabstop = 2
vim.opt.shiftwidth = 0
vim.opt.softtabstop = -1
vim.opt.expandtab = true

vim.opt.winborder = 'rounded'
vim.opt.pumborder = 'rounded'

vim.opt.laststatus = 3

vim.cmd.colorscheme('miniwinter')
require('mini.colors').get_colorscheme():add_transparency():apply()
-- }}}

-- {{{ autocmds
vim.api.nvim_create_autocmd('CursorMoved', {
  group = vim.api.nvim_create_augroup('User_CursorMoved', { clear = true }),
  callback = function()
    if vim.api.nvim_buf_get_option(0, 'buftype') ~= '' then
      return
    end
    vim.cmd.normal({ args = { 'zz' }, bang = true })
  end,
})
-- }}}

-- {{{ keymaps
vim.keymap.set('i', 'jj', '<Esc>')
vim.keymap.set('n', '<Esc>', '<Cmd>nohlsearch<Cr>')

vim.keymap.set('n', '<Leader>=', 'gg=G``', { desc = 'indent' })
vim.keymap.set('n', '<Leader>a', '<Cmd>quitall!<Cr>', { desc = 'quitall' })
vim.keymap.set('n', '<Leader>q', '<Cmd>quit!<Cr>', { desc = 'quit' })
vim.keymap.set('n', '<Leader>r', '<Cmd>restart<Cr>', { desc = 'restart' })
vim.keymap.set('n', '<Leader>s', '<Cmd>split<Cr>', { desc = 'split' })
vim.keymap.set('n', '<Leader>u', vim.pack.update, { desc = 'update plugins' })
vim.keymap.set('n', '<Leader>v', '<Cmd>vsplit<Cr>', { desc = 'vsplit' })
vim.keymap.set('n', '<Leader>w', '<Cmd>write<Cr>', { desc = 'write' })

function y2cb(arg)
  vim.fn.setreg('+', vim.fn.expand(arg))
end
vim.keymap.set('n', '<Leader>yh', function()
  y2cb('%:h')
end, { desc = 'directory' })
vim.keymap.set('n', '<Leader>yp', function()
  y2cb('%')
end, { desc = 'filepath' })
vim.keymap.set('n', '<Leader>yt', function()
  y2cb('%:t')
end, { desc = 'filename' })

vim.keymap.set('n', '<S-d>', vim.diagnostic.open_float, { desc = 'diagnostic' })
vim.keymap.set('n', '<S-s>', vim.lsp.buf.signature_help, { desc = 'signature help' })

vim.keymap.set('n', 'grD', vim.lsp.buf.declaration, { desc = 'vim.lsp.buf.declaration()' })
vim.keymap.set('n', 'grI', vim.lsp.buf.incoming_calls, { desc = 'vim.lsp.buf.incoming_calls()' })
vim.keymap.set('n', 'grO', vim.lsp.buf.outgoing_calls, { desc = 'vim.lsp.buf.outgoing_calls()' })
vim.keymap.set('n', 'grd', vim.lsp.buf.definition, { desc = 'vim.lsp.buf.definition()' })
-- }}}

-- {{{ lsps
vim.lsp.enable('lua_ls')
-- }}}
