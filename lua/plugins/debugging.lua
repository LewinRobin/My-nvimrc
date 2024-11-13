return {
  'mfussenegger/nvim-dap',
  config = function()
    local dap = require 'dap'
    vim.keymap.set('n', '<leader>dbb', dap.toggle_breakpoint, {})
    vim.keymap.set('n', '<leader><C-b>', dap.continue, {})
  end,
}
