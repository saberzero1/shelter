local assert = require 'scripts.assertions'

Util = {}
Util.__index = Util

--- Concat table of strings
---@param strings table Table of strings
---@return string Concatenated strings
function Util:concat(strings)
  assert:is_table(strings)
  return table.concat(strings, ' ')
end

--- Flatten keymap
---@param prefix prefix so far
---@param keymap nvim keyman to flatten
---@param result? resulting keymap
---@return table Flattened keymap
function Util:flatten_keymap(prefix, keymap, result)
  result = result or {}
  local wk = require("which-key")

  for key, value in pairs(keymap) do
    local new_prefix = prefix .. key
    if key == 'opts' then
      opts = value[1] or {}
      table.insert(result, { 'opts', prefix, opts })
    elseif type(value[1]) == "function" then
      -- Add the flattened keymap entry to the result
      opts = value[2] or {}
      table.insert(result, { new_prefix, value[1], opts })
    else
      -- Recursively process nested keymaps
      Util:flatten_keymap(new_prefix, value, result)
    end
  end

  return result
end

--- Build lazy.nvim keymap from flattened keymap
---@param flattened_keymap Flattened keymap to build
---@return table Built keymap
function Util:build_keymap(flattened_keymap)
  local result = {}
  for _, entry in ipairs(flattened_keymap) do
    if entry[1] == 'opts' then
      opts = entry[3]
      table.insert(result, { entry[2], group = opts.group or nil, mode = opts.mode or 'n' } )
    else
      opts = entry[3] or {}
      table.insert(result, {entry[1], entry[2], desc = opts.desc or '' })
    end
  end
  return result
end

--- Parse keymaps
---@param keymap keymap to parse
---@return table Parsed keymap
function Util:parse_keymap(keymap)
  --assert:not_empty(keymap)
  local wk = require("which-key")
  local flattened = Util:flatten_keymap("", keymap)
  assert:is_table(flattened)
  result = Util:build_keymap(flattened)
  wk.add(result)
  return {}
end

return Util
