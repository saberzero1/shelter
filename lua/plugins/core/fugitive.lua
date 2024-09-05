---@type LazySpec
return {
  'tpope/vim-fugitive',
  keys = {
    -- Branch
    { '<leader>glba', '<cmd>G branch -a<CR>', desc = '[A]ll' },
    { '<leader>glbr', '<cmd>G branch -r<CR>', desc = '[R]emote' },
    { '<leader>glbl', '<cmd>G branch<CR>', desc = '[L]ocal' },

    { '<leader>gc',
    function()
      local user_input = vim.fn.input('Branch: ')
      vim.api.nvim_command('G checkout ' .. user_input)
    end,
    desc = '[C]heckout'},

    -- Config
    { '<leader>g?ge',
    function()
      local user_input = vim.fn.input('Set global Email (leave empty for get): ')
      if user_input == '' then
        local current = vim.api.nvim_exec('G config --global user.email', true)
        if current == nil or current == '' then
          current = 'Global Email not set'
        else
          print('Current global user.email is "' .. current .. '"')
        end
      else
        vim.api.nvim_command('G config --global user.email "' .. user_input .. '"')
        print('Set global user.email to "' .. user_input .. '"')
      end
    end,
    desc = '[E]mail' },
    { '<leader>g?gl', '<cmd>G config list --global<CR>', desc = '[L]ist' },
    { '<leader>g?gn',
    function()
      local user_input = vim.fn.input('Set global Name (leave empty for get): ')
      if user_input == '' then
        local current = vim.api.nvim_exec('G config --global user.name', true)
        if current == nil or current == '' then
          current = 'Global Name not set'
        else
          print('Current global user.name is "' .. current .. '"')
        end
      else
        vim.api.nvim_command('G config --global user.name "' .. user_input .. '"')
        print('Set global user.name to "' .. user_input .. '"')
      end
    end,
    desc = '[N]ame' },
    --{ '<leader>g?lc', '<cmd>G config<CR>', desc = '[C]ommit' },
    { '<leader>g?le',
    function()
      local user_input = vim.fn.input('Set local Email (leave empty for get): ')
      if user_input == '' then
        local current = vim.api.nvim_exec('G config --local user.email', true)
        if current == nil or current == '' then
          current = 'Local Email not set'
        else
          print('Current local user.email is "' .. current .. '"')
        end
      else
        vim.api.nvim_command('G config --local user.email "' .. user_input .. '"')
        print('Set local user.email to "' .. user_input .. '"')
      end
    end,
    desc = '[E]mail' },
    { '<leader>g?ll', '<cmd>G config list --local<CR>', desc = '[L]ist' },
    { '<leader>g?ln',
    function()
      local user_input = vim.fn.input('Set local Name (leave empty for get): ')
      if user_input == '' then
        local current = vim.api.nvim_exec('G config --local user.name', true)
        if current == nil or current == '' then
          current = 'Local Name not set'
        else
          print('Current local user.name is "' .. current .. '"')
        end
      else
        vim.api.nvim_command('G config --local user.name "' .. user_input .. '"')
        print('Set local user.name to "' .. user_input .. '"')
      end
    end,
    desc = '[N]ame' },
    --{ '<leader>g?gs', '<cmd>G config<CR>', desc = '[S]ign' },
    --{ '<leader>g?ls', '<cmd>G config<CR>', desc = '[S]ign' },
    -- Git Pull/Push
    { '<leader>gpu',
    function()
      vim.api.nvim_command('G fetch')
      vim.api.nvim_command('G push')
    end,
    desc = '[U]pload/[P]ush' },
    { '<leader>gpd',
    function()
      vim.api.nvim_command('G fetch')
      vim.api.nvim_command('G pull')
    end,
    desc = '[D]ownload/[P]ull' },

    -- Git Fetch
    { '<leader>gff', '<cmd>G fetch<CR>', desc = '[F]etch' },
    { '<leader>gfu',
    function()
      vim.api.nvim_command('G remote update')
      vim.api.nvim_command('G status -uno')
    end,
    desc = '[U]pdate' },
    { '<leader>gi', '<cmd>G init<CR>', desc = '[I]nit' },
    { '<leader>gp', '<cmd>G pull<CR>', desc = '[P]ull' },

    { '<leader>gs', '<cmd>G status<CR>', desc = '[S]tatus' },
  },
}
