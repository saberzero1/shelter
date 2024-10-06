util = require 'scripts.util'
git = require 'scripts.git'

keylist = require 'config.keylist'

local keymap = {
  figutive = {},
}

keymap.fugitive = util:parse_keymap(keylist.fugitive)

return keymap
