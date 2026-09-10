return {
    'nvim-tree/nvim-tree.lua',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    lazy = false,
    config = function()
        require('nvim-tree').setup {
            view = {
                width = 30,
            },
            on_attach = function(bufnr)
                local api = require('nvim-tree.api')
                api.config.mappings.default_on_attach(bufnr)
                vim.keymap.set('n', 'H', api.filter.dotfiles.toggle, { buffer = bufnr, desc = 'Toggle dotfiles' })
            end,
            hijack_directories = {
                enable = true,
                auto_open = false,
            },
            renderer = {
                group_empty = true,
                indent_markers = {
                    enable = true,
                },
                icons = {
                    git_placement = 'after',
                    glyphs = {
                        git = {
                            unstaged = 'M',
                            staged = 'A',
                            unmerged = '═',
                            renamed = 'R',
                            untracked = 'U',
                            deleted = 'D',
                            ignored = '·',
                        },
                    },
                },
            },
            filters = {
                dotfiles = false,
                git_ignored = false,
            },
        }

        local function toggle_tree()
            if require('nvim-tree.view').is_visible() then
                vim.cmd('NvimTreeClose')
            else
                vim.cmd('NvimTreeOpen')
            end
        end

        vim.keymap.set('n', '<C-f>', toggle_tree, { desc = 'Toggle file explorer' })
    end,
}
