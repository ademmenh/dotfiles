return {
   {
     "williamboman/mason.nvim",
     config = function()
        require("mason").setup()
     end
   },
   {
      "williamboman/mason-lspconfig.nvim",
      config = function()
         require("mason-lspconfig").setup({
            ensure_installed = {"lua_ls", "pylsp", "eslint", "ts_ls", "jsonls"}
         })
      end
   },
   {
      "neovim/nvim-lspconfig",
      config = function()
         local lspconf = require("lspconfig")
         lspconf.lua_ls.setup({})
         lspconf.pylsp.setup({})
         lspconf.eslint.setup({})
         lspconf.ts_ls.setup({})
         lspconf.jsonls.setup({})

         vim.keymap.set('n', '<leader>h', vim.lsp.buf.hover, {})
         vim.keymap.set('n', '<leader>d', vim.lsp.buf.definition, {})
         vim.keymap.set({'n', 'v'}, '<leader>ca', vim.lsp.buf.code_action, {})
      end
   }
}
