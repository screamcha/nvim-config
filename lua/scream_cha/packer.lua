local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'

  -- fuzzy-finder
  use 'nvim-lua/plenary.nvim'
  use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
  use { 'nvim-telescope/telescope.nvim', tag = '0.1.1' }

  -- treesitter
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate'
  }

  -- lualine
  use { "arkav/lualine-lsp-progress" }
  use { "nvim-lualine/lualine.nvim" }

  -- neo-tree
  use { 'nvim-lua/plenary.nvim' }
  use { 'nvim-tree/nvim-web-devicons' }
  use { 'MunifTanjim/nui.nvim' }
  use {
    'nvim-neo-tree/neo-tree.nvim',
    branch = 'v2.x',
  }

  -- lsp
  use {
    'williamboman/mason.nvim',
    run = ':MasonUpdate'
  }
  use 'williamboman/mason-lspconfig.nvim'
  use 'neovim/nvim-lspconfig'
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'L3MON4D3/LuaSnip'

  -- git
  use 'tpope/vim-fugitive'
  use 'airblade/vim-gitgutter'

  -- tmux
  use 'christoomey/vim-tmux-navigator'

  -- themes
  use({ 'projekt0n/github-nvim-theme' })
  use({ 'catppuccin/nvim', as = 'catpuccin' })

  vim.cmd('colorscheme catppuccin-mocha')

  if packer_bootstrap then
    require('packer').sync()
  end
end)
