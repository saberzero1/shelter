---@type LazySpec
return {
  'nvimtools/hydra.nvim',
  depends = {
    'folke/which-key.nvim',
  },
  config = function()
    local enable = false

    if not enable then
      return
    end
    -- Initialize the plugin
    local Hydra = require 'hydra'
    local util = require 'hydra.statusline'
    local wk = require 'which-key'
    -- local Layer = require 'hydra.layer'
    Hydra.setup {
      color = 'red',
    }

    -- Set up layers
    local m = { 'n', 'x' } -- modes
    -- Set up heads
    Hydra {
      name = 'Hydra Jumper',
      mode = m,
      hint = [[ Jumper Hydra ]],
      body = '[',
      config = {
        hint = {
          position = 'top',
        },
        invoke_on_body = true,
      },
      heads = {
        { '[', '[[', { private = true, desc = 'Prev Reference' } },
        { '{', '[{', { private = true, desc = 'Previous {' } },
        { '(', '[(', { private = true, desc = 'Previous (' } },
        { '<', '[<', { private = true, desc = 'Previous <' } },
        { ']', '<C-o>', { private = true, exit = true } },
        { '}', '<C-o>', { private = true, exit = true } },
        { ')', '<C-o>', { private = true, exit = true } },
        { '>', '<C-o>', { private = true, exit = true } },
      },
    }
    Hydra {
      name = 'Hydra Jumper',
      mode = m,
      hint = [[ Jumper Hydra ]],
      body = ']',
      config = {
        hint = {
          position = 'top',
        },
        invoke_on_body = true,
      },
      heads = {
        { ']', ']]', { private = true, desc = 'Next Reference' } },
        { '}', ']}', { private = true, desc = 'Next {' } },
        { ')', '])', { private = true, desc = 'Next (' } },
        { '>', ']>', { private = true, desc = 'Next <' } },
        { '[', '<C-o>', { private = true, exit = true } },
        { '{', '<C-o>', { private = true, exit = true } },
        { '(', '<C-o>', { private = true, exit = true } },
        { '<', '<C-o>', { private = true, exit = true } },
      },
    }
  end,
}
