Util = {}
Util.__index = Util

--- Concat table of strings
---@param strings table Table of strings
---@return string Concatenated strings
function Util:concat(strings)
  assert(type(strings) == 'table', 'Table must be a table')
  return table.concat(strings, ' ')
end

return Util