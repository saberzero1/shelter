---@type LazySpec
return {
  'neovim/nvim-lspconfig',
  dependencies = {
    'WhoIsSethDaniel/mason-tool-installer.nvim',
  },
  ---@class PluginLspOpts
  opts = {
    ---@type lspconfig.options
    servers = {
      -- pyright will be automatically installed with mason and loaded with lspconfig
      pyright = {},
      ts_ls = {},
      lua_ls = {},
      nixd = {},
    },
  },
}
