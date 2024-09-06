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
      { '<leader>c', group = '[C]ode', mode = { 'n', 'x' } },
      { '<leader>d', group = '[D]ocument' },

      -- Git
      { '<leader>g', group = '[G]it', mode = { 'n', 'v' } },
      -- Git Config
      { '<leader>g?', group = '[?] Config', mode = { 'n', 'v' } },
      -- Git Config Global
      { '<leader>g?g', group = '[G]lobal', mode = { 'n', 'v' } },
      -- Git Config Local
      { '<leader>g?l', group = '[L]ocal', mode = { 'n', 'v' } },
      -- Git Diff
      { '<leader>gd', group = '[D]iff', mode = { 'n', 'v' } },
      -- Git Fetch
      { '<leader>gf', group = '[F]etch', mode = { 'n', 'v' } },
      -- Git Pull/Push
      { '<leader>gp', group = '[P]ull/[P]ush', mode = { 'n', 'v' } },
      -- Git List
      { '<leader>gl', group = '[L]ist', mode = { 'n', 'v' } },
      -- Git List Branch
      { '<leader>glb', group = '[B]ranch', mode = { 'n', 'v' } },
      -- Git List Config
      { '<leader>glc', group = '[C]onfig', mode = { 'n', 'v' } },
      -- Git List Config Global
      { '<leader>glcg', group = '[G]lobal', mode = { 'n', 'v' } },
      -- Git List Config Local
      { '<leader>glcl', group = '[L]ocal', mode = { 'n', 'v' } },


      -- Harpoon
      { '<leader>h', group = '[H]arpoon' },

      { '<leader>r', group = '[R]ename' },
      { '<leader>s', group = '[S]earch' },
      { '<leader>w', group = '[W]orkspace' },
      { '<leader>t', group = '[T]oggle' },
    },
  },
}
