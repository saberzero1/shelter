map = require 'scripts.keymapper'
git = require 'scripts.git'

keylist = require 'config.keylist'

local keymap = {
  figutive = map:parse(keylist.fugitive),
  diffview = map:parse(keylist.diffview),
}

return keymap
