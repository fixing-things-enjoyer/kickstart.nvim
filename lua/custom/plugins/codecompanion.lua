return {
  'olimorris/codecompanion.nvim',

  -- Load the plugin very lazily to keep startup fast
  event = 'VeryLazy',

  -- Add plugin dependencies
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-treesitter/nvim-treesitter',
  },

  -- Add keymaps for easy access using the new '<leader>a' prefix
  keys = {
    {
      '<leader>ac',
      '<cmd>CodeCompanionChat Toggle<CR>',
      desc = '[A]I [C]hat',
    },
    {
      '<leader>aa',
      '<cmd>CodeCompanionActions<CR>',
      desc = '[A]I [A]ctions',
    },
  },

  opts = {
    adapters = {
      ollama = function()
        return require('codecompanion.adapters').extend('ollama', {
          env = {
            url = os.getenv 'OLLAMA_URL',
          },
          adapter = 'ollama',
          schema = {
            model = {
              default = os.getenv 'OLLAMA_MODEL',
            },
          },
        })
      end,
      gemini = function()
        return require('codecompanion.adapters').extend('gemini', {
          env = {
            api_key = os.getenv 'GEMINI_API_KEY',
          },
          schema = {
            model = {
              default = os.getenv 'GEMINI_MODEL',
            },
          },
        })
      end,
    },
    strategies = {
      chat = {
        adapter = 'ollama',
      },
      inline = {
        adapter = 'ollama',
      },
    },
  },
}
