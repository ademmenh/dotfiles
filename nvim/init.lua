vim.g.mapleader = ","
vim.cmd("set expandtab")
vim.cmd("set tabstop=4")
vim.cmd("set softtabstop=4")
vim.cmd("set shiftwidth=4")

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
    if not (vim.uv or vim.loop).fs_stat(lazypath) then
      local lazyrepo = "https://github.com/folke/lazy.nvim.git"
      local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
      if vim.v.shell_error ~= 0 then
        vim.api.nvim_echo({
          { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
          { out, "WarningMsg" },
          { "\nPress any key to exit..." },
        }, true, {})
        vim.fn.getchar()
        os.exit(1)
      end
    end
    vim.opt.rtp:prepend(lazypath)


local plugins = {
    { "catppuccin/nvim", name = "catppuccin", priority = 1000 },
    { 'nvim-telescope/telescope.nvim', tag = '0.1.8', dependencies = { 'nvim-lua/plenary.nvim' }},
    { "nvim-neo-tree/neo-tree.nvim", branch = "v3.x", dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons",
            "MunifTanjim/nui.nvim",
            },
        lazy = false,
        opts = {},
    }
}

local opts = {}
require("lazy").setup(plugins, opts)

-- telescope config
local builtin = require("telescope.builtin")
vim.keymap.set('n', '<leader>p', builtin.find_files, {})
vim.keymap.set('n', '<leader>g', builtin.live_grep, {})

-- neotree config
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

require("neo-tree").setup({
  use_popups_for_input = true,
  filesystem = {
    filtered_items = {
      visible = true,
      hide_dotfiles = false,
      hide_gitignored = false,
    },
  },
  hijack_netrw_behavior = "disabled",
  bind_to_cwd = true,
  popup_border_style = "NC",
})

local function is_neotree_visible()
    for _, win in ipairs(vim.api.nvim_tabpage_list_wins(0)) do
        local buf = vim.api.nvim_win_get_buf(win)
        if vim.bo[buf].filetype == "neo-tree" then
            return true
        end
    end
    return false
end

local function neotree_handler()
    if is_neotree_visible() then
        vim.cmd("Neotree close")
    else
        vim.cmd("Neotree reveal left")
    end
end

vim.keymap.set('n', '<C-n>', neotree_handler, { desc = "Toggle Neo-tree" })


-- catppuccin config
require("catppuccin").setup()
vim.cmd.colorscheme "catppuccin"
