-- overriding default plugin configs!
local M = {}

M.treesitter = {
  ensure_installed = {
    "lua",  "bash",
    "vim",  "vimdoc",
    "toml", "yaml",
    "json", "xml", "ssh_config",
    "rust", "python",       "cpp",   "c",   "c_sharp",
    "wgsl", "wgsl_bevy",    "hlsl",  "glsl",
    "make", "cmake",
    "markdown", "markdown_inline", "org",
  },

  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection    = "gnn", -- set to `false` to disable one of the mappings
      node_incremental  = "grn",
      scope_incremental = "grc",
      node_decremental  = "grm",
    },
  },
}

M.nvimtree = {
  view     = {
    adaptive_size = true,
  },
  filters  = {
    dotfiles = true,
    custom   = { "node_modules" },
  },
  git      = {
    enable   = true,
    ignore   = true,
  },
  renderer = {
    highlight_git = true,
    icons    = {
      show   = {
        git  = true,
      },
    },
  },
}

M.mason = {
  ensure_installed = {
    -- lua stuff
    "lua-language-server",
    "stylua",
  },
}

return M
