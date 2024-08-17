---@type LazySpec
return { -- Useful plugin to show you pending keybinds.
  'folke/which-key.nvim',
  event = 'VimEnter', -- Sets the loading event to 'VimEnter'
  opts = {
    spec = {
        -- Document existing key chains
        {
          mode = { "n", "v" },
          { "<leader>c", group = "[C]ode" },
          { "<leader>d", group = "[D]ocument" },
          { "<leader>r", group = "[R]ename" },
          { "<leader>s", group = "[S]earch" },
          { "<leader>w", group = "[W]orkspace" },
          { "<leader>t", group = "[T]oggle" },
          { "<leader>h", group = "Git [H]unk"  },
        },
      },
    },
  config = function(_, opts) -- This is the function that runs, AFTER loading
    local wk = require("which-key")
    wk.setup(opts)
  end,
}
