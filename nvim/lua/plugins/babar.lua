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
        -- Enables/disable clickable tabs
        --  - left-click: go to buffer
        --  - middle-click: delete buffer
        clickable = true,
        -- Excludes buffers from the tabline
        exclude_ft = {'javascript'},
        exclude_name = {'package.json'},
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
                [vim.diagnostic.severity.ERROR] = {enabled = true},
                [vim.diagnostic.severity.WARN] = {enabled = false},
                [vim.diagnostic.severity.INFO] = {enabled = false},
                [vim.diagnostic.severity.HINT] = {enabled = true},
            },
            gitsigns = {
                added = {enabled = true, icon = '+'},
                changed = {enabled = true, icon = '~'},
                deleted = {enabled = true, icon = '-'},
            },
            filetype = {
                -- Sets the icon's highlight group.
                -- If false, will use nvim-web-devicons colors
                custom_colors = true,
                -- Requires `nvim-web-devicons` if `true`
                enabled = true,
            },
            separator = {left = '', right = ''},
            -- If true, add an additional separator at the end of the buffer list
            separator_at_end = true,
            -- Configure the icons on the bufferline when modified or pinned.
            -- Supports all the base icon options.
            modified = {button = '●'},
            pinned = {button = '', filename = true},
            -- Use a preconfigured buffer appearance— can be 'default', 'powerline', or 'slanted'
            preset = 'default',
            -- Configure the icons on the bufferline based on the visibility of a buffer.
            -- Supports all the base icon options, plus `modified` and `pinned`.
            alternate = {filetype = {enabled = false}},
            current = {buffer_index = true},
            inactive = {button = '×'},
            visible = {modified = {buffer_number = false}},
        },
        -- If true, new buffers will be inserted at the start/end of the list.
        -- Default is to insert after current buffer.
        insert_at_end = false,
        insert_at_start = false,
        maximum_padding = 2,
        minimum_padding = 2,
        -- Sets the maximum buffer name length.
        maximum_length = 16,
        -- Sets the minimum buffer name length.
        minimum_length = 0,
        -- If set, the letters for each buffer in buffer-pick mode will be
        -- assigned based on their name. Otherwise or in case all letters are
        -- already assigned, the behavior is to assign letters in order of
        -- usability (see order below)
        semantic_letters = true,
        -- Set the filetypes which barbar will offset itself for
        sidebar_filetypes = {
            -- Use the default values: {event = 'BufWinLeave', text = '', align = 'left'}
            NvimTree = true,
            -- Or, specify the text used for the offset:
            undotree = {
                text = 'undotree',
                align = 'center', -- *optionally* specify an alignment (either 'left', 'center', or 'right')
            },
            -- Or, specify the event which the sidebar executes when leaving:
            ['neo-tree'] = {event = 'BufWipeout'},
            -- Or, specify all three
            Outline = {event = 'BufWinLeave', text = 'symbols-outline', align = 'right'},
        },
        -- New buffer letters are assigned in this order. This order is
        -- optimal for the qwerty keyboard layout but might need adjustment
        -- for other layouts.
        letters = 'asdfjkl;ghnmxcvbziowerutyqpASDFJKLGHNMXCVBZIOWERUTYQP',
        -- Sets the name of unnamed buffers. By default format is "[Buffer X]"
        no_name_title = ' ',
        sort = {
            ignore_case = true,
        }
    },
    config = function(_, opts)
        require('barbar').setup(opts)
    end
}
