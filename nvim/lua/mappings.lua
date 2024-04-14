-- require "nvchad.mappings"
local gitsigns = require("gitsigns")
local tabufline =  require("nvchad.tabufline")

local map = vim.keymap.set

-------------------------------------------------------------------------
-- Insert Mode
-------------------------------------------------------------------------

-- Move cursor to head or end for one line at insert mode
map("i", "<C-a>", "<ESC>^i",   { desc = "Move Beginning of line" })
map("i", "<C-e>", "<End>",     { desc = "Move End of line" })
map("i", "<C-h>", "<Left>",    { desc = "Move Left" })
map("i", "<C-l>", "<Right>",   { desc = "Move Right" })
map("i", "<C-j>", "<Down>",    { desc = "Move Down" })
map("i", "<C-k>", "<Up>",      { desc = "Move Up" })
map("i", "<C-n>", "<Plug>luasnip-next-choice",    { desc = "Next Snippet node" })
map("i", "<C-p>", "<Plug>luasnip-prev-choice",    { desc = "Prev Snippet node" })

-------------------------------------------------------------------------
-- Normal Mode
-------------------------------------------------------------------------

map("n", "<leader>hN", "<cmd>NvCheatsheet<CR>",   { desc = "Toggle NvCheatsheet" })
-- Move cursor at normal mode
map("n", "<C-h>", "<C-w>h",    { desc = "Switch Window left" })
map("n", "<C-l>", "<C-w>l",    { desc = "Switch Window right" })
map("n", "<C-j>", "<C-w>j",    { desc = "Switch Window down" })
map("n", "<C-k>", "<C-w>k",    { desc = "Switch Window up" })
-- Clear highlights
map("n", "<Esc>", "<cmd>noh<CR>",       { desc = "General Clear highlights" })
-- tabufline
map("n", "<leader>bn", "<cmd>enew<CR>", { desc = "New Empty buffer" })
-- nvimtree
map("n", "<leader>op", "<cmd>NvimTreeToggle<CR>",       { desc = "Nvimtree Toggle window" })
map("n", "<leader>oP", "<cmd>NvimTreeFocus<CR>",        { desc = "Nvimtree Focus window" })
-- telescope
map("n", "<leader> " , "<cmd>Telescope find_files<cr>", { desc = "Telescope Find files" })
map("n", "<leader>fr", "<cmd>Telescope oldfiles<CR>",   { desc = "Telescope Find oldfiles" })
map("n", "<leader>sm", "<cmd>Telescope marks<CR>",      { desc = "Telescope Find marks" })
map("n", "<leader>fF",
  "<cmd>Telescope find_files follow=true no_ignore=true hidden=true<CR>",
  { desc = "Telescope Find all files" }
)
map("n", "<leader>bb", "<cmd>Telescope buffers<CR>",    { desc = "Telescope Find buffers" })
map("n", "<leader>ss", "<cmd>Telescope current_buffer_fuzzy_find<CR>", { desc = "Telescope Find in current buffer" })
map("n", "<leader>sp", "<cmd>Telescope live_grep<CR>",                 { desc = "Telescope Live grep" })
map("n", "<leader>gl", "<cmd>Telescope git_commits<CR>",{ desc = "Telescope Git commits" })
map("n", "<leader>gs", "<cmd>Telescope git_status<CR>", { desc = "Telescope Git status" })
map("n", "<leader>hp", "<cmd>Telescope help_tags<CR>",  { desc = "Telescope Help page" })
-- map("n", "<leader>pt", "<cmd>Telescope terms<CR>",   { desc = "Telescope Pick hidden term" })
map("n", "<leader>ht", "<cmd>Telescope themes<CR>",     { desc = "Telescope Nvchad themes" })
map("n", "<leader>hk", "<cmd>WhichKey <CR>",            { desc = "Whichkey all keymaps" })

map("n", "<leader>bc", function()
  tabufline.close_buffer()
end, { desc = "Kill Buffer" })

map("n", "<tab>", function()
  tabufline.next()
end, { desc = "Buffer Goto next" })

map("n", "<S-tab>", function()
  tabufline.prev()
end, { desc = "Buffer Goto prev" })

map("n", "<leader>fi", function()
  require("conform").format { lsp_fallback = true }
end, { desc = "Format Files" })
-- Comment
map("n", "<leader>/", function()
  require("Comment.api").toggle.linewise.current()
end, { desc = "Comment Toggle" })

-- terminal
map({ "n", "t" }, "<A-i>", function()
  require("nvchad.term").toggle { pos = "float", id = "floatTerm" }
end, { desc = "Terminal Toggle Floating term" })
-- Gitsigns
map("n", "[g", function()
  if vim.wo.diff then
    return "[g"
  end
  vim.schedule(function()
    gitsigns.prev_hunk()
  end)
  return "<Ignore>"
end, { desc = "Jump To prev hunk" })

map("n", "]g", function()
  if vim.wo.diff then
    return "]g"
  end
  vim.schedule(function()
    gitsigns.next_hunk()
  end)
  return "<Ignore>"
end, { desc = "Jump To next hunk" })

map("n", "<leader>gB", function()
  package.loaded.gitsigns.blame_line()
end, { desc = "Gitsign Blame line" })

map("n", "<leader>gd", function()
  gitsigns.diffthis()
end, { desc = "Gitsign Hunk view diff" })

map("n", "<leader>gp", function()
  gitsigns.preview_hunk()
end, { desc = "Gitsign Hunk preview" })

map("n", "<leader>gr", function()
  gitsigns.reset_hunk()
end, { desc = "Gitsign Hunk reset" })

map("n", "<leader>gs", function()
  gitsigns.stage_hunk()
end, { desc = "Gitsign Hunk stage" })

map("n", "<leader>gu", function()
  gitsigns.undo_stage_hunk()
end, { desc = "Gitsign Hunk undo" })

-------------------------------------------------------------------------
-- Visual Mode
-------------------------------------------------------------------------

map("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move Line up" })
map("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move Line down" })

map(
  "v",
  "<leader>/",
  "<ESC><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>",
  { desc = "Comment Toggle" }
)

-------------------------------------------------------------------------
-- Visual Mode
-------------------------------------------------------------------------

-- terminal
map("t", "<C-x>", "<C-\\><C-N>",  { desc = "Terminal Escape terminal mode" })

map("t", "<ESC>", function()
  local win = vim.api.nvim_get_current_win()
  vim.api.nvim_win_close(win, true)
end, { desc = "Terminal Close term in terminal mode" })

-- map("n", ";", ":", { desc = "CMD enter command mode" })
-- map("i", "jk", "<ESC>")

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
