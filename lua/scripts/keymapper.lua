local keymapper = {}

--[[
map a dictionary of keys to their combinations for and arbitrary number of levels
for example:
keymapper.map({
  ['<leader>'] = {
    ['g'] = {
      ['?'] = {
        ['l'] = {
          ['e'] = { function() git.config.get('user.email', 'local') end, { desc = '[E]mail' } },
          ['l'] = { function() git.call('config', 'list --local') end, { desc = '[L]ist' } },
          ['n'] = { function() git.config.get('user.name', 'local') end, { desc = '[N]ame' } },
      },
      ['i'] = function() git.call('init') end,
      ['p'] = function() git.call('pull') end,
    },
    ['p'] = function() harpoon:list():prev() end,
    ['n'] = function() harpoon:list():next() end,
  },
  ['<M-up>'] = { 'ddkP', { desc = 'Move line UP', mode = {'n', 'i', 'v'} } },
  ['<M-down>'] = { 'ddp', { desc = 'Move line DOWN', mode = {'n', 'i', 'v'} } },
})
maps to
vim.api.nvim_set_keymap('n', '<leader>g?le', function() git.config.get('user.email', 'local') end, { desc = '[E]mail' })
vim.api.nvim_set_keymap('n', '<leader>g?ll', function() git.call('config', 'list --local') end, { desc = '[L]ist' })
vim.api.nvim_set_keymap('n', '<leader>g?ln', function() git.config.get('user.name', 'local') end, { desc = '[N]ame' })
vim.api.nvim_set_keymap('n', '<leader>gi', function() git.call('init') end)
vim.api.nvim_set_keymap('n', '<leader>gp', function() git.call('pull') end)
vim.api.nvim_set_keymap('n', '<leader>p', function() harpoon:list():prev() end)
vim.api.nvim_set_keymap('n', '<leader>n', function() harpoon:list():next() end)
vim.api.nvim_set_keymap({'n', 'i', 'v'}, '<M-up>', 'ddkP', { desc = 'Move line UP' })
vim.api.nvim_set_keymap({'n', 'i', 'v'}, '<M-down>', 'ddp', { desc = 'Move line DOWN' })

meanwhile to get a list
keymapper.list({
  ['<leader>'] = {
    ['g'] = {
      ['?'] = {
        ['l'] = {
          ['e'] = { function() git.config.get('user.email', 'local') end, { desc = '[E]mail' } },
          ['l'] = { function() git.call('config', 'list --local') end, { desc = '[L]ist' } },
          ['n'] = { function() git.config.get('user.name', 'local') end, { desc = '[N]ame' } },
      },
      ['i'] = function() git.call('init') end,
      ['p'] = function() git.call('pull') end,
    },
    ['p'] = function() harpoon:list():prev() end,
    ['n'] = function() harpoon:list():next() end,
  },
  ['<M-up>'] = { 'ddkP', { desc = 'Move line UP', mode = {'n', 'i', 'v'} } },
  ['<M-down>'] = { 'ddp', { desc = 'Move line DOWN', mode = {'n', 'i', 'v'} } },
})
maps to
{
  { 'n', '<leader>g?ge', function() git.config.set('user.email') end, desc = '[E]mail' },
  { 'n', '<leader>g?gl', function() git.call('config', 'list --global') end, desc = '[L]ist' },
  { 'n', '<leader>g?gn', function() git.config.set('user.name') end, desc = '[N]ame' },
  { 'n', '<leader>gi', function() git.call('init') end, desc = '[I]nit' },
  { 'n', '<leader>gp', function() git.call('pull') end, desc = '[P]ull' },
  { 'n', '<leader>p', function() harpoon:list():prev() end },
  { 'n', '<leader>n', function() harpoon:list():next() end },
  { {'n', 'i', 'v'}, '<M-up>', 'ddkP', { desc = 'Move line UP' } },
  { {'n', 'i', 'v'}, '<M-down>', 'ddp', { desc = 'Move line DOWN' } },
}
  by concatenating the keys as a string and the value as a table
]]--

--- Map a dictionary of keys to their combinations
--- @param keys table The keys to map
keymapper.map = function(keys)
  for key, value in pairs(keys) do
    if type(value) == 'table' then
      keymapper.map(value)
    else
      local opts = value[2] or {}
      local mode = opts.mode or 'n'
      keymapper.set(key, value[1], opts, mode)
    end
  end
end

--- List a dictionary of keys to their combinations
--- @param keys table The keys to list
--- @param append? table The list to append to
keymapper.list = function(keys, append)
  append = append or ''
  local list = {}
  for key, value in pairs(keys) do
    if type(value) == 'table' then
      local append_value = ''
      if type(key) == 'string' then append_value = append .. key else append_value = append end
      local sub_list = keymapper.list(value, append_value)
      for _, sub_value in ipairs(sub_list) do
        table.insert(list, sub_value)
      end
    else
      --local opts = value[2] or {}
      --local mode = opts.mode or 'n'
      --table.insert(list, { append, key, value })
      if type(key) == 'string' then
        table.insert(list, { append, key, value })
      else
        table.insert(list, { append, value })
      end
      --table.insert(list, { append, key, value })
    end
  end
  return list
end

--- Parse a list of keymaps
--- @param list table The list of keymaps to parse
keymapper.parse = function(list)
  local key_action = {}
  local pivot = {
    desc = '',
    silent = true,
    noremap = true,
  }
  local result = {}
  local current = ''
  for _, value in ipairs(list) do
    local key = tostring(value[1])
    if current == '' then current = key end
    if current ~= key then
      --vim.list_extend(parsed, value, 2)
      vim.list_extend(key_action, { vim.deepcopy(pivot) })
      vim.list_extend(result, { vim.deepcopy(key_action) })
      key_action = {}
      pivot = {
        desc = '',
        silent = true,
        noremap = true,
      }
      current = key
    end
    local action = value[2]
    local opts = value[3] or {}
    if action == 'desc' then
      pivot.desc = opts
    elseif action == 'silent' then
      pivot.silent = opts
    elseif action == 'noremap' then
      pivot.noremap = opts
    else
        vim.list_extend(key_action, { vim.deepcopy(value) })
      
    end
  end
  return result
  --return parsed
end

--- Map a key to an action
--- @param key string The key to map
--- @param action string The action to perform
--- @param opts? table Optional parameters
--- @param mode? string The mode to map the key in
--- @param desc? string The description of the keymap
keymapper.set = function(key, action, opts, mode)
  mode = mode or 'n'
  opts = opts or {}
  vim.api.nvim_set_keymap(mode, key, action, opts)
end

return keymapper