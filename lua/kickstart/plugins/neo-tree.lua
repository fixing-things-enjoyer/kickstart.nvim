-- Neo-tree is a Neovim plugin to browse the file system
-- https://github.com/nvim-neo-tree/neo-tree.nvim
-- lua/kickstart/plugins/neo-tree.lua

return {
  'nvim-neo-tree/neo-tree.nvim',
  version = '*',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons',
    'MunifTanjim/nui.nvim',
  },
  config = function()
    require('neo-tree').setup {
      close_if_last_window = true,
      open_files_do_not_replace_types = { 'terminal', 'trouble', 'qf' },
    }
    vim.api.nvim_set_keymap('n', '<f1>', ':Neotree toggle<CR>', { noremap = true, silent = true })
  end,
}
