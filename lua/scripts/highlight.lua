--[[local function highlightGradient()
  -- Only activate when line numbers are enabled
  if not vim.wo.number then
    return
  end
  local current_line = tonumber(vim.api.nvim_win_get_cursor(0)[1])
  local line_count = tonumber(vim.api.nvim_buf_line_count(0))
  local max_lines = 4
  local max_above = math.min(current_line - 1, max_lines)
  local max_below = math.min(line_count - current_line, max_lines)
  local hl = {
    'LineNr4', 'LineNr3', 'LineNr2', 'LineNr1', 'LineNr0',
  }
  for i = 1, 5 do
    --vim.api.nvim_set_hl(0, hl[i], { fg = "#FF00FF" })
    vim.api.nvim_set_hl(0, hl[i], { fg = "#FF00FF" })
  end
end]]--

local function highlightGradient()
  if not vim.wo.number then
    return
  end
  vim.fn.sign_unplace("line_gradient")
  --local separator = " │  "
  --vim.b.statuscolumn = "%!v:lua.require('scripts.status-column'). status_bar()"
  local current_line = tonumber(vim.fn.getpos(".")[2])
  local line_count = tonumber(vim.fn.getpos("$")[2])
  local max_lines = 4
  local max_above = math.min(current_line - 1, max_lines)
  local max_below = math.min(line_count - current_line, max_lines)
  vim.fn.sign_define("line_above_below_4", { numhl = "LineNr4", texthl = "LineNr4" })
  vim.fn.sign_define("line_above_below_3", { numhl = "LineNr3", texthl = "LineNr3" })
  vim.fn.sign_define("line_above_below_2", { numhl = "LineNr2", texthl = "LineNr2" })
  vim.fn.sign_define("line_above_below_1", { numhl = "LineNr1", texthl = "LineNr1" })
  vim.fn.sign_define("line_above_below_0", { numhl = "LineNr0", texthl = "LineNr0" })
  for index = current_line - max_above, current_line + max_below do
    vim.fn.sign_place(0, "line_gradient", "line_above_below_" .. tostring(vim.fn.abs(current_line - index)), vim.fn.bufname(""), { lnum = index, priority = 100 })
  end
  --print(current_line .. " " .. line_count .. " " .. max_above .. " " .. max_below)
end

local status_bar = require('scripts.status-column')

-- Highlight the current line number and 4 above and below with gradient colors
vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
  desc = 'Highlight the current line number and 4 above and below with gradient colors',
  group = vim.api.nvim_create_augroup('kickstart-gradient-highlight', { clear = false }),
  callback = function()
    highlightGradient()
    --status_bar.setHl()
  end,
})