return {
    "sindrets/diffview.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
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
