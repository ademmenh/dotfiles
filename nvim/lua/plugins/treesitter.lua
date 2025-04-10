return {
    'nvim-treesitter/nvim-treesitter',
    build = "TSUpdate",
    config = function ()
        local treesitter = require("nvim-treesitter.configs")
        treesitter.setup({
            ensure_installed = {"c", "vim", "vimdoc", "query", "markdown", "lua", "javascript", "json", "yaml", "markdown"},
            highlight = { enable = true },
            ident = { enable = true },
        })
    end
}

