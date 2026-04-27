vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- ftplugin/lua.lua in nvim 0.12 unconditionally calls vim.treesitter.start(),
-- but the nvim-treesitter lua parser may not match the bundled queries.
-- Intercept here (before any ftplugin runs) to silently skip lua.
local _ts_start = vim.treesitter.start
vim.treesitter.start = function(buf, lang, ...)
  local ft = lang or vim.bo[buf or 0].filetype
  if ft == "lua" then return end
  return _ts_start(buf, lang, ...)
end

require("config.options")
require("config.keymaps")
require("config.autocmds")
require("config.lazy")
