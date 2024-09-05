--- Call Git command
---@param command string Git command to call
---@param options? string Options to pass to the Git command
local function CallGit(command, options)
  local git_command = 'G ' .. command
  if options ~= nil then
    git_command = git_command .. ' ' .. options
  end
  vim.api.nvim_command(git_command)
end

--- Call Git command with input
---@param command string Git command to call
---@param options? string Options to pass to the Git command
---@param input? string Input to pass to the Git command
---@param question? string Question to ask the user
local function CallGitInput(command, options, input, question)
  local git_command = 'G ' .. command
  if options ~= nil then
    git_command = git_command .. ' ' .. options
  end
  if input == nil or input == '' then
    if question ~= nil then
      input = vim.fn.input(question .. ': ')
    else
      input = vim.fn.input('Enter input for ' .. git_command .. ': ')
    end
  end
  vim.api.nvim_command(git_command .. ' ' .. input)
end

--- Set the value of a config option
---@param option string Config option to set
---@param value? string Value to set the config option to
---@param scope? string Scope of the config option (global, local)
local function SetConfig(option, value, scope)
  if scope == nil or scope == '' then
    scope = '--global'
  else
    scope = '--' .. scope
  end
  if value == nil or value == '' then
    vim.fn.input('Set ' .. scope .. ' value for ' .. option ..': ')
  end
  vim.api.nvim_command('G config ' .. scope .. ' ' .. option .. ' "' .. value .. '"')
  print('Set ' .. scope .. ' ' .. option .. ' to "' .. value .. '"')
end

--- Get the current value of a config option
---@param value? string Config option to get
---@param scope? string Scope of the config option (global, local)
local function GetConfig(value, scope)
  if scope == nil or scope == '' then
    scope = '--global'
  else
    scope = '--' .. scope
  end
  if value == nil or value == '' then
    vim.api.nvim_command('G config ' .. scope .. ' --list')
  else
    local current = vim.api.nvim_exec('G config ' .. scope .. ' ' .. value, true)
    if current == nil or current == '' then
      print('Option ' .. value .. ' not set in scope ' .. scope)
    else
      print('Current ' .. scope .. ' ' .. value .. ' is "' .. current .. '"')
    end
  end
end

---@type LazySpec
return {
  'tpope/vim-fugitive',
  keys = {
    { '<leader>gc', function() CallGitInput('checkout', nil, nil, 'Branch') end, desc = '[C]heckout'},

    -- Config
    { '<leader>g?ge', function() SetConfig('user.email') end, desc = '[E]mail' },
    { '<leader>g?gl', function() CallGit('config', 'list --global') end, desc = '[L]ist' },
    { '<leader>g?gn', function() SetConfig('user.name') end, desc = '[N]ame' },
    --{ '<leader>g?lc', '<cmd>G config<CR>', desc = '[C]ommit' },
    { '<leader>g?le', function() GetConfig('user.email', 'local') end, desc = '[E]mail' },
    { '<leader>g?ll', function() CallGit('config', 'list --local') end, desc = '[L]ist' },
    { '<leader>g?ln', function() GetConfig('user.name', 'local') end, desc = '[N]ame' },
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
    { '<leader>gi', function() CallGit('init') end, desc = '[I]nit' },
    { '<leader>gp', function() CallGit('pull') end, desc = '[P]ull' },

    -- Git List
    -- Git List Branch
    { '<leader>glba', function() CallGit('branch', '-a') end, desc = '[A]ll' },
    { '<leader>glbr', function() CallGit('branch', '-r') end, desc = '[R]emote' },
    { '<leader>glbl', function() CallGit('branch') end, desc = '[L]ocal' },
    -- Git List Config Global
    { '<leader>glcge', function() GetConfig('user.email') end, desc = '[E]mail' },
    { '<leader>glcgc', function() GetConfig() end, desc = '[C]onfig' },
    { '<leader>glcgn', function() GetConfig('user.name') end, desc = '[N]ame'},
    -- Git List Config Local
    { '<leader>glcle', function() GetConfig('user.email', 'local') end, desc = '[E]mail' },
    { '<leader>glclc', function() GetConfig(nil, 'local') end, desc = '[C]onfig' },
    { '<leader>glcln', function() GetConfig('user.name', 'local') end, desc = '[N]ame' },
    { '<leader>gs', function() CallGit('status') end, desc = '[S]tatus' },
  },
}
