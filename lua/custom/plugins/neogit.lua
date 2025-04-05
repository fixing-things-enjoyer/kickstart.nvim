return {
  'NeogitOrg/neogit',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'sindrets/diffview.nvim',
    'nvim-telescope/telescope.nvim',
  },
  config = function()
    local neogit = require 'neogit'
    neogit.setup {
      integrations = {
        diffview = true,
        telescope = true,
      },
      disable_commit_confirmation = false,
      auto_refresh = true,
      signs = {
        section = { '>', 'v' },
        item = { '>', 'v' },
      },
    }

    -- Keymaps to open specific Neogit features. Define these OUTSIDE mappings.status

    -- Example of how to open a specific neogit command
    local function open_neogit_command(command)
      return function()
        neogit.open { kind = 'split', action = command }
      end
    end

    -- Keymap to open Neogit status
    vim.keymap.set('n', '<leader>gs', function()
      neogit.open { kind = 'split' } -- opens the status
    end, { desc = '[G]it [S]tatus (Neogit)' })

    -- keymap to open the commit popup, pull popup, and push popup
    vim.keymap.set('n', 'gc', open_neogit_command 'CommitPopup', { desc = '[G]it [C]ommit (Popup)' })
    vim.keymap.set('n', 'gp', open_neogit_command 'PullPopup', { desc = '[G]it [P]ull (Popup)' })
    vim.keymap.set('n', 'gP', open_neogit_command 'PushPopup', { desc = '[G]it [P]ush (Popup)' })
  end,
}
