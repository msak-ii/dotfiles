vim.lsp.config('tinymist', {
  settings = {
    exportPdf = 'onSave',
  },
})

vim.lsp.enable({
  'lua_ls',
  'tinymist',
})
