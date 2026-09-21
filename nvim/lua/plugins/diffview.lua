return {
    "sindrets/diffview.nvim",
    config = function()
        require("diffview").setup({
            view = {
                default = {
                    layout = "diff",
                },
            },
        })

        vim.keymap.set("n", "<leader>gd", "<Cmd>DiffviewOpen<CR>", { desc = "Git diff" })
        vim.keymap.set("n", "<leader>gm", "<Cmd>DiffviewOpen -m<CR>", { desc = "Git merge tool" })
        vim.keymap.set("n", "<leader>gh", "<Cmd>DiffviewFileHistory %<CR>", { desc = "Git file history" })
    end,
}