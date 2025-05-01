local lspconfig = require('lspconfig')

lspconfig.ccls.setup({
  init_options = {
    compilationDatabaseDirectory = ".",
    index = {
      threads = 0,
    },
    clang = {
      excludeArgs = { "-frounding-math" }, -- Example of excluding specific compiler flags
    },
  }
  })

vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { noremap = true, silent = true})

