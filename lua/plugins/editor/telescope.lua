return {
  {
    'nvim-telescope/telescope.nvim',
    branch = '0.1.x',
    dependencies = {
      'nvim-lua/plenary.nvim',
    },
    event = {
      'VeryLazy',
    },
    cmd = {
      'Telescope',
    },
    config = function()
      local map = require('core.keymaps').map
      local builtin = require('telescope.builtin')
      map('n', '<leader>f', builtin.find_files, { desc = 'Find files' })
      map('n', '<leader>g', builtin.live_grep, { desc = 'Live grep' })

      local actions = require('telescope.actions')
      require('telescope').setup({
        defaults = {
          mappings = {
            i = {
              ['<C-U>'] = actions.preview_scrolling_up,
              ['<C-D>'] = actions.preview_scrolling_down,
              ['Esc'] = actions.close,
            }
          },
        },
        layout_config = {
          vertical = {
            preview_cutoff = 100,
            preview_width = 0.5,
          },
        },
      })
    end,
  },
}
