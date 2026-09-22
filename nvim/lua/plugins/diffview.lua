return {
    "sindrets/diffview.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
        local set_hl = vim.api.nvim_set_hl
        set_hl(0, "DiffviewDiffAdd", { bg = "#1e3a1e" })
        set_hl(0, "DiffviewDiffDelete", { bg = "#3a1e1e" })
        set_hl(0, "DiffviewDiffChange", { bg = "#3a3a1e" })
        set_hl(0, "DiffviewDiffText", { bg = "#4a4a2a" })

        require("diffview").setup({
            view = {
                default = {
                    layout = "diff2_horizontal",
                },
            },
            keymaps = {
                view = {
                    { "n", "<c-f>", "<Cmd>DiffviewToggleFiles<CR>", { desc = "Toggle the file panel" } },
                    {
                        "n",
                        "<C-x>",
                        function()
                            vim.cmd("bdelete " .. vim.api.nvim_get_current_buf())
                        end,
                        { desc = "Close selected buffer" },
                    },
                },
                file_panel = {
                    { "n", "<c-f>", "<Cmd>DiffviewToggleFiles<CR>", { desc = "Toggle the file panel" } },
                },
                file_history_panel = {
                    { "n", "<c-f>", "<Cmd>DiffviewToggleFiles<CR>", { desc = "Toggle the file panel" } },
                },
            },
        })
    end,
}
