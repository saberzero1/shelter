if not vim.g.vscode then
  return {
    { import = 'plugins.copilot' },
    { import = 'plugins.bad-practices' },
    { import = 'plugins.git' },
    { import = 'plugins.keymap' },
    { import = 'plugins.fuzzy-finder' },
    { import = 'plugins.lsp' },
    { import = 'plugins.luvit' },
    { import = 'plugins.lsp-config' },
    { import = 'plugins.autoformat' },
    { import = 'plugins.autocompletion' },
    { import = 'plugins.theme' },
    { import = 'plugins.comments' },
    { import = 'plugins.mini' },
    { import = 'plugins.treesitter' },
    { import = 'plugins.harpoon' },
    { import = 'plugins.gutter' },
    { import = 'plugins.gutter-extensions' },
  }
else
  return {
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
    { import = 'plugins.theme' },
    { import = 'plugins.comments' },
    { import = 'plugins.mini' },
    { import = 'plugins.treesitter' },
  }
end