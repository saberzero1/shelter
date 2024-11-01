local gradient = require 'scripts.highlight'

-- Highlight the current line number and 4 above and below with gradient colors
vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI' }, {
  desc = 'Highlight the current line number and 4 above and below with gradient colors',
  group = vim.api.nvim_create_augroup('kickstart-gradient-highlight', { clear = false }),
  callback = function()
    gradient:highlight()
  end,
})
