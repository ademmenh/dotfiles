return {
    'neovim/nvim-lspconfig',
    version = '*',
    config = function()
        -- New way (Neovim 0.11+)
        vim.lsp.config('lua_ls', {
            cmd = { 'lua-language-server' },
            settings = {
                Lua = {
                    runtime = { version = 'LuaJIT' },
                    diagnostics = { globals = { 'vim' } },
                    workspace = { library = vim.api.nvim_get_runtime_file('', true) },
                    telemetry = { enable = false },
                },
            },
        })

        vim.lsp.config('pyright', {
            cmd = { 'pyright-langserver', '--stdio' },
            settings = {
                python = {
                    analysis = { autoSearchPaths = true, useLibraryCodeForTypes = true },
                },
            },
        })

        -- Enable the servers
        vim.lsp.enable('lua_ls')
        vim.lsp.enable('pyright')

        -- Keymaps
        vim.api.nvim_create_autocmd('LspAttach', {
            group = vim.api.nvim_create_augroup('UserLspConfig', {}),
            callback = function(ev)
                local opts = { buffer = ev.buf }
                vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
                vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
                vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
                vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, opts)
                vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
                vim.keymap.set('n', '<leader>f', function()
                    vim.lsp.buf.format { async = true }
                end, opts)
            end,
        })
    end
}
