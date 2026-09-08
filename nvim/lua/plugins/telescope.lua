return {
    {
        "nvim-telescope/telescope.nvim",
        tag = '0.1.8',
        dependencies = { 'nvim-lua/plenary.nvim' },
        config = function ()
            local telescope = require("telescope.builtin")
            vim.keymap.set('n', '<leader>ff', telescope.find_files, {})
            vim.keymap.set('n', '<leader>fg', telescope.live_grep, {})
            vim.keymap.set('n', '<leader>fb', telescope.buffers, {})
            vim.keymap.set('n', '<leader>gc', telescope.git_commits, {})
            vim.keymap.set('n', '<leader>ga', telescope.git_bcommits, {})
            vim.keymap.set('n', '<leader>gb', telescope.git_branches, {})
            vim.keymap.set('n', '<leader>gs', telescope.git_stash, {})
        end,
    },
    {
        "nvim-telescope/telescope-ui-select.nvim",
        config = function()
            require("telescope").setup({
                extensions = {
                    ["ui-select"] = {
                        require("telescope.themes").get_dropdown {
                        }
                    }
                }
            })
            require("telescope").load_extension("ui-select")
        end
    }
}
