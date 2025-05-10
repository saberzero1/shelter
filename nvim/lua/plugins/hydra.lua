---@type LazySpec
return {
  'nvimtools/hydra.nvim',
  enabled = true,
  depends = {
    'folke/which-key.nvim',
    'folke/snacks.nvim',
    'folke/trouble.nvim',
    'lewis6991/gitsigns.nvim',
    'nvim-treesitter/nvim-treesitter-textobjects',
    'akinsho/bufferline.nvim',
    'folke/todo-comments.nvim',
    'gbprod/yanky.nvim',
  },
  config = function()
    -- External keymaps
    -- diagnostic
    local diagnostic_goto = function(next, severity)
      local go = next and vim.diagnostic.goto_next or vim.diagnostic.goto_prev
      severity = severity and vim.diagnostic.severity[severity] or nil
      return function()
        go { severity = severity }
      end
    end
    -- Treesitter textobjects
    local treesitter_move = require 'nvim-treesitter.textobjects.move' {
      enable = true,
    }
    -- Git Signs
    local gs = package.loaded.gitsigns
    -- Initialize the plugin
    local Hydra = require 'hydra'
    local util = require 'hydra.statusline'
    -- local Layer = require 'hydra.layer'
    Hydra.setup {
      color = 'pink',
    }
  end,
}
