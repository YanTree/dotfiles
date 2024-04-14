local overrides = require "configs.overrides"

return {
  --------------------------------------- default plugins -----------------------------------------
  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    config = function()
      require "configs.conform"
    end,
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = overrides.treesitter,
  },

  -- override default configs
  { "nvim-tree/nvim-tree.lua", opts = overrides.nvimtree },

  { "williamboman/mason.nvim", opts = overrides.mason },

  -- These are some examples, uncomment them if you want to see them work!
  {
    "neovim/nvim-lspconfig",
    config = function()
      require("nvchad.configs.lspconfig").defaults()
      require "configs.lspconfig"
    end,
  },
}
