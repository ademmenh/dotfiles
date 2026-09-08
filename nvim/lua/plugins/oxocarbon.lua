return {
    "nyoom-engineering/oxocarbon.nvim",
    build = false,
    priority = 1000,
    lazy = false,
    config = function()
        vim.cmd.colorscheme "oxocarbon"
    end,
}