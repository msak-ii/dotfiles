vim.pack.add({ 'https://github.com/ibhagwan/fzf-lua' })

require('fzf-lua').setup()

local fzf_lua = require('fzf-lua')
fzf_lua.setup({
  defaults = {
    formatter = 'path.filename_first',
  },
  winopts = {
    on_create = function()
      vim.keymap.set('t', '<C-r>', [['<C-\><C-N>"'.nr2char(getchar()).'pi']], { expr = true, buffer = true })
    end,
  },
  files = {
    fd_opts = [[--path-separator "/" ]] .. fzf_lua.config.defaults.files.fd_opts,
    cwd_prompt = false,
    actions = {
      ['enter'] = fzf_lua.actions.file_edit,
    },
  },
  git = {
    status = {
      actions = {
        ['enter'] = fzf_lua.actions.file_edit,
      },
    },
  },
  grep = {
    rg_opts = [[--path-separator "/" ]] .. fzf_lua.config.defaults.grep.rg_opts,
    hidden = true,
  },
})

fzf_lua.register_ui_select()
