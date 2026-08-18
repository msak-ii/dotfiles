vim.pack.add({ 'https://github.com/nvim-mini/mini.nvim' })

-- Text editing
require('mini.ai').setup()
require('mini.align').setup()
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

-- General workflow
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
    { mode = { 'n' }, keys = '\\' },
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
require('mini.colors').setup()
require('mini.cursorword').setup()
-- require('mini.hipatterns').setup()
-- require('mini.hues').setup()
require('mini.icons').setup({
  style = 'ascii',
})
require('mini.indentscope').setup()
-- require('mini.map').setup()
require('mini.notify').setup()
-- require('mini.starter').setup()
-- require('mini.statusline').setup()
-- require('mini.tabline').setup()
require('mini.trailspace').setup()

-- Other
-- require('mini.doc').setup()
-- require('mini.fuzzy').setup()
-- require('mini.test').setup()
