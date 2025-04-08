return {
    'nvim-lualine/lualine.nvim',
    dependencies = {
        'nvim-tree/nvim-web-devicons'
    },
    config = function ()
      require('lualine').setup({
        options = {
          icons_enabled = true,
          theme = 'auto',
          section_separators = '',
          component_separators = '',
          globalstatus = true,
        },
        sections = {
            lualine_a = {
              {
                  'mode',
                  icons_enabled = true,
                  align = 'left',
                  color = { fg = nil },
                  icon = ' ',
                  separator = nil,
                  padding = 2,
              }
            },
            lualine_b = {
                {
                    'branch',
                    icon = {
                      '',
                      color = { fg = nil },
                    },
                    padding = 4,
                }
            },
            lualine_c = {
                {
                  'buffers',
                  show_filename_only = true,
                  hide_filename_extension = false,
                  show_modified_status = true,
                  mode = 0,
                  show_only_active = true,
                  max_length = 1,
                  filetype_names = {
                      TelescopePrompt = 'Telescope',
                      dashboard = 'Dashboard',
                      packer = 'Packer',
                      fzf = 'FZF',
                      alpha = 'Alpha',
                      ["neo-tree"] = 'Neo-tree',
                  },
                  use_mode_colors = false,
                  padding = 2,
                },
            },
            lualine_x = {'progress'},
            lualine_y = {}
        },
    })
    end,
}

