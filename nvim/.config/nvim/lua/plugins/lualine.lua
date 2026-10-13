vim.pack.add({ 'https://github.com/nvim-lualine/lualine.nvim' })

require('lualine').setup()

require('lualine').setup({
  options = {
    theme = function()
      local t = require('warty.integrations.lualine').get_theme(require('warty').palette)
      for _, ss in pairs(t) do
        if ss.c then
          ss.b = { fg = ss.c.fg, bg = ss.c.bg }
          ss.z = { fg = ss.c.fg, bg = ss.c.bg }
        end
      end
      return t
    end,
    component_separators = '',
    section_separators = '',
  },
  sections = {
    lualine_a = {
      {
        'mode',
        fmt = function(str)
          return str:sub(1, 1)
        end,
      },
    },
    lualine_b = { 'filename' },
    lualine_c = {
      {
        function()
          local s = vim.fn.expand('%:h')
          return s == '.' and '' or s
        end,
        color = 'Comment',
      },
    },
    lualine_x = {
      'encoding',
      {
        'fileformat',
        symbols = {
          unix = 'LF',
          dos = 'CRLF',
          mac = 'CR',
        },
      },
    },
    lualine_y = { 'location' },
    lualine_z = { 'progress' },
  },
})
