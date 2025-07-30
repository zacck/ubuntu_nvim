local lspconfig = require('lspconfig')

lspconfig.clangd.setup({
	capabilities = capabilities, 
	filetypes = {"c", "cpp", "objc", "objcpp"},
	root_dir = lspconfig.util.root_pattern("compile_commands.json", ".git", ".west"), 
	cmd = { "clangd", "--background-index", "--clang-tidy" },
	init_options = {
		fallbackFlags = {"-std=c11"}, 
	},
})

-- Configure nvim-cmp for LSP-only completion 
local cmp = require('cmp')
cmp.setup({
  mapping = {
    ['<C-n>'] = cmp.mapping.select_next_item(), -- Next completion item
    ['<C-h>'] = cmp.mapping.select_prev_item(), -- Previous completion item
    ['<C-y>'] = cmp.mapping.confirm({ select = true }), -- Confirm selection
    ['<C-Space>'] = cmp.mapping.complete(), -- Trigger completion
  },
  sources = {
    { name = 'nvim_lsp' }, -- Only LSP completions from clangd
  }
})

vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { noremap = true, silent = true})

