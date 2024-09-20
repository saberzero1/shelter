require 'pre-setup'

local plugins = require 'plugins'

local ui_settings = {
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
}

local performance_settings = {
  rtp = {
    -- disable some rtp plugins, add more to your liking
    disabled_plugins = {
      'gzip',
      'netrwPlugin',
      'tarPlugin',
      'tohtml',
      'zipPlugin',
    },
  },
}

local checker_settings = {
  enabled = false,
  notify = false,
}

local default_settings = {
  lazy = false,
  version = false, -- always use the latest git commit
}

if not vim.g.vscode then
  require 'lazy'.setup(plugins --[[@as LazySpec]], {
    -- Configure any other `lazy.nvim` configuration options here
    ui = ui_settings,
    performance = performance_settings,
    checker = checker_settings,
    default = default_settings,
  } --[[@as LazyConfig]])
else
  require 'lazy'.setup(plugins --[[@as LazySpec]], {
    -- Configure any other `lazy.nvim` configuration options here
    ui = ui_settings,
    performance = performance_settings,
    checker = checker_settings,
    default = default_settings,
  } --[[@as LazyConfig]])
end

require 'post-setup'
