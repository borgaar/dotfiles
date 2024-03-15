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


-- Set up Flutter/Dart LSP

