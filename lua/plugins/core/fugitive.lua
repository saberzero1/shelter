git = require('scripts.git')

---@type LazySpec
return {
  'tpope/vim-fugitive',
  keys = {
    { '<leader>gc', function() git.call('checkout', nil, true, 'Branch') end, desc = '[C]heckout'},

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
    { '<leader>gp', function() git.call('pull') end, desc = '[P]ull' },

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
