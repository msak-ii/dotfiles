vim.pack.add({ 'https://github.com/nvim-lualine/lualine.nvim' })

require('lualine').setup({
  options = {
    icons_enabled = false,
    theme = (function()
      local comment_fg = string.format('#%06x', vim.api.nvim_get_hl(0, { name = 'Comment' }).fg)
      local h = {}
      for _, x in ipairs({ 'normal', 'insert', 'visual', 'replace', 'command', 'terminal' }) do
        h[x] = {}
        for _, y in ipairs({ 'a', 'b', 'c', 'x', 'y', 'z' }) do
          h[x][y] = { bg = 'NONE', fg = 'NONE' }
          if y == 'b' then
            h[x][y].gui = 'bold'
          elseif y == 'c' then
            h[x][y].fg = comment_fg
          end
        end
      end
      return h
    end)(),
    component_separators = { left = '', right = '' },
    section_separators = { left = '', right = '' },
    globalstatus = true,
  },
  sections = {
    lualine_a = {},
    lualine_b = { 'filename' },
    lualine_c = {
      function()
        local p = vim.fn.expand('%:h')
        if p == '.' then
          p = ''
        end
        return p
      end,
    },
    lualine_x = { 'encoding', 'fileformat' },
    lualine_y = { 'progress' },
    lualine_z = { 'location' },
  },
})
