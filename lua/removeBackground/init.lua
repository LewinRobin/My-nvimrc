-- NOTE remove background
function RemoveBackGround()
  -- Almost all of the nvim
  vim.api.nvim_set_hl(0, 'Normal', { bg = 'none' })
  -- Almost all floating windows in nvim
  vim.api.nvim_set_hl(0, 'NormalFloat', { bg = 'none' }) --hovering information uses these.
  -- line which extends the entire line when a cursor is on it.
  vim.api.nvim_set_hl(0, 'CursorLine', { bg = 'none' })
  -- Line numbers
  vim.api.nvim_set_hl(0, 'LineNr', { bg = 'none' })
  -- Line numbers of the cursor in cursor is on
  vim.api.nvim_set_hl(0, 'CursorLineNr', { bg = 'none', fg = 'yellow' })
  vim.api.nvim_set_hl(0, 'Files', { bg = 'none' })
  --one Split screens i gues
  vim.api.nvim_set_hl(0, 'Splits', { bg = 'none' })
  vim.api.nvim_set_hl(0, 'TelescopeNormal', { bg = 'none' })
  vim.api.nvim_set_hl(0, 'TelescopePreviewNormal', { bg = 'none' })
  vim.api.nvim_set_hl(0, 'SignColumn', { bg = 'none' })

  -- vim.api.nvim_set_hl(0, 'Normal', { bg = 'none' })
  -- vim.api.nvim_set_hl(0, 'Visual', { bg = 'none' })
  -- vim.api.nvim_set_hl(0, 'Directory', { bg = 'none' })
  -- vim.api.nvim_set_hl(0, 'ErrorMsg', { bg = 'none' })
  -- vim.api.nvim_set_hl(0, 'IncSearch', { bg = 'none' })
  -- vim.api.nvim_set_hl(0, 'Search', { bg = 'none' })
  -- vim.api.nvim_set_hl(0, 'StatusLine', { bg = 'none' })
  -- vim.api.nvim_set_hl(0, 'TabLine', { bg = 'none' })
  -- vim.api.nvim_set_hl(0, 'Title', { bg = 'none' })
  -- vim.api.nvim_set_hl(0, 'VertSplit', { bg = 'none' })
  -- vim.api.nvim_set_hl(0, 'WarningMsg', { bg = 'none' })
  -- vim.api.nvim_set_hl(0, 'Comment', { bg = 'none' })
  -- vim.api.nvim_set_hl(0, 'Constant', { bg = 'none' })
  -- vim.api.nvim_set_hl(0, 'Identifier', { bg = 'none' })
  -- vim.api.nvim_set_hl(0, 'Keyword', { bg = 'none' })
  -- vim.api.nvim_set_hl(0, 'Number', { bg = 'none' })
  -- vim.api.nvim_set_hl(0, 'String', { bg = 'none' })
  -- vim.api.nvim_set_hl(0, 'Type', { bg = 'none' })
  -- vim.api.nvim_set_hl(0, 'DiffAdd', { bg = 'none' })
  -- vim.api.nvim_set_hl(0, 'DiffChange', { bg = 'none' })
  -- vim.api.nvim_set_hl(0, 'DiffDelete', { bg = 'none' })
  -- vim.api.nvim_set_hl(0, 'DiffText', { bg = 'none' })
  -- vim.api.nvim_set_hl(0, 'Cursor', { bg = 'none' })
  -- vim.api.nvim_set_hl(0, 'CursorLine', { bg = 'none' })
  -- vim.api.nvim_set_hl(0, 'CursorColumn', { bg = 'none' })
end

RemoveBackGround()
