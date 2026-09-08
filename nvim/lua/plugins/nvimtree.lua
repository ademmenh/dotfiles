return {
    'nvim-tree/nvim-tree.lua',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    lazy = false,
    config = function()
        require('nvim-tree').setup {
            view = {
                width = 30,
            },
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
