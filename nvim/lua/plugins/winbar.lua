return {
    "fgheng/winbar.nvim",
    config = function ()
        local cp = require('catppuccin.palettes').get_palette()
        require('winbar').setup({
            enabled = true,
            show_file_path = true,
            show_symbols = true,
            colors = {
                path = cp.red,
                file_name = cp.blue,
                symbols = cp.blue,
            },
            icons = {
                file_icon_default = '',
                seperator = '>',
                editor_state = '●',
                lock_icon = '',
            },

            exclude_filetype = {
                'help',
                'startify',
                'dashboard',
                'packer',
                'neogitstatus',
                'neo-tree',
                'NvimTree',
                'Trouble',
                'alpha',
                'lir',
                'Outline',
                'spectre_panel',
                'toggleterm',
                'qf',
            }
        })
    end
}
