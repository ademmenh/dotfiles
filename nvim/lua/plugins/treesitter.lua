return {
    'nvim-treesitter/nvim-treesitter',
    lazy = false,
    build = ':TSUpdate',
    config = function()
        require('nvim-treesitter').setup()

        require('nvim-treesitter').install { 'c', 'vim', 'vimdoc', 'query', 'markdown', 'lua', 'javascript', 'json', 'yaml' }

        vim.api.nvim_create_autocmd('FileType', {
            callback = function(ev)
                pcall(vim.treesitter.start, ev.buf)
            end,
        })
    end,
}