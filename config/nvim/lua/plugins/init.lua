-- plugin manager setup
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- for global lazy variable
local status_ok, lazy = pcall(require, "lazy")
if not status_ok then
  print("lazy just installed, please restart neovim")
  return
end

-- plugins
lazy.setup({
  -- Theme
  {
    'folke/tokyonight.nvim',
    -- 'rebelot/kanagawa.nvim',
    priority = 1000,
    config = function()
      vim.cmd.colorscheme 'tokyonight-night'
      -- vim.cmd.colorscheme 'kanagawa'
    end,
  },

  --UI improvement for custom options
  {
    'stevearc/dressing.nvim',
    opts = {},
  },

  -- better command line UI
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    opts = {},
    dependencies = {
      "MunifTanjim/nui.nvim",
      "rcarriga/nvim-notify",
    }
  },

  -- LSP STUFF!
  {
    'neovim/nvim-lspconfig',
    'williamboman/mason.nvim',
    'williamboman/mason-lspconfig.nvim',
  },

  'folke/neodev.nvim',

  -- Autocompletion
  {
    'hrsh7th/nvim-cmp',
    dependencies = {
      'L3MON4D3/LuaSnip',
      'saadparwaiz1/cmp_luasnip',
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-path',
      'rafamadriz/friendly-snippets',
    },
  },

  -- Highlight, edit, and navigate code
  {
    'nvim-treesitter/nvim-treesitter',
    dependencies = {
      'nvim-treesitter/nvim-treesitter-textobjects',
    },
    build = ':TSUpdate',
  },

  -- Detect tabstop and shiftwidth automatically
  'tpope/vim-sleuth',

  -- Show indentations
  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    opts = {}
  },

  -- Easily add comments
  {
    'numToStr/Comment.nvim',
    opts = {}
  },

  -- Show keymaps
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    init = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 1000
    end,
    opts = {}
  },

  -- Searching
  {
    'nvim-telescope/telescope.nvim',
    dependencies = {
      'nvim-lua/plenary.nvim',
      {
        'nvim-telescope/telescope-fzf-native.nvim',
        build = 'make',
        cond = function()
          return vim.fn.executable 'make' == 1
        end,
      },
    },
  },

  -- Better status line
  {
    'nvim-lualine/lualine.nvim',
    opts = {
      options = {
        icons_enabled = true,
        theme = 'auto',
        disabled_filetypes = { 'NvimTree', 'toggleterm' },
        always_divide_middle = true,
      },
    },
  },

  -- File explorer
  {
    'nvim-tree/nvim-tree.lua',
    dependencies = { {'nvim-tree/nvim-web-devicons'}}
  },

  -- Terminal integration
  {
    'akinsho/toggleterm.nvim',
    version = "*",
    config = true
  },

  -- Buffer managerment plugins
  {
    'akinsho/bufferline.nvim',
    dependencies = { {'nvim-tree/nvim-web-devicons'}}
  },
  {
    'famiu/bufdelete.nvim',
  },
  {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" }
  },

  -- Dashboard
  {
    'glepnir/dashboard-nvim',
    event = 'VimEnter',
    config = function()
      require("plugins.config.dashboard-nvim")
    end,
    dependencies = {{'nvim-tree/nvim-web-devicons'}}
  },

  -- LeetCode integration
  {
    "kawre/leetcode.nvim",
    build = ":TSUpdate html",
    dependencies = {
        "nvim-telescope/telescope.nvim",
        "nvim-lua/plenary.nvim",
        "MunifTanjim/nui.nvim",

        -- optional
        "nvim-treesitter/nvim-treesitter",
        "rcarriga/nvim-notify",
        "nvim-tree/nvim-web-devicons",
    },
    opts = {
      lang = "python",
    },
  },
})


-- load plugins configs
require("plugins.config.treesitter")
require("plugins.config.bufferline")
require("plugins.config.nvim-tree")
require("plugins.config.indent-blankline")
require("plugins.config.telescope")
require("plugins.config.toggleterm")
require("plugins.config.lsp")
require("plugins.config.noice")

-- load keymaps for plugins
require("plugins.mappings")

-- load autocmds
require("plugins.autocmds")
