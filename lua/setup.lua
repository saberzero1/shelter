require "config.options"

require "plugins.neovide"

require("lazy").setup({
  { import = "plugins.copilot" },
  { import = "plugins.vscode" },
  --{ import = "plugins.neovide" },
  { import = "plugins.bad-practices" },
  { import = "plugins.git" },
  { import = "plugins.keymap" },
  { import = "plugins.fuzzy-finder" },
  { import = "plugins.lsp" },
  { import = "plugins.luvit" },
  { import = "plugins.lsp-config" },
  { import = "plugins.autoformat" },
  { import = "plugins.autocompletion" },
  { import = "plugins.theme" },
  { import = "plugins.comments" },
  { import = "plugins.mini" },
  { import = "plugins.treesitter" },
} --[[@as LazySpec]], {
  -- Configure any other `lazy.nvim` configuration options here
  ui = {
    -- If you are using a Nerd Font: set icons to an empty table which will use the
    -- default lazy.nvim defined Nerd Font icons, otherwise define a unicode icons table
    backdrop = 100,
    icons = vim.g.have_nerd_font and {} or {
      cmd = '⌘',
      config = '🛠',
      event = '📅',
      ft = '📂',
      init = '⚙',
      keys = '🗝',
      plugin = '🔌',
      runtime = '💻',
      require = '🌙',
      source = '📄',
      start = '🚀',
      task = '📌',
      lazy = '💤 ',
    },
  },
  performance = {
    rtp = {
      -- disable some rtp plugins, add more to your liking
      disabled_plugins = {
        "gzip",
        "netrwPlugin",
        "tarPlugin",
        "tohtml",
        "zipPlugin",
      },
    },
  },
} --[[@as LazyConfig]])

if vim.g.vscode then
  require "plugins.vscode-keymaps"
end

require "config.keymaps"
require "config.autocmds"

require "overrides"
