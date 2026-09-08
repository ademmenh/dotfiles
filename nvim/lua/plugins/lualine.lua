return {
    'nvim-lualine/lualine.nvim', dependencies = {
        'nvim-tree/nvim-web-devicons'
    },
    config = function()
        local function hex(color)
            if not color then return nil end
            return string.format('#%06x', color)
        end
        local function hl_color(hl, key)
            local c = vim.api.nvim_get_hl(0, { name = hl, link = false })[key]
            return hex(c)
        end
        local NORMAL_BG = hl_color('Normal', 'bg') or '#161616'
        local RED     = hl_color('Error', 'fg')  or '#ee5396'
        local BLUE    = hl_color('Function', 'fg') or '#78a9ff'
        local SURFACE = hl_color('Comment', 'fg')  or '#5a5a5a'
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
                                return { fg = NORMAL_BG, bg = RED }
                            elseif mode == 'i' then
                                return { fg = NORMAL_BG, bg = BLUE }
                            elseif mode:match('[vV␖]') then
                                return { fg = NORMAL_BG, bg = RED }
                            elseif mode == 'R' then
                                return { fg = NORMAL_BG, bg = RED}
                            else
                                return { fg = NORMAL_BG, bg = RED }
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
                                return { fg = RED, bg = SURFACE }
                            elseif mode == 'i' then
                                return { fg = BLUE, bg = SURFACE}
                            elseif mode:match('[vV␖]') then
                                return { fg = RED, bg = SURFACE}
                            elseif mode == 'R' then
                                return { fg = RED, bg = SURFACE}
                            else
                                return { fg = RED, bg = SURFACE }
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
                                return { fg = NORMAL_BG, bg = RED }
                            elseif mode == 'i' then
                                return { fg = NORMAL_BG, bg = BLUE }
                            elseif mode:match('[vV␖]') then
                                return { fg = NORMAL_BG, bg = RED }
                            elseif mode == 'R' then
                                return { fg = NORMAL_BG, bg = RED }
                            else
                                return { fg = NORMAL_BG, bg = RED }
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
