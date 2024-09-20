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

-- Execute a command asynchronously
-- https://github.com/nvim-lua/plenary.nvim/blob/986ad71ae930c7d96e812734540511b4ca838aa2/lua/plenary/job.lua#L6-L20
-- https://www.reddit.com/r/neovim/comments/wb600w/comment/ii4uakq/
local job = require 'plenary.job'
local job_data = {}
local exec_aync = function(command, args, on_start, on_stdout, on_exit)
  job:new({
    command = command,
    args = args,
    on_start = function()
      print(on_start)
    end,
    on_stdout = function(_, line)
      table.insert(job_data, line)
    end,
    on_exit = function()
      print(on_exit)
    end,
  }):start()
end

--[[
local job = require 'plenary.job'
-- async
local data = {}
job:new({
	command = 'ls',
	args = { '-a' },
	on_stdout = function(_, line)
		table.insert(data, line)
	end,
	on_exit = function()
		print('done')
	end,
}):start()
-- sync
local ls = job:new({ command = "ls", args = { "-a" } }):sync()
for i, _ in ipairs(ls) do
	assert(ls[i] == data[i])
end
]]--

--- Concat table of strings
---@param strings table Table of strings
---@return string Concatenated strings
local function concat(strings)
  assert(type(strings) == 'table', 'Table must be a table')
  return table.concat(strings, ' ')
end

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
  options = options or ''
  local git_command = concat({ 'Git', command, options })
  if input then
    if question ~= nil then
      input = vim.fn.input(concat({question, ': ' }))
    else
      input = vim.fn.input(concat({ 'Enter input for git', git_command:sub(5), ': ' }))
    end
    exec_aync('Git', { command, options, input }, concat({ 'Started running git', git_command:sub(5) }), function(_, line)
      print(line)
    end, concat({ 'Finished running git', git_command:sub(5) }))
  else
    exec_aync('Git', { command, options }, concat({ 'Started running git', git_command:sub(5) }), function(_, line)
      print(line)
    end, concat({ 'Finished running git', git_command:sub(5) }))
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
    value = vim.fn.input(concat({ 'Set', scope:sub(3), 'value for', option, ': ' }))
  end
  if value == nil or value == '' then
    print(concat({ 'Value', '"' .. tostring(value) .. '"', ' is not valid for', scope:sub(3), option }))
    return
  end
  exec_aync('Git', { 'config', scope, option, value }, concat({ 'Running git', scope, option, value }), function(_, line)
    print(line)
  end, concat({ 'Set', scope:sub(3), option, 'to', '"' .. value .. '"' }))
end

--- Get the current value of a config option
---@param value? string Config option to get
---@param scope? string Scope of the config option (global, local)
git.config.get = function(value, scope)
  assert(value == nil or type(value) == 'string', 'Value must be a string')
  scope = opt(scope, '--global')
  if value == nil or value == '' then
    vim.api.nvim_command(concat({ 'Git config', scope, '--list' }))
  else
    local current = vim.api.nvim_exec(concat({ 'Git config', scope, value }), true)
    if current == nil or current == '' then
      print(concat({ 'Option', value, 'not set in scope', scope:sub(3) }))
    else
      print(concat({ 'Current', scope:sub(3), value, 'is', '"' .. current .. '"' }))
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