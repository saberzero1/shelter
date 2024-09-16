---@type LazySpec
return {
  'sindrets/diffview.nvim',
  event = 'VimEnter',
  config = function()
    require 'diffview'.setup()
  end,
  keys = {
    { '<leader>gdo' , function() vim.api.nvim_command('DiffviewOpen') end, desc = '[o]pen' },
    { '<leader>gdc' , function() vim.api.nvim_command('DiffviewClose') end, desc = '[c]lose' },
    { '<leader>gdf' , function() vim.api.nvim_command('DiffviewFocusFiles') end, desc = '[f]ocus' },
    { '<leader>gdh' , function() vim.api.nvim_command('DiffviewFileHistory') end, desc = '[h]istory' },
    { '<leader>gdr' , function() vim.api.nvim_command('DiffviewRefresh') end, desc = '[r]efresh' },
    { '<leader>gdt' , function() vim.api.nvim_command('DiffviewToggleFiles') end, desc = '[t]oggle' },
    --{ '<leader>gdn' , function() require('diffview').next() end, desc = '[n]ext' },
    --{ '<leader>gdp' , function() require('diffview').prev() end, desc = '[p]revious' },
  },
}