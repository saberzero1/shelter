if not vim.g.vscode then
  return {}
end -- don't do anything in non-vscode instances

local enabled = {}
vim.tbl_map(function(plugin)
  enabled[plugin] = true
end, {
  -- core plugins
  'lazy.nvim',
  'Comment.nvim',
  'nvim-autopairs',
  'nvim-treesitter',
  'nvim-ts-autotag',
  'nvim-treesitter-textobjects',
  'nvim-ts-context-commentstring',
  -- more known working
  'dial.nvim',
  'flash.nvim',
  'flit.nvim',
  'leap.nvim',
  'mini.ai',
  'mini.comment',
  'mini.move',
  'mini.pairs',
  'mini.surround',
  'ts-comments.nvim',
  'vim-easy-align',
  'vim-repeat',
  'vim-sandwich',
  'yanky.nvim',
  -- feel free to open PRs to add more support!
})

local Config = require 'lazy.core.config'
-- disable plugin update checking
Config.options.checker.enabled = false
Config.options.change_detection.enabled = false
-- replace the default `cond`
Config.options.defaults.cond = function(plugin)
  return enabled[plugin.name]
end

---@type LazySpec
return {
  {
    opts = {
    },
  },
  -- disable treesitter highlighting
  { 'nvim-treesitter/nvim-treesitter', opts = { highlight = { enable = false } } },
}
