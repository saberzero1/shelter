if vim.g.neovide then

  vim.g.gui_font_default_size = 16
  vim.g.gui_font_size = vim.g.gui_font_default_size
  vim.g.gui_font_face = "Fira Code"

  RefreshGuiFont = function()
    vim.opt.guifont = string.format("%s:h%s",vim.g.gui_font_face, vim.g.gui_font_size)
  end

  ResizeGuiFont = function(delta)
    vim.g.gui_font_size = vim.g.gui_font_size + delta
    RefreshGuiFont()
  end

  ResetGuiFont = function ()
    vim.g.gui_font_size = vim.g.gui_font_default_size
    RefreshGuiFont()
  end

  -- Call function on startup to set default value
  ResetGuiFont()

  -- Keymaps

  -- local opts = { noremap = true, silent = true }

  vim.keymap.set({'n', 'i'}, "<C-=>", function() ResizeGuiFont(1) end, { noremap = true, silent = true, desc = "Increase Neovide scale factor" })
  vim.keymap.set({'n', 'i'}, "<C-->", function() ResizeGuiFont(-1) end, { noremap = true, silent = true, desc = "Decrease Neovide scale factor" })
  vim.keymap.set({'n', 'i'}, "<C-0>", function() ResetGuiFont() end, { noremap = true, silent = true, desc = "Reset Neovide scale factor" })
end
