local git = {}

git.config = {}

--- Call Git command
---@param command string Git command to call
---@param options? string Options to pass to the Git command
---@param input? boolean Ask for input
---@param question? string Question to ask the user
git.call = function(command, options, input, question)
  local git_command = 'G ' .. command
  if options ~= nil then
    git_command = git_command .. ' ' .. options
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
end

--- Set the value of a config option
---@param option string Config option to set
---@param value? string Value to set the config option to
---@param scope? string Scope of the config option (global, local)
git.config.set = function(option, value, scope)
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
git.config.get = function(value, scope)
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