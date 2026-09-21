-- in Visual Mode, Copy to clipboard
vim.keymap.set('v', '<Leader>y', '"+y', { desc = 'Copy selection to clipboard' })
-- in Normal Mode, Copy line to clipboard
vim.keymap.set('n', '<Leader>yy', '"+yy', { desc = 'Copy line to clipboard' })

-- Buffers
vim.keymap.set('n', '<C-n>', '<Cmd>BufferNext<CR>', { desc = 'Next buffer' })
vim.keymap.set('n', '<C-p>', '<Cmd>BufferPrevious<CR>', { desc = 'Previous buffer' })
vim.keymap.set('n', '<C-x>', '<Cmd>BufferClose<CR>', { desc = 'Close buffer' })

-- Close current view/buffer (works with or without barbar)
vim.keymap.set('n', '<C-q>', function()
    local ok = pcall(vim.cmd, 'BufferClose')
    if not ok then
        vim.cmd('bdelete ' .. vim.api.nvim_get_current_buf())
    end
end, { desc = 'Close buffer (view)' })

-- Git diffview forked into a separate nvim process for complete isolation.
local function diffview_fork_cleanup(buf, tab)
    if not vim.api.nvim_buf_is_valid(buf) and not vim.api.nvim_tabpage_is_valid(tab) then
        return
    end
    if vim.api.nvim_buf_is_valid(buf) then
        pcall(vim.api.nvim_buf_delete, buf, { force = true })
    end
    if vim.api.nvim_tabpage_is_valid(tab) and #vim.api.nvim_list_tabpages() > 1 then
        pcall(vim.cmd, "tabclose " .. vim.api.nvim_tabpage_get_number(tab))
    end
end

local function diffview_fork(cmd_args)
    vim.cmd("tabnew")
    local buf = vim.api.nvim_get_current_buf()
    local tab = vim.api.nvim_get_current_tabpage()
    vim.b[buf].diffview_fork = true

    local group = vim.api.nvim_create_augroup("DiffviewForkCleanup", { clear = false })
    vim.api.nvim_create_autocmd("TermClose", {
        group = group,
        buffer = buf,
        callback = function()
            vim.schedule(function() diffview_fork_cleanup(buf, tab) end)
        end,
    })

    local fork_init = vim.fn.stdpath("config") .. "/diffview_fork.lua"
    local argv = { "nvim", "-u", fork_init, "-c", cmd_args }
    local job = vim.fn.termopen(argv, {
        on_exit = function()
            vim.schedule(function() diffview_fork_cleanup(buf, tab) end)
        end,
    })

    if job == 0 or job == -1 then
        vim.cmd("tabclose")
        vim.cmd(cmd_args)
        return
    end

    vim.cmd("startinsert")
end

vim.keymap.set('n', '<leader>gd', function() diffview_fork("DiffviewOpen") end, { desc = 'Git diff (fork)' })
vim.keymap.set('n', '<leader>gm', function() diffview_fork("DiffviewOpen -m") end, { desc = 'Git merge tool (fork)' })
vim.keymap.set('n', '<leader>gh', function()
    local path = vim.fn.fnameescape(vim.fn.expand("%:p"))
    if path == "" then
        diffview_fork("DiffviewFileHistory")
    else
        diffview_fork("DiffviewFileHistory " .. path)
    end
end, { desc = 'Git file history (fork)' })
