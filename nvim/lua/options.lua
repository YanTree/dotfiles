require "nvchad.options"

-- add yours here!
local opt = vim.opt

opt.shiftwidth   = 4
opt.tabstop      = 4
opt.softtabstop  = 4

opt.colorcolumn  = "120"

opt.fileencoding = "utf-8"
opt.backup = false

opt.scrolloff = 5
opt.sidescrolloff = 5

local path = os.getenv("HOME") .. "/Library/snippets"
vim.g.lua_snippets_path = path

-- register wgsl ft
vim.filetype.add {
  extension = {
    wgsl = "wgsl",
    shader = "shader",
    hlsl = "hlsl",
  },
}

-- local o = vim.o
-- o.cursorlineopt ='both' -- to enable cursorline!
