map = require 'scripts.keymapper'
git = require 'scripts.git'
builtin = require 'telescope.builtin'

keylist = require 'config.keylist'

local keymap = {
  figutive = map:parse(keylist.fugitive),
  diffview = map:parse(keylist.diffview),
  telescope = map:parse(keylist.telescope),
}

return keymap
