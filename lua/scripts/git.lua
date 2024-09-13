local builtin = require('telescope.builtin')

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
    notify(table.concat(print_safe_args, ' '), "info")
end
notify.setup()

--- Call Git command
---@param command string Git command to call
---@param options? string Options to pass to the Git command
---@param input? boolean Ask for input
---@param question? string Question to ask the user
---@param verbose? string Notify the user
git.call = function(command, options, input, question, verbose)
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
  if options == nil then
    builtin.git_branches()
  else
    git.call('branch', options)
  end
end

--- Checkout operations
---@param options? string Options to pass to the Git command
git.checkout = function(options)
  if options == nil then
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
  git.call('fetch', opt(options))
end

--- Grep (ls-files) operations
git.grep = function()
  builtin.git_files()
end

--- Init operations
---@param options? string Options to pass to the Git Init command
git.init = function(options)
  git.call('init', opt(options))
end

--- Pull operations
---@param options? string Options to pass to the Git Pull command
git.pull = function(options)
  git.fetch()
  git.call('pull', opt(options))
end

--- Push operations
---@param options? string Options to pass to the Git Push command
git.push = function(options)
  git.fetch()
  git.call('push', opt(options))
end

--- Status operations
git.status = function()
  builtin.git_status()
end

--- Stash operations
git.stash = function()
  builtin.git_stash()
end

return git