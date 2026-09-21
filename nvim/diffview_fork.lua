vim.cmd("set expandtab")
vim.cmd("set tabstop=4")
vim.cmd("set softtabstop=4")
vim.cmd("set shiftwidth=4")

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.cursorline = true
vim.opt.signcolumn = "yes"
vim.opt.termguicolors = true
vim.opt.background = "dark"

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    local lazyrepo = "https://github.com/folke/lazy.nvim.git"
    local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
    if vim.v.shell_error ~= 0 then
        vim.api.nvim_echo({
            { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
            { out,                            "WarningMsg" },
            { "\nPress any key to exit..." },
        }, true, {})
        vim.fn.getchar()
        os.exit(1)
    end
end

vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    require("plugins.oxocarbon"),
    require("plugins.lualine"),
    require("plugins.babar"),
    require("plugins.diffview"),
})

vim.keymap.set("n", "<C-f>", "<Cmd>DiffviewToggleFiles<CR>", { desc = "Toggle diffview panel" })

vim.keymap.set("n", "<C-q>", function()
    local ok, lib = pcall(require, "diffview.lib")
    if ok and #lib.views > 0 then
        vim.cmd("DiffviewClose")
    end
    if not (ok and #lib.views > 0) then
        vim.cmd("quit")
    end
end, { desc = "Close diffview view / quit fork" })
