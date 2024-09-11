local git = {
  branch = branch,
  config = {
    get = config_get,
    set = config_set,
  },
}

local notify = {
  call = {
    notify = {},
    closure = {},
  },
  async = require("plenary.async"),
  notify = require("notify").async,
}

--- Call Git command
---@param command string Git command to call
---@param options? string Options to pass to the Git command
---@param input? boolean Ask for input
---@param question? string Question to ask the user
---@param silent? string Notify the user
---@param async? string Notify command asynchronously
git.call = function(command, options, input, question, silent, async)
  local silent = silent or false
  local async = async or true
  local git_command = 'G ' .. command
  if options ~= nil then
    git_command = git_command .. ' ' .. options
  end
  if not(silent) then
    if async then
      local closure_options = 
      notify.call.closure({command, options, input, question, true}, 'Running "' .. command .. '"', '')
      goto early_exit
    else
      notify.call.notify('Running "' .. command .. '"', 'Git', '')
    end
  end
  if input then
    if question ~= nil then
      input = vim.fn.input(question .. ': ')
    else
      input = vim.fn.input('Enter input for ' .. git_command .. ': ')
    end
    vim.api.nvim_command(git_command .. ' ' .. input)
  else
    vim.api.nvim_command(git_command)
  end
  ::early_exit::
end

--- Show notification
---@param message string Message to show
---@param title? string Title of the notification
---@param body? string Body of the notification
---@param icon? string Icon to show
notify.call.notify = function(message, title, icon)
  local title = title or 'Git'
  --local body = body or ''
  local icon = icon or ''
  vim.notify(message, 'info', {
    title = title,
    icon = icon,
  })
end

--- Show notification asynchronously
---@param command function Function to run
---@param message string Message to show
---@param title? string Title of the notification
---@param body? string Body of the notification
---@param icon? string Icon to show
notify.call.closure = function(command, message, title, icon)
  local title = title or 'Git'
  --local body = body or ''
  local icon = icon or ''
  notify.async.run(function()
    notify.notify(message, 'info', { title = title, icon = icon })
    -- use Job instead
    -- https://github.com/rcarriga/nvim-notify/issues/176
    git.call(unpack(command))--.events.open()
    notify.notify(message .. ' complete', nil, { title = title, icon = icon })
  end)
end

--- Branch operations
---@param options string Options to pass to the Git command
---@param input? boolean Ask for input
---@param question? string Question to ask the user
local function branch(options, input, question)
  git.call('branch', options, input, question)
end

--- Set the value of a config option
---@param option string Config option to set
---@param value? string Value to set the config option to
---@param scope? string Scope of the config option (global, local)
local function config_set(option, value, scope)
  if scope == nil or scope == '' then
    scope = '--global'
  else
    scope = '--' .. scope
  end
  if value == nil or value == '' then
    vim.fn.input('Set ' .. scope:sub(3) .. ' value for ' .. option ..': ')
  end
  vim.api.nvim_command('G config ' .. scope .. ' ' .. option .. ' "' .. value .. '"')
  print('Set ' .. scope .. ' ' .. option .. ' to "' .. value .. '"')
end

--- Get the current value of a config option
---@param value? string Config option to get
---@param scope? string Scope of the config option (global, local)
local function config_get(value, scope)
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
      print('Current ' .. scope:sub(3) .. ' ' .. value .. ' is "' .. current .. '"')
    end
  end
end

return git