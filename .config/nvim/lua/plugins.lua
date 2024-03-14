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

  -- Java completions
  use 'mfussenegger/nvim-jdtls'

end)

-- Set up flutter tools
require("flutter-tools").setup {} -- use defaults

-- Set up Flutter/Dart LSP
require'lspconfig'.dartls.setup{
  cmd = {
    "dart", 
    "/home/borgar/snap/flutter/common/flutter/bin/cache/dart-sdk/bin/snapshots/analysis_server.dart.snapshot", 
    "--lsp"
  },
  root_dir = function(fname)
    return require'lspconfig'.util.find_git_ancestor(fname) or require'lspconfig'.util.find_files(".dart_tool/package_config.json")
  end,
}

require'nvim-surround'.setup()

