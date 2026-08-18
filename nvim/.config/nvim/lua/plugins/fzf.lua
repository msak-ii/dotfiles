vim.pack.add({ 'https://github.com/ibhagwan/fzf-lua' })

local fd_opts = require('fzf-lua').config.defaults.files.fd_opts
local rg_opts = require('fzf-lua').config.defaults.grep.rg_opts
if vim.fn.has('win32') == 1 then
  fd_opts = [[--type file --path-separator '/' ]] .. fd_opts
  rg_opts = [[--path-separator '/' ]] .. rg_opts
end

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
    fd_opts = fd_opts,
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
    rg_opts = rg_opts,
    hidden = true,
  },
  lsp = {
    symbols = {
      symbol_style = 3,
    },
  },
})
