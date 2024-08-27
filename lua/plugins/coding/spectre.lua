---@type LazySpec
return {
  "nvim-pack/nvim-spectre",
  build = false,
  cmd = "Spectre",
  opts = { open_cmd = "noswapfile vnew" },
  -- stylua: ignore
  keys = {
    { "<leader>rr", function() require("spectre").toggle() end,                                 desc = "Replace in Files (Spectre)" },
    { "<leader>rw", function() require("spectre").open_visual({ select_word = true }) end,      desc = "Replace Selected Word (Spectre)" },
    { "<leader>rf", function() require("spectre").open_file_search({ select_word = true }) end, desc = "Replace in Current File (Spectre)" },
  },
}