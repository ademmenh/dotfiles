return {
    'romgrk/barbar.nvim',
    init = function()
        vim.g.barbar_auto_setup = false
    end,
    dependencies = {
        'lewis6991/gitsigns.nvim', -- OPTIONAL: for git status
        'nvim-tree/nvim-web-devicons', -- OPTIONAL: for file icons
    },
    opts = {
        animation = true,
        auto_hide = false,
        tabpages = true,
        clickable = true,
        exclude_ft = {},
        exclude_name = {},
        focus_on_close = 'left',
        -- Hide inactive buffers and file extensions. Other options are `alternate`, `current`, and `visible`.
        hide = {
            extensions = false,
            inactive = false
        },
        -- Disable highlighting alternate buffers
        highlight_alternate = false,
        -- Disable highlighting file icons in inactive buffers
        highlight_inactive_file_icons = false,
        -- Enable highlighting visible buffers
        highlight_visible = true,
        icons = {
            buffer_index = false,
            buffer_number = false,
            button = '',
            diagnostics = {
                [vim.diagnostic.severity.ERROR] = {
                    enabled = true,
                },
                [vim.diagnostic.severity.WARN] = {
                    enabled = true,
                },
                [vim.diagnostic.severity.INFO] = {
                    enabled = true,
                },
                [vim.diagnostic.severity.HINT] = {
                    enabled = true,
                    icon = "!",
                },
            },
            gitsigns = {
                added = {enabled = false, icon = '+'}, -- if enabled, the colors requires to be fix
                changed = {enabled = false, icon = '~'}, -- if enabled, the colors requires to be fix
                deleted = {enabled = false, icon = '-'}, -- if enabled, the colors requires to be fix
            },
            filetype = {
                custom_colors = false,
                enabled = true,
            },
            separator = {left = '', right = ''},
            -- If true, add an additional separator at the end of the buffer list
            separator_at_end = false,
            -- Configure the icons on the bufferline when modified or pinned.
            -- Supports all the base icon options.
            modified = {button = '●'},
            pinned = {button = '', filename = true},
            preset = 'default',
            -- Configure the icons on the bufferline based on the visibility of a buffer.
            -- Supports all the base icon options, plus `modified` and `pinned`.
            alternate = {
                filetype = {
                    enabled = false
                }
            },
            current = {
                buffer_index = true
            },
            inactive = {
                button = '×'
            },
            visible = {
                modified = {buffer_number = false}
            },
        },
        -- If true, new buffers will be inserted at the start/end of the list.
        -- Default is to insert after current buffer.
        insert_at_end = true,
        insert_at_start = false,
        maximum_padding = 6,
        minimum_padding = 4,
        -- Sets the maximum buffer name length.
        maximum_length = 16,
        -- Sets the minimum buffer name length.
        minimum_length = 0,
        semantic_letters = true,
        -- Set the filetypes which barbar will offset itself for
        sidebar_filetypes = {
            ['neo-tree'] = {
                text = '',
                event = 'BufWinLeave', -- or 'BufWinEnter'
                align = 'left',
                separator = false,
            },
            -- Or, specify all thre
            Outline = {
                event = 'BufWinLeave',
                text = 'symbols-outline',
                align = 'left'
            },
        },
        -- New buffer letters are assigned in this order. This order is
        letters = 'asdfjkl;ghnmxcvbziowerutyqpASDFJKLGHNMXCVBZIOWERUTYQP',
        -- Sets the name of unnamed buffers. By default format is "[Buffer X]"
        no_name_title = 'buffer',
        sort = {
            ignore_case = true,
        }
    },

    config = function(_, opts)
        local cp = require('catppuccin.palettes').get_palette()
        -- for Active Buffer
        -- Main tab (filename)
        vim.api.nvim_set_hl(0, "BufferCurrent", { fg = cp.blue, bg = cp.base, bold = true })
        -- Modified indicator (●)
        vim.api.nvim_set_hl(0, "BufferCurrentMod",     { fg = cp.blue, bg = cp.base, bold = true })
        -- Icon (filetype symbol)
        vim.api.nvim_set_hl(0, "BufferCurrentIcon",    { fg = cp.blue, bg = cp.yellow})
        -- Close or modified icon (X or ●)
        vim.api.nvim_set_hl(0, "BufferCurrentSign",    { fg = cp.blue, bg = cp.base})
        -- Buffer number
        vim.api.nvim_set_hl(0, "BufferCurrentIndex",   { fg = cp.blue, bg = cp.base})
        -- for hints, error, ...
        vim.api.nvim_set_hl(0, "BufferCurrentHint",   { fg = cp.blue, bg = cp.base})
        vim.api.nvim_set_hl(0, "BufferCurrentError",    { fg = cp.blue, bg = cp.base})
        vim.api.nvim_set_hl(0, "BufferCurrentWarn",  { fg = cp.blue, bg = cp.base})
        vim.api.nvim_set_hl(0, "BufferCurrentInfo",     { fg = cp.blue, bg = cp.base})

        -- for Inactive Buffers
        vim.api.nvim_set_hl(0, "BufferInactive", { fg = cp.red, bg = cp.base})
        vim.api.nvim_set_hl(0, "BufferInactiveMod",      { fg = cp.red, bg = cp.base })
        vim.api.nvim_set_hl(0, "BufferInactiveIcon",     { fg = cp.red, bg = cp.base})
        vim.api.nvim_set_hl(0, "BufferInactiveSign",     { fg = cp.red, bg = cp.base})
        vim.api.nvim_set_hl(0, "BufferInactiveIndex",    { fg = cp.red, bg = cp.base})
        vim.api.nvim_set_hl(0, "BufferInactiveHint",  { fg = cp.red, bg = cp.base})
        vim.api.nvim_set_hl(0, "BufferInactiveError",   { fg = cp.red, bg = cp.base})
        vim.api.nvim_set_hl(0, "BufferInactiveWarn", { fg = cp.red, bg = cp.base})
        vim.api.nvim_set_hl(0, "BufferInactiveInfo",    { fg = cp.red, bg = cp.base})

        -- for Visible Buffers
        vim.api.nvim_set_hl(0, "BufferVisible", { fg = cp.text, bg = cp.base })
        vim.api.nvim_set_hl(0, "BufferVisibleMod",      { fg = cp.text, bg = cp.base })
        vim.api.nvim_set_hl(0, "BufferInactiveIcon",     { fg = cp.text, bg = cp.base})
        vim.api.nvim_set_hl(0, "BufferVisibleSign",     { fg = cp.text, bg = cp.base })
        vim.api.nvim_set_hl(0, "BufferVisibleIndex",    { fg = cp.text, bg = cp.base })
        vim.api.nvim_set_hl(0, "BufferVisibleHint",     { fg = cp.text, bg = cp.base })
        vim.api.nvim_set_hl(0, "BufferVisibleError",    { fg = cp.text, bg = cp.base })
        vim.api.nvim_set_hl(0, "BufferVisibleWarn",  { fg = cp.text, bg = cp.base })
        vim.api.nvim_set_hl(0, "BufferVisibleInfo",     { fg = cp.text, bg = cp.base })

        -- barbar bg
        vim.api.nvim_set_hl(0, 'BufferTabpageFill', {bg = cp.base})
        vim.api.nvim_set_hl(0, "BufferOffset", { bg = cp.mantle})

        -- keymap
        vim.keymap.set('n', '<leader>bp', function()
            require('bufferline.api').toggle_pin()
        end, { desc = 'Toggle pin for buffer' })

        require('barbar').setup(opts)
    end
}
