return {
  'akinsho/toggleterm.nvim',
  version = '*',
  config = function()
    require('toggleterm').setup {
      size = 20,
      open_mapping = [[<c-\>]], -- Default toggle key
      shade_terminals = true,
      direction = 'float', -- Floating terminal
      float_opts = {
        border = 'curved',
      },
    }

    -- Custom function to open lazygit in a floating terminal
    local Terminal = require('toggleterm.terminal').Terminal
    local lazygit = Terminal:new {
      cmd = 'lazygit',
      hidden = true,
      direction = 'float',
    }

    function _lazygit_toggle()
      lazygit:toggle()
    end

    vim.keymap.set('n', '<leader>lg', '<cmd>lua _lazygit_toggle()<CR>', { desc = '[L]azy[G]it' })
  end,
}
