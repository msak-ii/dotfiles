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
    fd_opts = (vim.fn.has('win32') == 1) and [[--type file --path-separator "/"]] or [[--type file]],
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
  grep = {
    rg_opts = (vim.fn.has('win32') == 1) and [[--path-separator "/"]] or '',
  },
  lsp = {
    symbols = {
      symbol_style = 3,
    },
  },
})
