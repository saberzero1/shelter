-- Gradient colors for line numbers
local function highlightGradient()
  if not vim.wo.number then
    return
  end
  vim.fn.sign_unplace("line_gradient")
  local current_line = tonumber(vim.fn.getpos(".")[2])
  local line_count = tonumber(vim.fn.getpos("$")[2])
  local max_lines = 4
  local max_above = math.min(current_line - 1, max_lines)
  local max_below = math.min(line_count - current_line, max_lines)
  for index = 0, max_lines do
    vim.fn.sign_define("line_above_below_" .. tostring(index), { numhl = "LineNr" .. tostring(index), texthl = "LineNr" .. tostring(index) })
  end
  for index = current_line - max_above, current_line + max_below do
    vim.fn.sign_place(0, "line_gradient", "line_above_below_" .. tostring(vim.fn.abs(current_line - index)), vim.fn.bufname(""), { lnum = index, priority = 100 })
  end
end

--local status_bar = require('scripts.status-column')

-- Highlight the current line number and 4 above and below with gradient colors
vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
  desc = 'Highlight the current line number and 4 above and below with gradient colors',
  group = vim.api.nvim_create_augroup('kickstart-gradient-highlight', { clear = false }),
  callback = function()
    highlightGradient()
  end,
})