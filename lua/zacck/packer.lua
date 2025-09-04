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
	   vim.cmd('colorscheme rose-pine')
   	end 
  })

  use {
  	'nvim-telescope/telescope.nvim', tag = '0.1.8',
	-- or                            , branch = '0.1.x',
 	 requires = { {'nvim-lua/plenary.nvim'} }
  }
  use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})

  use('theprimeagen/harpoon')

  use({
	  'MeanderingProgrammer/render-markdown.nvim', 
	  after = { 'nvim-treesitter' }, 
	  requires = { 'echasnovski/mini.nvim', opt = true }, 
	  config = function()
		  require('render-markdown').setup({
			  latex = {
				  enabled = true, 
				  render_modes = false, 
				  converter = 'latex2text',
				  highlight = 'RenderMarkdownMath', 
				  position = 'above', 
				  top_pad = 0,
				  bottom_pad = 0, 
				  virtual = false,
			  },
		  })
	  end, 
  })

  use('mbbill/undotree')

  use('tpope/vim-fugitive')

  use('neovim/nvim-lspconfig')

  -- completion plugins 
  use('hrsh7th/nvim-cmp') -- Completion plugin 
  use('hrsh7th/cmp-nvim-lsp') -- lsp completion source
end)
