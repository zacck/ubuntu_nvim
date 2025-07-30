-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  use({
	'rose-pine/neovim', 
	as = 'rose-pine', 
	config = function()
	   vim.cmd('colorscheme moon')
   	end 
  })

  use {
  	'nvim-telescope/telescope.nvim', tag = '0.1.8',
	-- or                            , branch = '0.1.x',
 	 requires = { {'nvim-lua/plenary.nvim'} }
  }
  use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})

  use('theprimeagen/harpoon')


  
  use('mbbill/undotree')

  use('tpope/vim-fugitive')

  use('neovim/nvim-lspconfig')

  -- completion plugins 
  use('hrsh7th/nvim-cmp') -- Completion plugin 
  use('hrsh7th/cmp-nvim-lsp') -- lsp completion source
end)
