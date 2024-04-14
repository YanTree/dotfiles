-- This file  needs to have same structure as nvconfig.lua 
-- https://github.com/NvChad/NvChad/blob/v2.5/lua/nvconfig.lua

---@type ChadrcConfig
local M = {}

M.ui = {
  -- gruvbox everforest
	theme = "everforest",

  nvdash = {
    -- load_on_startup = true,
    buttons = {
      { "󰈚  Recent Files", "SPC f r", "Telescope oldfiles" },
      { "  Find File",    "SPC f f", "Telescope find_files" },
      { "󰈭  Find Word",    "SPC s p", "Telescope live_grep" },
      { "  Bookmarks",    "SPC s m", "Telescope marks" },
      { "  Themes",       "SPC h t", "Telescope themes" },
      { "  Mappings",     "SPC h N", "NvCheatsheet" },
    }
  }
	-- hl_override = {
	-- 	Comment = { italic = true },
	-- 	["@comment"] = { italic = true },
	-- },
}

return M
