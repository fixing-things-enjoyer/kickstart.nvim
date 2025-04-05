return {
  'folke/noice.nvim',
  event = 'VeryLazy',
  dependencies = {
    'MunifTanjim/nui.nvim',
    'rcarriga/nvim-notify',
  },
  config = function()
    require('noice').setup {
      lsp = {
        override = {
          ['vim.lsp.util.convert_input_to_markdown_lines'] = true,
          ['vim.lsp.util.stylize_markdown'] = true,
          ['cmp.entry.get_documentation'] = true,
        },
      },
      presets = {
        bottom_search = true, -- Use a classic bottom cmdline for search
        command_palette = true, -- Position the cmdline and popupmenu together
        long_message_to_split = true, -- Long messages to split window
        inc_rename = false, -- Enables an input dialog for inc-rename.nvim
        lsp_doc_border = true, -- Add a border to hover docs and signature help
      },
      messages = {
        enabled = true, -- Enable toast notifications
        view = 'notify', -- Default view for messages
        view_error = 'notify', -- View for errors
        view_warn = 'notify', -- View for warnings
      },
      cmdline = {
        enabled = true, -- Enable floating cmdline
        view = 'cmdline_popup', -- Use popup for command input
      },
    }
  end,
}
