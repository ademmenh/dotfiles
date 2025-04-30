return {
    'nvim-lualine/lualine.nvim', dependencies = {
        'nvim-tree/nvim-web-devicons'
    },
    config = function()
        local cp = require('catppuccin.palettes').get_palette()
        require('lualine').setup({
            options = {
                icons_enabled = true,
                theme = 'auto',
                section_separators = {
                    left = '',
                    right = ''
                },
                component_separators = {
                    left = '',
                    right = ''
                },
                globalstatus = true,
                disabled_filetypes = {
                    statusline = {},
                    winbar = {},
                },
            },

            sections = {
                lualine_a = {
                    {
                        'mode',
                        icons_enabled = true,
                        align = 'left',
                        color = function()
                            local mode = vim.fn.mode()
                            if mode == 'n' then
                                return { fg = cp.bg, bg = cp.red }
                            elseif mode == 'i' then
                                return { fg = cp.bg, bg = cp.blue }
                            elseif mode:match('[vV]') then
                                return { fg = cp.bg, bg = cp.red }
                            elseif mode == 'R' then
                                return { fg = cp.bg, bg = cp.red}
                            else
                                return { fg = cp.bg, bg = cp.red }
                            end
                        end,
                        icon = ' ',
                        separator = { left = '', right = '' },
                        padding = 2,
                    },
                },
                lualine_b = {
                    {
                        'branch',
                        icon = {
                            '',
                            align = 'left',
                        },
                        color = function()
                            local mode = vim.fn.mode()
                            if mode == 'n' then
                                return { fg = cp.red, bg = cp.surface_0 }
                            elseif mode == 'i' then
                                return { fg = cp.blue, bg = cp.surface_0}
                            elseif mode:match('[vV]') then
                                return { fg = cp.red, bg = cp.surface_0}
                            elseif mode == 'R' then
                                return { fg = cp.red, bg = cp.surface_0}
                            else
                                return { fg = cp.red, bg = cp.surface_0 }
                            end
                        end,
                        separator = { left = '', right = '' },
                        padding = 2,
                    },
                },
                lualine_c = {},
                lualine_x = {},
                lualine_y = {},
                lualine_z = {
                    {
                        'location',
                        color = function()
                            local mode = vim.fn.mode()
                            if mode == 'n' then
                                return { fg = cp.bg, bg = cp.red }
                            elseif mode == 'i' then
                                return { fg = cp.bg, bg = cp.blue }
                            elseif mode:match('[vV]') then
                                return { fg = cp.bg, bg = cp.red }
                            elseif mode == 'R' then
                                return { fg = cp.bg, bg = cp.red }
                            else
                                return { fg = cp.bg, bg = cp.red }
                            end
                        end,
                        padding = 2
                    }
                }
            },
            inactive_sections = {
                lualine_a = {},
                lualine_b = {},
                lualine_c = {},
                lualine_x = {},
                lualine_y = {},
                lualine_z = {}
            }
        })
    end,
}

