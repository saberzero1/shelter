if vim.g.neovide then
  return {
    { import = 'plugins.integration.neovide' },
  }
else
  return {}
end