if vim.g.vscode then
  return {
    { import = 'plugins.mistakes'},
    --[[
    { import = 'plugins.vscode' },
    { import = 'plugins.bad-practices' },
    { import = 'plugins.git' },
    { import = 'plugins.keymap' },
    { import = 'plugins.fuzzy-finder' },
    { import = 'plugins.lsp' },
    { import = 'plugins.luvit' },
    { import = 'plugins.lsp-config' },
    { import = 'plugins.autoformat' },
    { import = 'plugins.autocompletion' },
    { import = 'plugins.treesitter' },

    { import = 'plugins.theme' },

    { import = 'plugins.comments' },
    { import = 'plugins.mini' },
    ]]--
  }
else
  return {
    --{ import = 'plugins.git' },
    --{ import = 'plugins.keymap' },
    { import = 'plugins.core' },
        
    --{ import = 'plugins.copilot' },
    --{ import = 'plugins.lsp' },
    --{ import = 'plugins.luvit' },
    --{ import = 'plugins.lsp-config' },
    --{ import = 'plugins.autoformat' },
    --{ import = 'plugins.autocompletion' },
    --{ import = 'plugins.treesitter' },
    { import = 'plugins.coding' },

    --{ import = 'plugins.fuzzy-finder' },
    --{ import = 'plugins.harpoon' },
    { import = 'plugins.navigation' },
    
    --{ import = 'plugins.theme' },
    --{ import = 'plugins.gutter' },
    --{ import = 'plugins.gutter-extensions' },
    { import = 'plugins.editor' },
    
    --{ import = 'plugins.comments' },
    --{ import = 'plugins.mini' },
    { import = 'plugins.util' },

    { import = 'plugins.skill-issues' },
  }
end

