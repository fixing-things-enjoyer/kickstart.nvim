local opts = { noremap = true, silent = true }

-- Use vim.diagnostic.jump() as recommended
vim.keymap.set('n', '<F2>', function()
  vim.diagnostic.jump { count = 1, float = true } -- Jump to next, show float
end, vim.tbl_extend('force', { desc = 'Go to next diagnostic' }, opts))

vim.keymap.set('n', '<F3>', function()
  vim.diagnostic.jump { count = -1, float = true } -- Jump to previous, show float
end, vim.tbl_extend('force', { desc = 'Go to previous diagnostic' }, opts))

-- Optional: Keep a separate keymap just to show the float at the cursor without jumping
vim.keymap.set('n', '<leader>e', function()
  vim.diagnostic.open_float(nil, { scope = 'cursor' }) -- Still useful sometimes
end, vim.tbl_extend('force', { desc = 'Show diagnostics for cursor' }, opts))

-- Keybinds to make split navigation easier, adding a split if none exists
local function smart_split(direction, fallback_cmd)
  local win = vim.fn.winnr()
  vim.cmd('wincmd ' .. direction)
  if vim.fn.winnr() == win then
    vim.cmd(fallback_cmd)
  end
end

vim.keymap.set('n', '<C-h>', function()
  smart_split('h', 'vsplit')
end, { desc = 'Move left or create vertical split' })
vim.keymap.set('n', '<C-l>', function()
  smart_split('l', 'vsplit')
end, { desc = 'Move right or create vertical split' })
vim.keymap.set('n', '<C-j>', function()
  smart_split('j', 'split')
end, { desc = 'Move down or create horizontal split' })
vim.keymap.set('n', '<C-k>', function()
  smart_split('k', 'split')
end, { desc = 'Move up or create horizontal split' })
