-- [[ Basic Autocommands ]]
--  See `:help lua-guide-autocommands`
require('keymaps')
require('plugins.lazy')
require('options')
require('overrides.yank')

require('plugins.gitsigns')
require('plugins.neogit')
require('plugins.codesnap')
require('plugins.harpoon')
-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
