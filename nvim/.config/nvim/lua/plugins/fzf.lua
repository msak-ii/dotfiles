vim.pack.add({ 'https://github.com/ibhagwan/fzf-lua' })

require('fzf-lua').setup({
  winopts = {
    preview = {
      hidden = true,
    },
    on_create = function()
      vim.keymap.set('t', '<C-r>', [['<C-\><C-N>"'.nr2char(getchar()).'pi']], { expr = true, buffer = true })
    end,
  },
  defaults = {
    formatter = 'path.filename_first',
  },
  files = {
    fd_opts = [[--type file]],
    cwd_prompt = false,
    actions = {
      ['enter'] = require('fzf-lua.actions').file_edit,
    },
  },
  git = {
    status = {
      actions = {
        ['enter'] = require('fzf-lua.actions').file_edit,
      },
    },
  },
  lsp = {
    symbols = {
      symbol_style = 3,
    },
  },
})
