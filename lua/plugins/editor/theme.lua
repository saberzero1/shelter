local alpha = function()
  return string.format("%x", math.floor(255 * (vim.g.neovide_transparency_point or 0.8)))
end

---@type LazySpec
return { -- You can easily change to a different colorscheme.
  -- Change the name of the colorscheme plugin below, and then
  -- change the command in the config to whatever the name of that colorscheme is.
  --
  -- If you want to see what colorschemes are already installed, you can use `:Telescope colorscheme`.
  'folke/tokyonight.nvim',
  lazy = false,
  priority = 1000,
  config = function()
    require("tokyonight").setup({
      transparent = true,
      style = 'storm',
      styles = {
        sidebars = "transparent",
        floats = "transparent",
        statusline = "transparent",
      },
      on_colors = function(colors)
        colors.bg_statusline = colors
            .none -- To check if its working try something like "#ff00ff" instead of colors.none
      end,
      on_highlights = function(highlights)
        highlights.TreesitterContext = { bg = "NONE" }
        highlights.TreesitterContextLineNumber = { bg = "NONE" }
        highlights.LineNr4 = { fg = "#3B4261" }
        highlights.LineNr3 = { fg = "#4d71a0" }
        highlights.LineNr2 = { fg = "#6fc1cf" }
        highlights.LineNr1 = { fg = "#aff1ff" }
        highlights.LineNr0 = { fg = "#FF9D65", bold = true }
      end,
    })
    if vim.g.neovide then
      -- Set transparency and background color (title bar color)
      vim.g.neovide_background_color_base = "#2a2839"
      vim.g.neovide_background_color = vim.g.neovide_background_color_base .. alpha()
      vim.cmd.colorscheme('tokyonight')
    else
      vim.cmd.colorscheme('tokyonight') -- setting
    end
  end
}