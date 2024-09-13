-- Can run repl in a floating window
-- https://github.com/pappasam/nvim-repl/blob/main/images/nvim-repl-demo.gif
--
-- TODO: Implement magma.nvim
-- https://github.com/dccsillag/magma-nvim

---@type LazySpec
return {
  'pappasam/nvim-repl',
  init = function()
    vim.g['repl_filetype_commands'] = {
      javascript = 'node',
      python = 'ipython --no-autoindent'
    }
  end,
  keys = {
    { '<leader>et', function() vim.api.nvim_command('ReplToggle') end, desc = '[t]oggle REPL', noremap = true, silent = true },
    { '<leader>ec', function() vim.api.nvim_command('ReplRunCell') end, desc = 'Run [c]ell' },
    { '<leader>el', function() vim.api.nvim_command('ReplSendLine') end, desc = 'Run [l]ine' },
    { '<leader>es', function() vim.api.nvim_command('ReplSendVisual') end, desc = 'Run [s]election', mode = { 'n', 'v' } },
    { '<leader>ev', function() vim.api.nvim_command('ReplSendVisual') end, desc = 'Run [v]isual', mode = { 'n', 'v' } },
    { '<leader>eo', function() vim.api.nvim_command('ReplOpen') end, desc = '[o]pen REPL' },
    { '<leader>eq', function() vim.api.nvim_command('ReplClose') end, desc = '[q]uit REPL' },
  },
}