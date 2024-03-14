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

  -- Java completions
  use 'mfussenegger/nvim-jdtls'

end)

