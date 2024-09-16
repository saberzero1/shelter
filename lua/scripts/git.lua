local builtin = require 'telescope.builtin'

local git = {
  call = {},
  branch = {},
  checkout = {},
  config = {
    get = {},
    set = {},
  },
  fetch = {},
  grep = {},
  init = {},
  pull = {},
  push = {},
  status = {},
  stash = {},
}

-- Override the print function to use the notify function from nvim-notify
local notify = require 'notify'
vim.notify = notify
print = function(...)
  local print_safe_args = {}
  local _ = { ... }
  for i = 1, #_ do
    table.insert(print_safe_args, tostring(_[i]))
  end
  notify(table.concat(print_safe_args, ' '), 'info')
end
notify.setup()

--- Call Git command
---@param command string Git command to call
---@param options? string Options to pass to the Git command
---@param input? boolean Ask for input
---@param question? string Question to ask the user
---@param verbose? string Notify the user
git.call = function(command, options, input, question, verbose)
  assert(type(command) == 'string', 'Command must be a string')
  assert(command ~= '', 'Command must not be empty')
  assert(options == nil or type(options) == 'string', 'Options must be a string')
  assert(input == nil or type(input) == 'boolean', 'Input must be a boolean')
  assert((input == true) == (question ~= nil), 'Input must be true if question is provided')
  assert(question == nil or type(question) == 'string', 'Question must be a string')
  assert(verbose == nil or type(verbose) == 'boolean', 'Verbose must be a boolean')
  local verbose = verbose or true
  local git_command = 'G ' .. command
  if options ~= nil then
    git_command = git_command .. ' ' .. options
  end
  if verbose then
    print('Running git ' .. git_command:sub(3))
  end
  if input then
    if question ~= nil then
      input = vim.fn.input(question .. ': ')
    else
      input = vim.fn.input('Enter input for git ' .. git_command:sub(3) .. ': ')
    end
    vim.api.nvim_command(git_command .. ' ' .. input)
  else
    vim.api.nvim_command(git_command)
  end
  if verbose then
    print('Finished running git ' .. git_command:sub(3))
  end
end


--- Format options for Git commands
---@param options? string Options to format
---@param default? string Default options
---@return string Formatted options
local function opt(options, default)
  assert(options == nil or type(options) == 'string', 'Options must be a string')
  default = default or ''
  if options == nil or options == '' then
    return default
  else
    return '--' .. options
  end
end

--- Branch operations
---@param options? string Options to pass to the Git command
git.branch = function(options)
  assert(options == nil or type(options) == 'string', 'Options must be a string')
  if options == nil or options == '' then
    assert(builtin ~= nil, 'Telescope is not loaded')
    builtin.git_branches()
  else
    git.call('branch', options)
  end
end

--- Checkout operations
---@param options? string Options to pass to the Git command
git.checkout = function(options)
  assert(options == nil or type(options) == 'string', 'Options must be a string')
  if options == nil then
    assert(builtin ~= nil, 'Telescope is not loaded')
    builtin.git_branches()
  else
    git.call('checkout', options)
  end
end

--- Set the value of a config option
---@param option string Config option to set
---@param value? string Value to set the config option to
---@param scope? string Scope of the config option (global, local)
git.config.set = function(option, value, scope)
  scope = opt(scope, '--global')
  if value == nil or value == '' then
    vim.fn.input('Set ' .. scope:sub(3) .. ' value for ' .. option ..': ')
  end
  vim.api.nvim_command('G config ' .. scope .. ' ' .. option .. ' "' .. value .. '"')
  print('Set ' .. scope:sub(3) .. ' ' .. option .. ' to "' .. value .. '"')
end

--- Get the current value of a config option
---@param value? string Config option to get
---@param scope? string Scope of the config option (global, local)
git.config.get = function(value, scope)
  assert(value == nil or type(value) == 'string', 'Value must be a string')
  scope = opt(scope, '--global')
  if value == nil or value == '' then
    vim.api.nvim_command('G config ' .. scope .. ' --list')
  else
    local current = vim.api.nvim_exec('G config ' .. scope .. ' ' .. value, true)
    if current == nil or current == '' then
      print('Option ' .. value .. ' not set in scope ' .. scope:sub(3))
    else
      print('Current ' .. scope:sub(3) .. ' ' .. value .. ' is "' .. current .. '"')
    end
  end
end

--- Fetch operations
---@param options? string Options to pass to the Git command
git.fetch = function(options)
  assert(options == nil or type(options) == 'string', 'Options must be a string')
  git.call('fetch', opt(options))
end

--- Grep (ls-files) operations
git.grep = function()
  assert(builtin ~= nil, 'Telescope is not loaded')
  builtin.git_files()
end

--- Init operations
---@param options? string Options to pass to the Git Init command
git.init = function(options)
  assert(options == nil or type(options) == 'string', 'Options must be a string')
  git.call('init', opt(options))
end

--- Pull operations
---@param options? string Options to pass to the Git Pull command
git.pull = function(options)
  assert(options == nil or type(options) == 'string', 'Options must be a string')
  git.fetch()
  git.call('pull', opt(options))
end

--- Push operations
---@param options? string Options to pass to the Git Push command
git.push = function(options)
  assert(options == nil or type(options) == 'string', 'Options must be a string')
  git.fetch()
  git.call('push', opt(options))
end

--- Status operations
git.status = function()
  assert(builtin ~= nil, 'Telescope is not loaded')
  builtin.git_status()
end

--- Stash operations
git.stash = function()
  assert(builtin ~= nil, 'Telescope is not loaded')
  builtin.git_stash()
end

return git