return {
  'echasnovski/mini.comment',
  config = function()
    -- disable default mappings from mini.comment
    require('mini.comment').setup({
      mappings = {
        comment = '',
        comment_line = '',
        comment_visual = '',
      },
    })

    -- Normal: toggle current line
    vim.keymap.set('n', '<leader>/', function()
      require('mini.comment').toggle_lines(vim.fn.line('.'), vim.fn.line('.'))
    end, { desc = 'Toggle comment line' })

    -- Visual / Select: toggle selection (use 'x' mode)
    vim.keymap.set('x', '<leader>/', function()
      local s = vim.fn.line('v')
      local e = vim.fn.line('.')
      if s > e then s, e = e, s end
      require('mini.comment').toggle_lines(s, e)
    end, { desc = 'Toggle comment selection' })
  end,
}
