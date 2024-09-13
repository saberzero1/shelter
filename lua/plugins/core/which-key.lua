---@type LazySpec
return { -- Useful plugin to show you pending keybinds.
  'folke/which-key.nvim',
  event = 'VimEnter', -- Sets the loading event to 'VimEnter'
  opts = {
    icons = {
      -- set icon mappings to true if you have a Nerd Font
      mappings = vim.g.have_nerd_font,
      -- If you are using a Nerd Font: set icons.keys to an empty table which will use the
      -- default whick-key.nvim defined Nerd Font icons, otherwise define a string table
      keys = vim.g.have_nerd_font and {} or {
        Up = '<Up> ',
        Down = '<Down> ',
        Left = '<Left> ',
        Right = '<Right> ',
        C = '<C-…> ',
        M = '<M-…> ',
        D = '<D-…> ',
        S = '<S-…> ',
        CR = '<CR> ',
        Esc = '<Esc> ',
        ScrollWheelDown = '<ScrollWheelDown> ',
        ScrollWheelUp = '<ScrollWheelUp> ',
        NL = '<NL> ',
        BS = '<BS> ',
        Space = '<Space> ',
        Tab = '<Tab> ',
        F1 = '<F1>',
        F2 = '<F2>',
        F3 = '<F3>',
        F4 = '<F4>',
        F5 = '<F5>',
        F6 = '<F6>',
        F7 = '<F7>',
        F8 = '<F8>',
        F9 = '<F9>',
        F10 = '<F10>',
        F11 = '<F11>',
        F12 = '<F12>',
      },
    },

    -- Document existing key chains
    spec = {
      -- Code
      { '<leader>c', group = '[c]ode', mode = { 'n', 'x' } },

      -- copilot
      { '<leader>C', group = '[C]opilot', mode = { 'i', 's' } },
      { '<leader>Cp', group = '[p]anel', mode = { 'i', 's' } },

      -- Document
      { '<leader>d', group = '[d]ocument' },

      -- Evaluate
      { '<leader>e', group = '[e]valuate' },

      -- Git
      { '<leader>g', group = '[g]it', mode = { 'n', 'v' } },
      -- Git Config
      { '<leader>g?', group = '[?] Config', mode = { 'n', 'v' } },
      -- Git Config Global
      { '<leader>g?g', group = '[g]lobal', mode = { 'n', 'v' } },
      -- Git Config Local
      { '<leader>g?l', group = '[l]ocal', mode = { 'n', 'v' } },
      -- Git Diff
      { '<leader>gd', group = '[d]iff', mode = { 'n', 'v' } },
      -- Git Fetch
      { '<leader>gf', group = '[f]etch', mode = { 'n', 'v' } },
      -- Git List
      { '<leader>gl', group = '[l]ist', mode = { 'n', 'v' } },
      -- Git List Branch
      { '<leader>glb', group = '[b]ranch', mode = { 'n', 'v' } },
      -- Git List Config
      { '<leader>glc', group = '[c]onfig', mode = { 'n', 'v' } },
      -- Git List Config Global
      { '<leader>glcg', group = '[g]lobal', mode = { 'n', 'v' } },
      -- Git List Config Local
      { '<leader>glcl', group = '[l]ocal', mode = { 'n', 'v' } },


      -- Harpoon
      { '<leader>h', group = '[h]arpoon' },

      { '<leader>r', group = '[r]ename' },
      { '<leader>s', group = '[s]earch' },
      { '<leader>w', group = '[w]orkspace' },
      { '<leader>t', group = '[t]oggle' },
    },
  },
}
