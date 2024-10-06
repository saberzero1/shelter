local keylist = {
  fugitive = {},
}

keylist.fugitive = {
  ['<leader>'] = {
    ['g'] = {
      ['opts'] = { { group = '[g]it', mode = { 'n', 'v' } } },
      ['a'] = { function() git.add() end, { desc = '[a]dd' } },
      ['b'] = { function() git.branch() end, { desc = '[b]ranch' } },
      ['c'] = { function() git.checkout() end, { desc = '[c]heckout' } },
      ['d'] = {
        ['opts'] = { { group = '[d]iff', mode = { 'n', 'v' } } },
      },
      ['f'] = { function() git.fetch() end, { desc = '[f]etch' } },
      ['F'] = { function() git.fetch('all') end, { desc = '[F]etch all' } },
      ['i'] = { function() git.init() end, { desc = '[i]nit' } },
      ['I'] = { function() git.init('bare') end, { desc = '[I]nit bare' } },
      ['p'] = { function() git.pull() end, { desc = '[p]ull' } },
      ['P'] = { function() git.push() end, { desc = '[P]ush' } },
      ['l'] = {
        ['opts'] = { { group = '[l]ist', mode = { 'n', 'v' } } },
        ['b'] = {
          ['opts'] = { { group = '[b]ranch', mode = { 'n', 'v' } } },
          ['a'] = { function() git.branch('-a') end, { desc = '[a]ll' } },
          ['r'] = { function() git.branch('-r') end, { desc = '[r]emote' } },
          ['l'] = { function() git.branch() end, { desc = '[l]ocal' } },
        },
        ['c'] = {
          ['opts'] = { { group = '[c]onfig', mode = { 'n', 'v' } } },
          ['g'] = {
            ['opts'] = { { group = '[g]lobal', mode = { 'n', 'v' } } },
            ['c'] = { function() git.config.get() end, { desc = '[c]onfig' } },
            ['e'] = { function() git.config.get('user.email') end, { desc = '[e]mail' } },
            ['n'] = { function() git.config.get('user.name') end, { desc = '[n]ame' } },
          },
          ['l'] = {
            ['opts'] = { { group = '[l]ocal', mode = { 'n', 'v' } } },
            ['c'] = { function() git.config.get(nil, 'local') end, { desc = '[c]onfig' } },
            ['e'] = { function() git.config.get('user.email', 'local') end, { desc = '[e]mail' } },
            ['n'] = { function() git.config.get('user.name', 'local') end, { desc = '[n]ame' } },
          },
        },
      },
      ['s'] = { function() git.status() end, { desc = '[s]tatus' } },
      ['S'] = { function() git.stash() end, { desc = '[S]tash' } },
      ['?'] = {
        ['opts'] = { { group = '[?] Config', mode = { 'n', 'v' } } },
        ['g'] = {
          ['opts'] = { { group = '[g]lobal', mode = { 'n', 'v' } } },
          ['e'] = { function() git.config.set('user.email', nil) end, { desc = '[e]mail' } },
          ['l'] = { function() git.config.get() end, { desc = '[l]ist' } },
          ['n'] = { function() git.config.set('user.name', nil) end, { desc = '[n]ame' } },
        },
        ['l'] = {
          ['opts'] = { { group = '[l]ocal', mode = { 'n', 'v' } } },
          ['e'] = { function() git.config.set('user.email', nil, 'local') end, { desc = '[e]mail' } },
          ['l'] = { function() git.config.get(nil, 'local') end, { desc = '[l]ist' } },
          ['n'] = { function() git.config.set('user.name', nil, 'local') end, { desc = '[n]ame' } },
        },
      },
      ['/'] = { function() git.grep() end, { desc = '[/] Grep' } },
    },
  },
}

return keylist
