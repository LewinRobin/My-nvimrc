-- vim.keymap.set('n', '<C-b>', vim.cmd.Lex)

vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv")
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv")

vim.keymap.set('n', 'J', 'mzJ`z')
vim.keymap.set('n', '<C-d>', '<C-d>zz')
vim.keymap.set('n', '<C-u>', '<C-u>zz')
vim.keymap.set('n', 'n', 'nzzzv')
vim.keymap.set('n', 'N', 'Nzzzv')

vim.keymap.set('x', '<leader>d', [["_d]])
vim.keymap.set({ 'n', 'v' }, '<leader>y', [["+y]])
vim.keymap.set({ 'n', 'v' }, '<leader>p', [["+p]])
vim.keymap.set('n', '<leader>Y', [["+Y]])
vim.keymap.set({ 'n', 'v' }, '<leader>d', [["_d]])

vim.keymap.set('i', '<C-c>', '<Esc>')
vim.keymap.set('n', '<C-c>', '<Esc>')

vim.keymap.set('n', 'Q', '<nop>')
vim.keymap.set('n', '<leader>f', vim.lsp.buf.format)

vim.keymap.set('n', '<leader>e', '<cmd>cnext<CR>zz')
vim.keymap.set('n', '<leader>E', '<cmd>cprev<CR>zz')
vim.keymap.set('n', '<leader>k', '<cmd>lprev<CR>zz')
vim.keymap.set('n', '<leader>j', '<cmd>lnext<CR>zz')

vim.keymap.set('n', '<leader>S', [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gIc<Left><Left><Left><Left>]])
vim.keymap.set('n', '<leader>x', '<cmd>!chmod +x %<CR>', { silent = true })

vim.keymap.set("n", '<C-z>', "u")
vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)

--split screen navigation
vim.keymap.set('n', '<C-j>', '<C-w>j')
vim.keymap.set('n', '<C-k>', '<C-w>k')
vim.keymap.set('n', '<C-q>', '<C-w>q')
-- vim.keymap.set('n', '<leader>h', '<cmd>bPrev<CR>')
-- vim.keymap.set('n', '<leader>l', '<cmd>bNext<CR>')
vim.keymap.set('n', '<leader>=', 'gg=G<C-o>')
vim.keymap.set('n', '<leader>G', vim.cmd.UndotreeToggle)
-- vim.keymap.set('n', '<leader>`v', ':cd %:p:h<CR><C-w>v:term pwsh<CR>iclear<CR><C-\\><C-n>')
-- vim.keymap.set('n', '<leader>`s', ':cd %:p:h<CR><C-w>s:term pwsh<CR><C-\\><C-n><CMD>resize -3<CR><CMD>resize -3<CR><CMD>resize -3<CR>')
vim.keymap.set('n', '<leader>`v', ':cd %:p:h<CR><C-w>v:term<CR>iclear<CR>ci<CR><C-\\><C-n>')
vim.keymap.set('n', '<leader>`s', ':cd %:p:h<CR><C-w>s:term<CR>iclear<CR>ci<CR><C-\\><C-n><CMD>resize -15<CR>')
-- vim.keymap.set('n', '<C-b>', ':Ex<CR>') -- Lewin Robin // since oil is here i have commented this.
vim.opt.colorcolumn = '169'
-- vim.keymap.set('n', '<C-Tab>', ':bNext<CR>')
vim.keymap.set('n', '<C-s>', ':w<CR>')
vim.keymap.set('i', '<C-s>', '<Esc>:w<CR>i')

-- vim.keymap.set('n', '<C-r>r', vim.cmd.CompilerOpen)
-- Resize vertical split windows
vim.keymap.set('n', '<A-h>', '<CMD>vertical resize -5<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<A-l>', '<CMD>vertical resize +5<CR>', { noremap = true, silent = true })

-- Resize horizontal split windows
vim.keymap.set('n', '<A-k>', '<CMD>resize -3<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<A-j>', '<CMD>resize +3<CR>', { noremap = true, silent = true })

-- Change directory
vim.keymap.set('n', '<leader>cd', ':cd %:h<CR>', { desc = '[C]hange [D]irectory' })

-- React keymaps
vim.keymap.set('n', '<leader>fc', ':set formatoptions-=cro<CR>', { desc = 'auto comment off' })
vim.keymap.set('n', '<leader>gcc', 'I{/*<Esc>A*/}<Esc>', { desc = 'React Comment' })
vim.keymap.set('n', '<leader>gcu', 'I<Esc>lxxx$xxx<Esc>', { desc = 'React Uncomment' })
vim.keymap.set('v', '<leader>gcc', 'O<Esc>i{/*<Esc>gvOlll<Esc>a*/}<Esc>', { desc = 'React Comment' })
vim.keymap.set('v', '<leader>gcu', 'O<Esc>lxxxgvO<Esc>xxx<Esc>', { desc = 'React Uncomment' })

-- GDB Keymaps
-- vim.keymap.set(
--   'n',
--   '<leader>gdbv',
--   ':!cd %:h<CR>:!gcc % -g<CR><C-W>v:term<CR>igdb ./a.exe<CR>break main<CR>run<CR>define hook-next<CR>info locals<CR>end<CR>define hook-step<CR>info locals<CR>end<CR>define hook-continue<CR>info locals<CR>end<CR>',
--   { desc = 'gdb sidescreen' }
-- )
vim.keymap.set('n', '<leader>gdbv', '<C-W>v:term<CR>imake gdb<CR>gdb ./a.exe<CR>break main<CR>run<CR>', { desc = 'gdb sidescreen' })
-- vim.keymap.set(
--   'n',
--   '<leader>gdbf',
--   ':!cd %:h<CR>:!gcc % -g<CR>:term<CR>igdb ./a.exe<CR>break 1<CR>run<CR>define hook-next<CR>info locals<CR>end<CR>define hook-step<CR>info locals<CR>end<CR>define hook-continue<CR>info locals<CR>end<CR>',
--   { desc = 'gdb fullscreen' }
-- )
vim.keymap.set('n', '<leader>gdbf', ':term<CR>imake gdb<CR>gdb ./a.exe<CR>break main<CR>run<CR>', { desc = 'gdb fullscreen' })
vim.keymap.set('i', '<leader>gdbf', ':term<CR>imake gdb<CR>gdb ./a.exe<CR>break main<CR>run<CR>', { desc = 'gdb fullscreen' })

-- find and replace
vim.keymap.set('n', '<leader>/', ':%s/', { desc = 'Find and Replace' })
vim.keymap.set('v', '<leader>/', ':s/', { desc = 'Find and Replace' })

-- * key searching
vim.keymap.set('n', '<leader>*', 'yiW/<C-r>0<CR>', { desc = 'Search for entire word underneath cursor' })
vim.keymap.set('v', '<leader>*', 'y/<C-r>0<CR>', { desc = 'Search for entire word underneath selection' })

-- flutter keymaps
vim.keymap.set('n', '<leader>tc', ':Telescope colorscheme<CR>')
vim.keymap.set('n', '<leader>tr', ':lua RemoveBackGround()<CR>')
vim.keymap.set('n', '<leader>fl', ':flutter')
vim.keymap.set('n', '<leader>fr', ':FlutterReload<CR>')

--Gitsigns keymaps
vim.keymap.set('n', '<leader>gs', ':Gitsigns toggle_current_line_blame<CR>', { desc = '[G]it [S]ign Toggle current line blame' })
vim.keymap.set('n', '<leader>to', 'yyp^vt=yIprint("<Esc>A\\n",<Esc>pa)<Esc>', { desc = 'print current line' })
vim.keymap.set('v', '<leader>to', ':s/\\(.*\\)=\\(.*\\)/\\1=\\2\\rprint("\\1=\\2\\\\n",\\1)<CR><Esc>', { desc = 'print selected lines' })
