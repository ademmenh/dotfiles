return {
    "nvim-neo-tree/neo-tree.nvim", 
    branch = "v3.x", 
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim"
    },
    lazy = false,
    opts = {},
    config = function (self)
      -- disable netwr neovim default file explorer
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
        bind_to_cwd = true, popup_border_style = "NC",
        close_if_last_window = true,
        window = {
          mappings = {
            ["<space>"] = "none", -- disable space to open
          }
        },
        event_handlers = {
          {
            event = "neo_tree_buffer_enter",
            handler = function()
              vim.cmd("highlight! neotreedirectoryicon guibg=none")
            end,
          },
        },
      })
    
    local function is_neotree_visible ()
          for _, win in ipairs(vim.api.nvim_tabpage_list_wins(0)) do
              local buf = vim.api.nvim_win_get_buf(win)
              if vim.bo[buf].filetype == "neo-tree" then
                  return true end
          end
          return false
    end

    local function neotree_handler ()
        if is_neotree_visible() then
            vim.cmd("Neotree close")
        else
            vim.cmd("Neotree reveal left")
        end
    end

      vim.keymap.set('n', '<C-n>', neotree_handler, { desc = "Toggle Neo-tree" })
    end,
}
