require('conform').setup({
  formatters_by_ft = {
    json = { 'biome' },
    jsonc = { 'biome' },
    lua = { 'stylua' },
    make = { 'bake' },
  },
})
