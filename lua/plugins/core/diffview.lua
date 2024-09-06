---@type LazySpec
return {
  'sindrets/diffview.nvim',
  event = 'VimEnter',
  config = function()
    require('diffview').setup()
  end,
  keys = {
    { '<leader>gdo' , function() vim.api.nvim_command('DiffviewOpen') end, desc = '[O]pen' },
    { '<leader>gdc' , function() vim.api.nvim_command('DiffviewClose') end, desc = '[C]lose' },
    { '<leader>gdf' , function() vim.api.nvim_command('DiffviewFocusFiles') end, desc = '[F]ocus' },
    { '<leader>gdh' , function() vim.api.nvim_command('DiffviewFileHistory') end, desc = '[H]istory' },
    { '<leader>gdr' , function() vim.api.nvim_command('DiffviewRefresh') end, desc = '[R]efresh' },
    { '<leader>gdt' , function() vim.api.nvim_command('DiffviewToggleFiles') end, desc = '[T]oggle' },
    --{ '<leader>gdn' , function() require('diffview').next() end, desc = '[N]ext' },
    --{ '<leader>gdp' , function() require('diffview').prev() end, desc = '[P]revious' },
  },
}