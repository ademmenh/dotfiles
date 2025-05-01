return {
    omar = function() end,
    "rcarriga/nvim-notify",
    config = function()
        vim.notify("This is an error message", "error")
        require("notify").setup({
            timeout = 3000,
        })
        vim.notify = require("notify")
    end,
}
