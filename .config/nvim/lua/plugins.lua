-- 'vim-plug' plugins setup, you'll need to use a Lua equivalent like 'packer'
require('packer').startup(function()
  
  -- Catppuccin theme
  use { 'catppuccin/nvim', as = 'catppuccin' }

  -- Syntax highlighting
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }

  -- Autoclosing
  use {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = function()
        require("nvim-autopairs").setup {}
    end
  }

  -- LSP config
  use { 'neovim/nvim-lspconfig' }

  -- Flutter-tools
  use {
    'akinsho/flutter-tools.nvim',
    requires = {
      'nvim-lua/plenary.nvim',
      'stevearc/dressing.nvim', -- optional for vim.ui.select
    },
  }

  -- nvim-surround
  use({
    "kylechui/nvim-surround",
    tag = "*", -- Use for stability; omit to use `main` branch for the latest features
    config = function()
        require("nvim-surround").setup({
            -- Configuration here, or leave empty to use defaults
        })
    end
  })

  -- nvim-tree
  use 'nvim-tree/nvim-tree.lua'

  -- Java completions
  use 'mfussenegger/nvim-jdtls'

  -- Snippet engine
  use({
	"L3MON4D3/LuaSnip",
	-- follow latest release.
	tag = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
	-- install jsregexp (optional!:).
	run = "make install_jsregexp"
  })
end)


-- init flutter-tools
require("flutter-tools").setup {
  widget_guides = {
    enabled = true,
  },
  lsp = {
    color = { -- show the derived colours for dart variables
      enabled = true, -- whether or not to highlight color variables at all, only supported on flutter >= 2.10
      background = true,
    }
  }
}


-- Set up NvimTree
require("nvim-tree").setup()

require('keybinds')

-- Setup snippets
require("luasnip.loaders.from_vscode").lazy_load()
