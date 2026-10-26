return {
    {
        "nvim-telescope/telescope.nvim",
        tag = 'v0.2.2',
        dependencies = { 'nvim-lua/plenary.nvim', 'nvim-telescope/telescope-ui-select.nvim' },
        config = function ()
            local telescope = require("telescope")
            local builtin = require("telescope.builtin")

            telescope.setup({
                defaults = {
                    layout_strategy = "horizontal",
                    sorting_strategy = "descending",
                    layout_config = {
                        width = 0.99,
                        height = 0.99,
                        prompt_position = "bottom",
                        horizontal = {
                            prompt_position = "bottom",
                            preview_width = 0.6,
                        },
                    },
                },
                extensions = {
                    ["ui-select"] = {
                        require("telescope.themes").get_dropdown({}),
                    },
                },
            })

            telescope.load_extension("ui-select")

            vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
            vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
            vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
            vim.keymap.set('n', '<leader>gc', builtin.git_commits, {})
            vim.keymap.set('n', '<leader>ga', builtin.git_bcommits, {})
            vim.keymap.set('n', '<leader>gb', builtin.git_branches, {})
            vim.keymap.set('n', '<leader>gs', builtin.git_stash, {})
        end,
    },
}
