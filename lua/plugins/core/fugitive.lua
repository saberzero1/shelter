git = require('scripts.git')
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
  keys = {
    { '<leader>gc', function() git.call('checkout', nil, true, 'Branch') end, desc = '[C]heckout' },
    --{ '<leader>ggg', function() vim.notify(vim.inspect(parsed)) end, desc = '[G]et' },

    -- Config
    { '<leader>g?ge', function() git.config.set('user.email') end, desc = '[E]mail' },
    { '<leader>g?gl', function() git.call('config', 'list --global') end, desc = '[L]ist' },
    { '<leader>g?gn', function() git.config.set('user.name') end, desc = '[N]ame' },
    --{ '<leader>g?lc', '<cmd>G config<CR>', desc = '[C]ommit' },
    { '<leader>g?le', function() git.config.set('user.email', 'local') end, desc = '[E]mail' },
    { '<leader>g?ll', function() git.call('config', 'list --local') end, desc = '[L]ist' },
    { '<leader>g?ln', function() git.config.set('user.name', 'local') end, desc = '[N]ame' },
    --{ '<leader>g?gs', '<cmd>G config<CR>', desc = '[S]ign' },
    --{ '<leader>g?ls', '<cmd>G config<CR>', desc = '[S]ign' },
    -- Git Pull/Push
    { '<leader>gpu',
    function()
      git.call('fetch')
      git.call('push')
    end,
    desc = '[U]pload/[P]ush' },
    { '<leader>gpd',
    function()
      git.call('fetch')
      git.call('pull')
    end,
    desc = '[D]ownload/[P]ull' },

    -- Git Fetch
    { '<leader>gff', '<cmd>G fetch<CR>', desc = '[F]etch' },
    { '<leader>gfu',
    function()
      git.call('remote update')
      git.call('status -uno')
    end,
    desc = '[U]pdate' },
    { '<leader>gi', function() git.call('init') end, desc = '[I]nit' },
    --{ '<leader>gp', function() git.call('pull') end, { desc = '[P]ull' } },

    -- Git List
    -- Git List Branch
    { '<leader>glba', function() git.call('branch', '-a') end, desc = '[A]ll' },
    { '<leader>glbr', function() git.call('branch', '-r') end, desc = '[R]emote' },
    { '<leader>glbl', function() git.call('branch') end, desc = '[L]ocal' },
    -- Git List Config Global
    { '<leader>glcge', function() git.config.get('user.email') end, desc = '[E]mail' },
    { '<leader>glcgc', function() git.config.get() end, desc = '[C]onfig' },
    { '<leader>glcgn', function() git.config.get('user.name') end, desc = '[N]ame'},
    -- Git List Config Local
    { '<leader>glcle', function() git.config.get('user.email', 'local') end, desc = '[E]mail' },
    { '<leader>glclc', function() git.config.get(nil, 'local') end, desc = '[C]onfig' },
    { '<leader>glcln', function() git.config.get('user.name', 'local') end, desc = '[N]ame' },
    { '<leader>gs', function() git.call('status') end, desc = '[S]tatus' },
  },
}
