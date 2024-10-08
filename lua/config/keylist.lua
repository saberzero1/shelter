local keylist = {}

keylist.fugitive = {
  ['<leader>'] = {
    ['g'] = {
      ['opts'] = { { group = '[g]it', mode = { 'n', 'v' } } },
      ['a'] = { function() Git:add() end, { desc = '[a]dd' } },
      ['b'] = { function() Git:branch() end, { desc = '[b]ranch' } },
      ['c'] = { function() Git:checkout() end, { desc = '[c]heckout' } },
      ['f'] = { function() Git:fetch() end, { desc = '[f]etch' } },
      ['F'] = { function() Git:fetch('all') end, { desc = '[F]etch all' } },
      ['i'] = { function() Git:init() end, { desc = '[i]nit' } },
      ['I'] = { function() Git:init('bare') end, { desc = '[I]nit bare' } },
      ['p'] = { function() Git:pull() end, { desc = '[p]ull' } },
      ['P'] = { function() Git:push() end, { desc = '[P]ush' } },
      ['l'] = {
        ['opts'] = { { group = '[l]ist', mode = { 'n', 'v' } } },
        ['b'] = {
          ['opts'] = { { group = '[b]ranch', mode = { 'n', 'v' } } },
          ['a'] = { function() Git:branch('-a') end, { desc = '[a]ll' } },
          ['r'] = { function() Git:branch('-r') end, { desc = '[r]emote' } },
          ['l'] = { function() Git:branch() end, { desc = '[l]ocal' } },
        },
        ['c'] = {
          ['opts'] = { { group = '[c]onfig', mode = { 'n', 'v' } } },
          ['g'] = {
            ['opts'] = { { group = '[g]lobal', mode = { 'n', 'v' } } },
            ['c'] = { function() Git:config_get() end, { desc = '[c]onfig' } },
            ['e'] = { function() Git:config_get('user.email') end, { desc = '[e]mail' } },
            ['n'] = { function() Git:config_get('user.name') end, { desc = '[n]ame' } },
          },
          ['l'] = {
            ['opts'] = { { group = '[l]ocal', mode = { 'n', 'v' } } },
            ['c'] = { function() Git:config_get(nil, 'local') end, { desc = '[c]onfig' } },
            ['e'] = { function() Git:config_get('user.email', 'local') end, { desc = '[e]mail' } },
            ['n'] = { function() Git:config_get('user.name', 'local') end, { desc = '[n]ame' } },
          },
        },
      },
      ['s'] = { function() Git:status() end, { desc = '[s]tatus' } },
      ['S'] = { function() Git:stash() end, { desc = '[S]tash' } },
      ['?'] = {
        ['opts'] = { { group = '[?] Config', mode = { 'n', 'v' } } },
        ['g'] = {
          ['opts'] = { { group = '[g]lobal', mode = { 'n', 'v' } } },
          ['e'] = { function() Git:config_set('user.email', nil) end, { desc = '[e]mail' } },
          ['l'] = { function() Git:config_get() end, { desc = '[l]ist' } },
          ['n'] = { function() Git:config_set('user.name', nil) end, { desc = '[n]ame' } },
        },
        ['l'] = {
          ['opts'] = { { group = '[l]ocal', mode = { 'n', 'v' } } },
          ['e'] = { function() Git:config_set('user.email', nil, 'local') end, { desc = '[e]mail' } },
          ['l'] = { function() Git:config_get(nil, 'local') end, { desc = '[l]ist' } },
          ['n'] = { function() Git:config_set('user.name', nil, 'local') end, { desc = '[n]ame' } },
        },
      },
      ['/'] = { function() Git:grep() end, { desc = '[/] Grep' } },
    },
  },
}

keylist.diffview = {
  ['<leader>'] = {
    ['g'] = {
      ['d'] = {
        ['opts'] = { { group = '[d]iff', mode = { 'n', 'v' } } },
        ['c'] = { function() vim.api.nvim_command('DiffviewClose') end, { desc = '[c]lose' } },
        ['f'] = { function() vim.api.nvim_command('DiffviewFocusFiles') end, { desc = '[f]ocus' } },
        ['h'] = { function() vim.api.nvim_command('DiffviewFileHistory') end, { desc = '[h]istory' } },
        ['n'] = { function() require('diffview').next() end, { desc = '[n]ext' } },
        ['o'] = { function() vim.api.nvim_command('DiffviewOpen') end, { desc = '[o]pen' } },
        ['p'] = { function() require('diffview').prev() end, { desc = '[p]revious' } },
        ['r'] = { function() vim.api.nvim_command('DiffviewRefresh') end, { desc = '[r]efresh' } },
        ['t'] = { function() vim.api.nvim_command('DiffviewToggleFiles') end, { desc = '[t]oggle' } },
      },
    }
  }
}

return keylist
