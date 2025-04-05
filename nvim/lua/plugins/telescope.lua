return {
    "nvim-telescope/telescope.nvim",
    tag = '0.1.8',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function ()
      local telescope = require("telescope.builtin")
      vim.keymap.set('n', '<leader>f', telescope.find_files, {})
      vim.keymap.set('n', '<leader>g', telescope.live_grep, {})
    end,
}

