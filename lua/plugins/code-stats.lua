-- [[
-- https://github.com/YannickFricke/codestats.nvim
-- ]]
local code_stats = require("codestats-nvim")

code_stats.setup({
    -- token = nil, -- When the token is not provided, codestats.nvim will fallback to the CODESTATS_API_KEY environment variable
    endpoint = "https://codestats.net", -- The endpoint which should be used. Mostly you dont want to overwrite it
    interval = 60 -- The interval in seconds between pushes to the CodeStats API
})
