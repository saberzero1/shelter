git = require 'scripts.git'
--[[keymap = require('scripts.keymapper')

local list2 = keymap.list({
  ['<leader>'] = {
    ['g'] = {
      ['c'] = { function() git.call('checkout', nil, true, 'Branch') end, { desc = '[C]heckout', silent = true } },
      ['?'] = {
        ['g'] = {
          ['e'] = { function() git.config.get('user.email') end, { desc = '[E]mail' } },
        },
      },
    },
  },
})

local list = keymap.list({
  ['<leader>'] = {
    ['g'] = {
      ['c'] = { function() git.call('checkout', nil, true, 'Branch') end, { desc = '[C]heckout' } },
      ['?'] = {
        ['g'] = {
          ['e'] = { function() git.config.get('user.email') end, { desc = '[E]mail' } },
          ['l'] = { function() git.call('config', 'list --global') end, { desc = '[L]ist' } },
          ['n'] = { function() git.config.get('user.name') end, { desc = '[N]ame' } },
        },
        ['l'] = {
          ['e'] = { function() git.config.get('user.email', 'local') end, { desc = '[E]mail' } },
          ['l'] = { function() git.call('config', 'list --local') end, { desc = '[L]ist' } },
          ['n'] = { function() git.config.get('user.name', 'local') end, { desc = '[N]ame' } },
        },
        ['s'] = {
          ['e'] = { function() git.config.get('user.email', 'system') end, { desc = '[E]mail' } },
          ['l'] = { function() git.call('config', 'list --system') end, { desc = '[L]ist' } },
          ['n'] = { function() git.config.get('user.name', 'system') end, { desc = '[N]ame' } },
        },
      },
      ['p'] = {
        ['u'] = { function()
          git.call('fetch')
          git.call('push')
        end, { desc = '[U]pload/[P]ush' } },
        ['d'] = { function()
          git.call('fetch')
          git.call('pull')
        end, { desc = '[D]ownload/[P]ull' } },
      },
      ['f'] = {
        ['f'] = { function() git.call('fetch') end, { desc = '[F]etch' } },
        ['u'] = { function()
          git.call('remote update')
          git.call('status -uno')
        end, { desc = '[U]pdate' } },
      },
      ['i'] = { function() git.call('init') end, { desc = '[I]nit' } },
      ['l'] = {
        ['b'] = {
          ['a'] = { function() git.call('branch', '-a') end, { desc = '[A]ll' } },
          ['r'] = { function() git.call('branch', '-r') end, { desc = '[R]emote' } },
          ['l'] = { function() git.call('branch') end, { desc = '[L]ocal' } },
        },
        ['c'] = {
          ['g'] = {
            ['e'] = { function() git.config.get('user.email') end, { desc = '[E]mail' } },
            ['c'] = { function() git.config.get() end, { desc = '[C]onfig' } },
            ['n'] = { function() git.config.get('user.name') end, { desc = '[N]ame' } },
          },
          ['l'] = {
            ['e'] = { function() git.config.get('user.email', 'local') end,   desc = '[E]mail' },
            ['l'] = { function() git.config.get(nil, 'local') end, { desc = '[C]onfig' } },
            ['n'] = { function() git.config.get('user.name', 'local') end, { desc = '[N]ame' } },
          },
        },
      },
      ['s'] = { function() git.call('status') end, { desc = '[S]tatus' } },
    }
  }
})

local parsed = keymap.parse(list)

local parsed2 = keymap.parse(list2)]]--

---@type LazySpec
return {
  'tpope/vim-fugitive',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-telescope/telescope.nvim',
  },
  keys = {
    -- Git Branch operations
    { '<leader>gb', git.branch, desc = '[b]ranch' },
    { '<leader>gc', git.checkout, desc = '[c]heckout' },
    
    -- Git Config
    { '<leader>g?ge', function() git.config.set('user.email') end, desc = '[e]mail' },
    { '<leader>g?gl', function() git.config.get() end, desc = '[l]ist' },
    { '<leader>g?gn', function() git.config.set('user.name') end, desc = '[n]ame' },
    { '<leader>g?le', function() git.config.set('user.email', 'local') end, desc = '[e]mail' },
    { '<leader>g?ll', function() git.config.get(nil, 'local') end, desc = '[l]ist' },
    { '<leader>g?ln', function() git.config.set('user.name', 'local') end, desc = '[n]ame' },
    
    -- Git Pull/Push
    { '<leader>gP', git.push, desc = '[P]ush' },
    { '<leader>gp', git.pull, desc = '[p]ull' },

    -- Git Fetch
    { '<leader>gf', git.fetch, desc = '[f]etch' },
    { '<leader>gF', function() git.fetch('all') end, desc = '[F]etch all' },

    -- Git Init
    { '<leader>gi', git.init, desc = '[i]nit' },
    { '<leader>gI', function() git.init('bare') end, desc = '[I]nit bare' },

    -- Git List
    -- Git List Branch
    { '<leader>glba', function() git.branch('-a') end, desc = '[a]ll' },
    { '<leader>glbr', function() git.branch('-r') end, desc = '[r]emote' },
    { '<leader>glbl', function() git.branch('') end, desc = '[l]ocal' },
    -- Git List Config Global
    { '<leader>glcge', function() git.config.get('user.email') end, desc = '[e]mail' },
    { '<leader>glcgc', function() git.config.get() end, desc = '[c]onfig' },
    { '<leader>glcgn', function() git.config.get('user.name') end, desc = '[n]ame'},
    -- Git List Config Local
    { '<leader>glcle', function() git.config.get('user.email', 'local') end, desc = '[e]mail' },
    { '<leader>glclc', function() git.config.get(nil, 'local') end, desc = '[c]onfig' },
    { '<leader>glcln', function() git.config.get('user.name', 'local') end, desc = '[n]ame' },

    -- Git Status
    { '<leader>gs', git.status, desc = '[s]tatus' },
    
    -- Git Stash
    { '<leader>gS', git.stash, desc = '[S]tash' },

    -- Grep (ls-files)
    { '<leader>g/', git.grep, desc = '[/] Grep' },
  },
}
