local vscode = require("vscode")

vim.keymap.set("", "<Space>", "<Nop>", opts)
vim.g.localleader = " "
vim.g.mapleader = " "

vim.keymap.set('n', '<leader>q', function()
  vscode.action 'workbench.action.closeWindow'
end)
vim.keymap.set('n', '<leader>w', function()
  vscode.action 'workbench.action.files.save'
end)

vim.keymap.set('n', '<Leader>q', function()
  vscode.action 'workbench.action.closeWindow'
end)
vim.keymap.set('n', '<Leader>w', function()
  vscode.action 'workbench.action.files.save'
end)
vim.keymap.set('n', '<Leader>n', function()
  vscode.action 'welcome.showNewFileEntries'
end)

-- splits navigation
vim.keymap.set('n', '|', function()
  vscode.action 'workbench.action.splitEditor'
end)
vim.keymap.set('n', '\\', function()
  vscode.action 'workbench.action.splitEditorDown'
end)
vim.keymap.set('n', '<C-H>', function()
  vscode.action 'workbench.action.navigateLeft'
end)
vim.keymap.set('n', '<C-J>', function()
  vscode.action 'workbench.action.navigateDown'
end)
vim.keymap.set('n', '<C-K>', function()
  vscode.action 'workbench.action.navigateUp'
end)
vim.keymap.set('n', '<C-L>', function()
  vscode.action 'workbench.action.navigateRight'
end)

-- terminal
vim.keymap.set('n', '<F7>', function()
  vscode.action 'workbench.action.terminal.toggleTerminal'
end)
vim.keymap.set('n', "<C-'>", function()
  vscode.action 'workbench.action.terminal.toggleTerminal'
end)

-- buffer management
vim.keymap.set('n', ']b', '<Cmd>Tabnext<CR>')
vim.keymap.set('n', '[b', '<Cmd>Tabprevious<CR>')
vim.keymap.set('n', '<Leader>c', '<Cmd>Tabclose<CR>')
vim.keymap.set('n', '<Leader>C', '<Cmd>Tabclose!<CR>')
vim.keymap.set('n', '<Leader>bp', '<Cmd>Tablast<CR>')

-- file explorer
vim.keymap.set('n', '<Leader>e', function()
  vscode.action 'workbench.files.action.focusFilesExplorer'
end)
vim.keymap.set('n', '<Leader>o', function()
  vscode.action 'workbench.files.action.focusFilesExplorer'
end)

-- indentation
vim.keymap.set('v', '<Tab>', function()
  vscode.action 'editor.action.indentLines'
end)
vim.keymap.set('v', '<S-Tab>', function()
  vscode.action 'editor.action.outdentLines'
end)

-- diagnostics
vim.keymap.set('n', ']d', function()
  vscode.action 'editor.action.marker.nextInFiles'
end)
vim.keymap.set('n', '[d', function()
  vscode.action 'editor.action.marker.prevInFiles'
end)

-- pickers (emulate telescope mappings)
vim.keymap.set('n', '<Leader>fc', function()
  vscode.action('workbench.action.findInFiles', { args = { query = vim.fn.expand '<cword>' } })
end)
vim.keymap.set('n', '<Leader>fC', function()
  vscode.action 'workbench.action.showCommands'
end)
vim.keymap.set('n', '<Leader>ff', function()
  vscode.action 'workbench.action.quickOpen'
end)
vim.keymap.set('n', '<Leader>fn', function()
  vscode.action 'notifications.showList'
end)
vim.keymap.set('n', '<Leader>fo', function()
  vscode.action 'workbench.action.openRecent'
end)
vim.keymap.set('n', '<Leader>ft', function()
  vscode.action 'workbench.action.selectTheme'
end)
vim.keymap.set('n', '<Leader>fw', function()
  vscode.action 'workbench.action.findInFiles'
end)

-- git client
vim.keymap.set('n', '<Leader>gg', function()
  vscode.action 'workbench.view.scm'
end)

-- LSP Mappings
vim.keymap.set('n', 'K', function()
  vscode.action 'editor.action.showHover'
end)
vim.keymap.set('n', 'gI', function()
  vscode.action 'editor.action.goToImplementation'
end)
vim.keymap.set('n', 'gd', function()
  vscode.action 'editor.action.revealDefinition'
end)
vim.keymap.set('n', 'gD', function()
  vscode.action 'editor.action.revealDeclaration'
end)
vim.keymap.set('n', 'gr', function()
  vscode.action 'editor.action.goToReferences'
end)
vim.keymap.set('n', 'gy', function()
  vscode.action 'editor.action.goToTypeDefinition'
end)
vim.keymap.set('n', '<Leader>la', function()
  vscode.action 'editor.action.quickFix'
end)
vim.keymap.set('n', '<Leader>lG', function()
  vscode.action 'workbench.action.showAllSymbols'
end)
vim.keymap.set('n', '<Leader>lR', function()
  vscode.action 'editor.action.goToReferences'
end)
vim.keymap.set('n', '<Leader>lr', function()
  vscode.action 'editor.action.rename'
end)
vim.keymap.set('n', '<Leader>ls', function()
  vscode.action 'workbench.action.gotoSymbol'
end)
vim.keymap.set('n', '<Leader>lf', function()
  vscode.action 'editor.action.formatDocument'
end)
