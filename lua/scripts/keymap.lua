map = require 'scripts.keymapper'
git = require 'scripts.git'
builtin = require 'telescope.builtin'

keylist = require 'config.keylist'

local keymap = {
  diffview = map:parse(keylist.diffview),
  figutive = map:parse(keylist.fugitive),
  spectre = map:parse(keylist.spectre),
  telescope = map:parse(keylist.telescope),
}

return keymap
