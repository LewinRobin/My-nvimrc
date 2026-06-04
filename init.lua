--[[
 __       ___________    __    ____  __  .__   __.    .______        ______   .______    __  .__   __.
|  |     |   ____\   \  /  \  /   / |  | |  \ |  |    |   _  \      /  __  \  |   _  \  |  | |  \ |  |
|  |     |  |__   \   \/    \/   /  |  | |   \|  |    |  |_)  |    |  |  |  | |  |_)  | |  | |   \|  |
|  |     |   __|   \            /   |  | |  . `  |    |      /     |  |  |  | |   _  <  |  | |  . `  |
|  `----.|  |____   \    /\    /    |  | |  |\   |    |  |\  \----.|  `--'  | |  |_)  | |  | |  |\   |
|_______||_______|   \__/  \__/     |__| |__| \__|    | _| `._____| \______/  |______/  |__| |__| \__|

=====================================================================
==================== READ THIS BEFORE CONTINUING ====================
=====================================================================
========                                    .-----.          ========
========         .----------------------.   | === |          ========
========         |.-""""""""""""""""""-.|   |-----|          ========
========         ||                    ||   | === |          ========
========         ||   KICKSTART.NVIM   ||   |-----|          ========
========         ||                    ||   | === |          ========
========         ||                    ||   |-----|          ========
========         ||:Tutor              ||   |:::::|          ========
========         |'-..................-'|   |____o|          ========
========         `"")----------------(""`   ___________      ========
========        /::::::::::|  |::::::::::\  \ no mouse \     ========
========       /:::========|  |==hjkl==:::\  \ required \    ========
========      '""""""""""""'  '""""""""""""'  '""""""""""'   ========
========                                                     ========
=====================================================================
=====================================================================

What is Kickstart?

  Kickstart.nvim is *not* a distribution.

  Kickstart.nvim is a starting point for your own configuration.
    The goal is that you can read every line of code, top-to-bottom, understand
   what your configuration is doing, and modify it to suit your needs.

    Once you've done that, you can start exploring, configuring and tinkering to
    make Neovim your own! That might mean leaving kickstart just the way it is for a while
    or immediately breaking it into modular pieces. It's up to you!

    If you don't know anything about Lua, I recommend taking some time to read through
    a guide. One possible example which will only take 10-15 minutes:
      - https://learnxinyminutes.com/docs/lua/

    After understanding a bit more about Lua, you can use `:help lua-guide` as a
    reference for how Neovim integrates Lua.
    - :help lua-guide
    - (or HTML version): https://neovim.io/doc/user/lua-guide.html

Kickstart Guide:

  TODO: The very first thing you should do is to run the command `:Tutor` in Neovim.

    If you don't know what this means, type the following:
      - <escape key>
      - :
      - Tutor
      - <enter key>

    (If you already know how the Neovim basics, you can skip this step)

  Once you've completed that, you can continue working through **AND READING** the rest
  of the kickstart init.lua

  Next, run AND READ `:help`.
    This will open up a help window with some basic information
    about reading, navigating and searching the builtin help documentation.

    This should be the first place you go to look when you're stuck or confused
    with something. It's one of my favorite neovim features.

    MOST IMPORTANTLY, we provide a keymap "<space>sh" to [s]earch the [h]elp documentation,
    which is very useful when you're not sure exactly what you're looking for.

  I have left several `:help X` comments throughout the init.lua
    These are hints about where to find more information about the relevant settings,
    plugins or neovim features used in kickstart.

   NOTE: Look for lines like this

    Throughout the file. These are for you, the reader, to help understand what is happening.
    Feel free to delete them once you know what you're doing, but they should serve as a guide
    for when you are first encountering a few different constructs in your nvim config.

If you experience any errors while trying to install kickstart, run `:checkhealth` for more info

I hope you enjoy your Neovim journey,
- TJ

P.S. You can delete this when you're done too. It's your config now! :)
--]]

-- Set <space> as the leader key
-- See `:help mapleader`
--  NOTE: Must hapeen before plugins are loaded (otherwise wrong leader will be used)
-- vim.g.mapleader = ' '
-- vim.g.maplocalleader = ' '

-- Set to true if you have a Nerd Font installed
vim.g.have_nerd_font = true

-- [[ Setting options ]]
-- See `:help vim.opt`
-- NOTE: You can change these options as you wish!
--  For more options, you can see `:help option-list`

-- Make line numbers default
vim.opt.number = true
vim.opt.relativenumber = true
-- You can also add relative line numbers, for help with jumping.
--  Experiment for yourself to see if you like it!
-- vim.opt.relativenumber = true

-- Enable mouse mode, can be useful for resizing splits for example!
vim.opt.mouse = 'a'

-- Don't show the mode, since it's already in status line
vim.opt.showmode = false

-- Sync clipboard between OS and Neovim.
--  Remove this option if you want your OS clipboard to remain independent.
--  See `:help 'clipboard'`
vim.opt.clipboard = 'unnamedplus'

-- Enable break indent
vim.opt.breakindent = true

-- Save undo history
vim.opt.undofile = true

-- Case-insensitive searching UNLESS \C or capital in search
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Keep signcolumn on by default
vim.opt.signcolumn = 'yes'

-- Decrease update time
vim.opt.updatetime = 250
vim.opt.timeoutlen = 300

-- Configure how new splits should be opened
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Sets how neovim will display certain whitespace in the editor.
--  See `:help 'list'`
--  and `:help 'listchars'`
vim.opt.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

-- Preview substitutions live, as you type!
vim.opt.inccommand = 'split'

-- Show which line your cursor is on
vim.opt.cursorline = true

-- Minimal number of screen lines to keep above and below the cursor.
vim.opt.scrolloff = 40

-- [[ Basic Keymaps ]]
--  See `:help vim.keymap.set()`

-- Set highlight on search, but clear on pressing <Esc> in normal mode
vim.opt.hlsearch = true
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Diagnostic keymaps
vim.keymap.set('n', '<leader>E', vim.diagnostic.goto_prev, { desc = 'Go to previous [D]iagnostic message' })
vim.keymap.set('n', '<leader>e', vim.diagnostic.goto_next, { desc = 'Go to next [D]iagnostic message' })
vim.keymap.set('n', '<leader>z', vim.diagnostic.open_float, { desc = 'Show diagnostic [E]rror messages' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set('t', '<C-c>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })
-- vim.keymap.set('t', '<Esc><Esc>', '<Esc>', { desc = 'Exit terminal mode' })

-- TIP: Disable arrow keys in normal mode
vim.keymap.set('n', '<left>', '<cmd>echo "Use h to move!!"<CR>')
vim.keymap.set('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
vim.keymap.set('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
vim.keymap.set('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--
--  See `:help wincmd` for a list of all window commands
-- vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
-- vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
-- vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
-- vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- [[ Basic Autocommands ]]
--  See `:help lua-guide-autocommands`

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

--settings for csv.vim  to work
vim.cmd [[
  filetype plugin on
  :let g:csv_delim=','
]]

local function repeatable_map(mode, lhs, rhs, opts)
  opts = opts or {}

  -- Only handle Normal mode for dot-repeat
  if mode == 'n' then
    local original_rhs = rhs
    rhs = function()
      -- 1. Execute the actual logic
      if type(original_rhs) == 'string' then
        -- Handle string commands
        vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(original_rhs, true, true, true), 'n', false)
      else
        -- Handle Lua functions (like dap.continue)
        original_rhs()
      end

      -- 2. Register with vim-repeat
      vim.fn['repeat#set'](vim.api.nvim_replace_termcodes(lhs, true, true, true), vim.v.count)
    end
  end

  vim.keymap.set(mode, lhs, rhs, opts)
end

-- [[ Install `lazy.nvim` plugin manager ]]
--    See `:help lazy.nvim.txt` or https://github.com/folke/lazy.nvim for more info
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
end ---@diagnostic disable-next-line: undefined-field
vim.opt.rtp:prepend(lazypath)

-- [[ Configure and install plugins ]]
--
--  To check the current status of your plugins, run
--    :Lazy
--
--  You can press `?` in this menu for help. Use `:q` to close the window
--
--  To update plugins, you can run
--    :Lazy update
--
-- NOTE: Here is where you install your plugins.
require('lazy').setup({
  'tpope/vim-repeat',
  -- NOTE: Plugins can be added with a link (or for a github repo: 'owner/repo' link).
  'tpope/vim-sleuth', -- Detect tabstop and shiftwidth automatically
  'ThePrimeagen/vim-be-good',
  -- 'dccsillag/magma-nvim',
  -- 'luk400/vim-jukit',
  -- 'tpope/vim-surround',
  'mbbill/undotree',
  -- 'nvim-treesitter/playground',
  'tpope/vim-fugitive',
  'ThePrimeagen/harpoon',
  -- 'chrisbra/csv.vim',
  'stevearc/oil.nvim',
  -- 'walcht/neovim-unity',
  -- 'nvim-java',
  -- 'norcalli/nvim-colorizer.lua',
  -- 'mg979/vim-visual-multi',
  {
    'mfussenegger/nvim-dap',
    dependencies = {
      -- UI for DAP (variables, scopes, watches, call stack, console)
      {
        'rcarriga/nvim-dap-ui',
        dependencies = { 'nvim-neotest/nvim-nio' },
        config = function()
          local dap, dapui = require 'dap', require 'dapui'

          dapui.setup {
            icons = { expanded = '▾', collapsed = '▸', current_frame = '▸' },
            mappings = {
              expand = { '<CR>', '<2-LeftMouse>' },
              open = 'o',
              remove = 'd',
              edit = 'e',
              repl = 'r',
              toggle = 't',
            },
            layouts = {
              {
                elements = {
                  { id = 'scopes', size = 0.35 },
                  { id = 'breakpoints', size = 0.15 },
                  { id = 'stacks', size = 0.30 },
                  { id = 'watches', size = 0.20 },
                },
                size = 45,
                position = 'left',
              },
              {
                elements = {
                  { id = 'repl', size = 0.5 },
                  { id = 'console', size = 0.5 },
                },
                size = 12,
                position = 'bottom',
              },
            },
            controls = {
              enabled = true,
              element = 'repl',
              icons = {
                pause = '',
                play = '',
                step_into = '',
                step_over = '',
                step_out = '',
                step_back = '',
                run_last = '↺',
                terminate = '',
                disconnect = '',
              },
            },
            floating = {
              max_height = 0.9,
              max_width = 0.5,
              border = 'rounded',
              mappings = { close = { 'q', '<Esc>' } },
            },
            render = {
              max_type_length = nil,
              max_value_lines = 100,
            },
          }

          -- Auto-open/close UI on session start/end
          dap.listeners.after.event_initialized['dapui_config'] = function()
            dapui.open()
          end
          dap.listeners.before.event_terminated['dapui_config'] = function()
            dapui.close()
          end
          dap.listeners.before.event_exited['dapui_config'] = function()
            dapui.close()
          end
        end,
      },

      -- Inline virtual text (variable values next to code while paused)
      {
        'theHamsta/nvim-dap-virtual-text',
        config = function()
          require('nvim-dap-virtual-text').setup {
            enabled = true,
            enabled_commands = true,
            highlight_changed_variables = true,
            highlight_new_as_changed = false,
            show_stop_reason = true,
            commented = false,
            only_first_definition = true,
            all_references = false,
            filter_references_pattern = '<module',
            virt_text_pos = 'eol', -- inline after the line
            all_frames = false,
            virt_lines = false,
            virt_text_win_col = nil,
          }
        end,
      },

      -- Auto-install DAP adapters via Mason
      {
        'jay-babu/mason-nvim-dap.nvim',
        dependencies = { 'williamboman/mason.nvim' },
        config = function()
          require('mason-nvim-dap').setup {
            -- Adapters Mason will auto-install on first use
            ensure_installed = {
              'codelldb', -- C, C++, Rust
              'debugpy', -- Python
              'js-debug-adapter', -- JS, TS, Node
              'delve', -- Go
            },
            automatic_installation = true,
            handlers = {}, -- use defaults — overridden per-lang below
          }
        end,
      },

      -- Language-specific: Python
      {
        'mfussenegger/nvim-dap-python',
        ft = 'python',
        config = function()
          local mason_path = vim.fn.stdpath 'data' .. '/mason/packages/debugpy/venv/bin/python'
          require('dap-python').setup(mason_path)
          require('dap-python').test_runner = 'pytest'
        end,
      },

      -- Language-specific: Go
      {
        'leoluz/nvim-dap-go',
        ft = 'go',
        config = function()
          require('dap-go').setup {
            dap_configurations = {
              {
                type = 'go',
                name = 'Attach remote',
                mode = 'remote',
                request = 'attach',
              },
            },
            delve = {
              path = 'dlv',
              initialize_timeout_sec = 20,
              port = '${port}',
              args = {},
              build_flags = '',
            },
          }
        end,
      },

      -- Telescope integration: browse/toggle breakpoints
      { 'nvim-telescope/telescope-dap.nvim' },

      -- Persistent breakpoints across sessions
      {
        'Weissle/persistent-breakpoints.nvim',
        config = function()
          require('persistent-breakpoints').setup {
            save_dir = vim.fn.stdpath 'data' .. '/nvim_checkpoints',
            load_breakpoints_event = { 'BufReadPost' },
            perf_record = false,
          }
        end,
      },
    },

    config = function()
      local dap = require 'dap'
      local dapui = require 'dapui'
      local pb = require 'persistent-breakpoints.api'

      -- ── Signs ────────────────────────────────────────────────────────────
      vim.fn.sign_define('DapBreakpoint', { text = '●', texthl = 'DiagnosticError', linehl = '', numhl = '' })
      vim.fn.sign_define('DapBreakpointCondition', { text = '◉', texthl = 'DiagnosticWarn', linehl = '', numhl = '' })
      vim.fn.sign_define('DapLogPoint', { text = '◎', texthl = 'DiagnosticInfo', linehl = '', numhl = '' })
      vim.fn.sign_define('DapStopped', { text = '▶', texthl = 'DiagnosticOk', linehl = 'DiffAdd', numhl = '' })
      vim.fn.sign_define('DapBreakpointRejected', { text = '✗', texthl = 'DiagnosticError', linehl = '', numhl = '' })

      -- ── C / C++ / Rust via codelldb ───────────────────────────────────────
      local codelldb_path = vim.fn.stdpath 'data' .. '/mason/packages/codelldb/extension/adapter/codelldb'
      local liblldb_path = vim.fn.stdpath 'data' .. '/mason/packages/codelldb/extension/lldb/lib/liblldb.so'

      dap.adapters.codelldb = {
        type = 'server',
        port = '${port}',
        executable = {
          command = codelldb_path,
          args = { '--port', '${port}' },
        },
      }

      for _, lang in ipairs { 'c', 'cpp', 'rust' } do
        dap.configurations[lang] = {
          {
            name = 'Launch file',
            type = 'codelldb',
            request = 'launch',
            program = function()
              return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
            end,
            cwd = '${workspaceFolder}',
            stopOnEntry = false,
            args = {},
          },
          {
            name = 'Attach to process',
            type = 'codelldb',
            request = 'attach',
            pid = require('dap.utils').pick_process,
            args = {},
          },
        }
      end

      -- ── JavaScript / TypeScript / Node ───────────────────────────────────
      local js_adapter_path = vim.fn.stdpath 'data' .. '/mason/packages/js-debug-adapter/js-debug/src/dapDebugServer.js'

      for _, adapter in ipairs { 'pwa-node', 'pwa-chrome', 'pwa-msedge', 'node-terminal', 'pwa-extensionHost' } do
        dap.adapters[adapter] = {
          type = 'server',
          host = 'localhost',
          port = '${port}',
          executable = {
            command = 'node',
            args = { js_adapter_path, '${port}' },
          },
        }
      end

      for _, lang in ipairs { 'javascript', 'typescript', 'typescriptreact', 'javascriptreact' } do
        dap.configurations[lang] = {
          {
            type = 'pwa-node',
            request = 'launch',
            name = 'Launch Node file',
            program = '${file}',
            cwd = '${workspaceFolder}',
            sourceMaps = true,
          },
          {
            type = 'pwa-node',
            request = 'attach',
            name = 'Attach to Node process',
            processId = require('dap.utils').pick_process,
            cwd = '${workspaceFolder}',
            sourceMaps = true,
          },
          {
            type = 'pwa-chrome',
            request = 'launch',
            name = 'Launch Chrome (localhost:3000)',
            url = 'http://localhost:3000',
            webRoot = '${workspaceFolder}',
            userDataDir = false,
          },
        }
      end

      -- Session control (mnemonic: c=continue, q=quit, r=restart, x=run-to-cursor)
      vim.keymap.set('n', '<leader>Dc', dap.continue, { desc = 'DAP: Continue / Start' })
      vim.keymap.set('n', '<leader>Dq', dap.terminate, { desc = 'DAP: Stop session' })
      vim.keymap.set('n', '<leader>Dr', dap.restart, { desc = 'DAP: Restart session' })
      vim.keymap.set('n', '<leader>Dx', dap.run_to_cursor, { desc = 'DAP: Run to cursor' })

      -- Step control (mnemonic: n=next/over, i=into, o=out)
      repeatable_map('n', '<leader>Dn', dap.step_over, { desc = 'DAP: Step over' })
      repeatable_map('n', '<leader>Di', dap.step_into, { desc = 'DAP: Step into' })
      repeatable_map('n', '<leader>Do', dap.step_out, { desc = 'DAP: Step out' })

      -- Breakpoints (persistent — survive nvim restarts)
      repeatable_map('n', '<leader>Db', pb.toggle_breakpoint, { desc = 'DAP: Toggle breakpoint' })
      vim.keymap.set('n', '<leader>DB', function()
        pb.set_conditional_breakpoint(vim.fn.input 'Condition: ')
      end, { desc = 'DAP: Conditional breakpoint' })
      vim.keymap.set('n', '<leader>Dl', function()
        dap.set_breakpoint(nil, nil, vim.fn.input 'Log message: ')
      end, { desc = 'DAP: Log point' })
      vim.keymap.set('n', '<leader>DX', pb.clear_all_breakpoints, { desc = 'DAP: Clear all breakpoints' })

      -- UI / inspect
      vim.keymap.set('n', '<leader>Du', dapui.toggle, { desc = 'DAP: Toggle UI' })
      vim.keymap.set('n', '<leader>De', dapui.eval, { desc = 'DAP: Eval expression' })
      vim.keymap.set('v', '<leader>De', dapui.eval, { desc = 'DAP: Eval selection' })
      vim.keymap.set('n', '<leader>Dw', require('dap.ui.widgets').hover, { desc = 'DAP: Hover widget' })
      vim.keymap.set('n', '<leader>Dv', function()
        local widgets = require 'dap.ui.widgets'
        widgets.centered_float(widgets.scopes)
      end, { desc = 'DAP: Float scopes' })
      vim.keymap.set('n', '<leader>DR', dap.repl.open, { desc = 'DAP: Open REPL' })

      -- Telescope DAP pickers
      vim.keymap.set('n', '<leader>Dtb', function()
        require('telescope').extensions.dap.list_breakpoints()
      end, { desc = 'DAP: Telescope breakpoints' })
      vim.keymap.set('n', '<leader>Dtf', function()
        require('telescope').extensions.dap.frames()
      end, { desc = 'DAP: Telescope frames' })
      vim.keymap.set('n', '<leader>Dtv', function()
        require('telescope').extensions.dap.variables()
      end, { desc = 'DAP: Telescope variables' })
      vim.keymap.set('n', '<leader>Dtc', function()
        require('telescope').extensions.dap.commands()
      end, { desc = 'DAP: Telescope commands' })

      -- Load telescope-dap extension
      pcall(function()
        require('telescope').load_extension 'dap'
      end)
    end,
  },
  {
    'akinsho/flutter-tools.nvim',
    lazy = false,
    dependencies = {
      'nvim-lua/plenary.nvim',
      'stevearc/dressing.nvim', -- optional for vim.ui.select
    },
    config = true,
  },

  -- NOTE: Plugins can also be added by using a table,
  -- with the first argument being the link and the following
  -- keys can be used to configure plugin behavior/loading/etc.
  --
  -- Use `opts = {}` to force a plugin to be loaded.
  --
  --  This is equivalent to:
  --    require('Comment').setup({})

  -- "gc" to comment visual regions/lines
  {
    'numToStr/Comment.nvim',
    opts = {
      mappings = {
        extra = true,
        basic = true,
      },
    },
  },

  -- Here is a more advanced example where we pass configuration
  -- options to `gitsigns.nvim`. This is equivalent to the following lua:
  --    require('gitsigns').setup({ ... })
  --
  -- See `:help gitsigns` to understand what the configuration keys do
  { -- Adds git related signs to the gutter, as well as utilities for managing changes
    'lewis6991/gitsigns.nvim',
    opts = {
      signs = {
        add = { text = '+' },
        change = { text = '~' },
        delete = { text = '_' },
        topdelete = { text = '‾' },
        changedelete = { text = '~' },
        untracked = { text = 'U' },
      },
    },
  },

  -- NOTE: Plugins can also be configured to run lua code when they are loaded.
  --
  -- This is often very useful to both group configuration, as well as handle
  -- lazy loading plugins that don't need to be loaded immediately at startup.
  --
  -- For example, in the following configuration, we use:
  --  event = 'VimEnter'
  --
  -- which loads which-key before all the UI elements are loaded. Events can be
  -- normal autocommands events (`:help autocmd-events`).
  --
  -- Then, because we use the `config` key, the configuration only runs
  -- after the plugin has been loaded:
  --  config = function() ... end

  { -- Useful plugin to show you pending keybinds. -- Edited by Lewin Robin
    'folke/which-key.nvim',
    event = 'VimEnter', -- Sets the loading event to 'VimEnter'
    -- config = function() -- This is the function that runs, AFTER loading
    --   require('which-key').setup()
    --
    --   -- Document existing key chains
    --   require('which-key').register {
    --     ['<leader>c'] = { name = '[C]ode', _ = 'which_key_ignore' },
    --     ['<leader>d'] = { name = '[D]ocument', _ = 'which_key_ignore' },
    --     ['<leader>r'] = { name = '[R]ename', _ = 'which_key_ignore' },
    --     ['<leader>s'] = { name = '[S]earch', _ = 'which_key_ignore' },
    --     ['<leader>w'] = { name = '[W]orkspace', _ = 'which_key_ignore' },
    --   }
    -- end,
  },

  -- NOTE: Plugins can specify dependencies.
  --
  -- The dependencies are proper plugin specifications as well - anything
  -- you do for a plugin at the top level, you can do for a dependency.
  --
  -- Use the `dependencies` key to specify the dependencies of a particular plugin

  { -- Fuzzy Finder (files, lsp, etc)
    'nvim-telescope/telescope.nvim',
    event = 'VimEnter',
    branch = '0.1.x',
    dependencies = {
      'nvim-lua/plenary.nvim',
      { -- If encountering errors, see telescope-fzf-native README for install instructions
        'nvim-telescope/telescope-fzf-native.nvim',

        -- `build` is used to run some command when the plugin is installed/updated.
        -- This is only run then, not every time Neovim starts up.
        build = 'make',

        -- `cond` is a condition used to determine whether this plugin should be
        -- installed and loaded.
        cond = function()
          return vim.fn.executable 'make' == 1
        end,
      },
      { 'nvim-telescope/telescope-ui-select.nvim' },

      -- Useful for getting pretty icons, but requires a Nerd Font.
      { 'nvim-tree/nvim-web-devicons', enabled = vim.g.have_nerd_font },
    },
    config = function()
      -- Telescope is a fuzzy finder that comes with a lot of different things that
      -- it can fuzzy find! It's more than just a "file finder", it can search
      -- many different aspects of Neovim, your workspace, LSP, and more!
      --
      -- The easiest way to use telescope, is to start by doing something like:
      --  :Telescope help_tags
      --
      -- After running this command, a window will open up and you're able to
      -- type in the prompt window. You'll see a list of help_tags options and
      -- a corresponding preview of the help.
      --
      -- Two important keymaps to use while in telescope are:
      --  - Insert mode: <c-/>
      --  - Normal mode: ?
      --
      -- This opens a window that shows you all of the keymaps for the current
      -- telescope picker. This is really useful to discover what Telescope can
      -- do as well as how to actually do it!

      -- [[ Configure Telescope ]]
      -- See `:help telescope` and `:help telescope.setup()`
      require('telescope').setup {
        -- You can put your default mappings / updates / etc. in here
        --  All the info you're looking for is in `:help telescope.setup()`
        --
        -- defaults = {
        --   mappings = {
        --     i = { ['<c-enter>'] = 'to_fuzzy_refine' },
        --   },
        -- },
        -- pickers = {}
        extensions = {
          ['ui-select'] = {
            require('telescope.themes').get_dropdown(),
          },
        },
      }

      -- Enable telescope extensions, if they are installed
      pcall(require('telescope').load_extension, 'fzf')
      pcall(require('telescope').load_extension, 'ui-select')

      -- See `:help telescope.builtin`
      local builtin = require 'telescope.builtin'
      vim.keymap.set('n', '<leader>sh', builtin.help_tags, { desc = '[S]earch [H]elp' })
      vim.keymap.set('n', '<leader>sk', builtin.keymaps, { desc = '[S]earch [K]eymaps' })
      -- vim.keymap.set('n', '<C-P>', builtin.find_files, { desc = '[S]earch [F]iles' }) -- This is as per vscode keybind
      vim.keymap.set('n', '<leader>sf', builtin.find_files, { desc = '[S]earch [F]iles' })
      vim.keymap.set('n', '<leader>ss', builtin.builtin, { desc = '[S]earch [S]elect Telescope' })
      vim.keymap.set('n', '<leader>sw', builtin.grep_string, { desc = '[S]earch current [W]ord' })
      vim.keymap.set('n', '<leader>sg', builtin.live_grep, { desc = '[S]earch by [G]rep' })
      -- vim.keymap.set('n', '<C-f>', builtin.live_grep, { desc = '[S]earch by [G]rep' })
      vim.keymap.set('n', '<leader>sd', builtin.diagnostics, { desc = '[S]earch [D]iagnostics' })
      vim.keymap.set('n', '<leader>sr', builtin.resume, { desc = '[S]earch [R]esume' })
      vim.keymap.set('n', '<leader>s.', builtin.oldfiles, { desc = '[S]earch Recent Files ("." for repeat)' })
      vim.keymap.set('n', '<leader><leader>', builtin.buffers, { desc = '[ ] Find existing buffers' })
      vim.keymap.set('n', '<leader>scl', builtin.colorscheme, { desc = '[S]earch [C]o[l]orscheme' })
      vim.keymap.set('n', '<leader>scm', builtin.git_commits, { desc = '[S]earch [C]o[M]mit' })
      vim.keymap.set('n', '<leader>sbr', builtin.git_branches, { desc = '[S]earch [B][R]anch' })

      -- Slightly advanced example of overriding default behavior and theme
      vim.keymap.set('n', '<leader>/', function()
        -- You can pass additional configuration to telescope to change theme, layout, etc.
        builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
          winblend = 10,
          previewer = false,
        })
      end, { desc = '[/] Fuzzily search in current buffer' })

      -- Also possible to pass additional configuration options.
      --  See `:help telescope.builtin.live_grep()` for information about particular keys
      vim.keymap.set('n', '<leader>s/', function()
        builtin.live_grep {
          grep_open_files = true,
          prompt_title = 'Live Grep in Open Files',
        }
      end, { desc = '[S]earch [/] in Open Files' })

      -- Shortcut for searching your neovim configuration files
      vim.keymap.set('n', '<leader>sn', function()
        builtin.find_files { cwd = vim.fn.stdpath 'config' }
      end, { desc = '[S]earch [N]eovim files' })
    end,
  },

  { -- LSP Configuration & Plugins
    'neovim/nvim-lspconfig',
    dependencies = {
      -- Automatically install LSPs and related tools to stdpath for neovim
      'williamboman/mason.nvim',
      'williamboman/mason-lspconfig.nvim',
      'WhoIsSethDaniel/mason-tool-installer.nvim',

      -- Useful status updates for LSP.
      -- NOTE: `opts = {}` is the same as calling `require('fidget').setup({})`
      { 'j-hui/fidget.nvim', opts = {} },
    },
    config = function()
      -- Brief Aside: **What is LSP?**
      --
      -- LSP is an acronym you've probably heard, but might not understand what it is.
      --
      -- LSP stands for Language Server Protocol. It's a protocol that helps editors
      -- and language tooling communicate in a standardized fashion.
      --
      -- In general, you have a "server" which is some tool built to understand a particular
      -- language (such as `gopls`, `lua_ls`, `rust_analyzer`, etc). These Language Servers
      -- (sometimes called LSP servers, but that's kind of like ATM Machine) are standalone
      -- processes that communicate with some "client" - in this case, Neovim!
      --
      -- LSP provides Neovim with features like:
      --  - Go to definition
      --  - Find references
      --  - Autocompletion
      --  - Symbol Search
      --  - and more!
      --
      -- Thus, Language Servers are external tools that must be installed separately from
      -- Neovim. This is where `mason` and related plugins come into play.
      --
      -- If you're wondering about lsp vs treesitter, you can check out the wonderfully
      -- and elegantly composed help section, `:help lsp-vs-treesitter`

      --  This function gets run when an LSP attaches to a particular buffer.
      --    That is to say, every time a new file is opened that is associated with
      --    an lsp (for example, opening `main.rs` is associated with `rust_analyzer`) this
      --    function will be executed to configure the current buffer
      vim.api.nvim_create_autocmd('LspAttach', {
        group = vim.api.nvim_create_augroup('kickstart-lsp-attach', { clear = true }),
        callback = function(event)
          -- NOTE: Remember that lua is a real programming language, and as such it is possible
          -- to define small helper and utility functions so you don't have to repeat yourself
          -- many times.
          --
          -- In this case, we create a function that lets us more easily define mappings specific
          -- for LSP related items. It sets the mode, buffer and description for us each time.
          local map = function(keys, func, desc)
            vim.keymap.set('n', keys, func, { buffer = event.buf, desc = 'LSP: ' .. desc })
          end

          -- Jump to the definition of the word under your cursor.
          --  This is where a variable was first declared, or where a function is defined, etc.
          --  To jump back, press <C-T>.
          map('gd', require('telescope.builtin').lsp_definitions, '[G]oto [D]efinition')

          -- Find references for the word under your cursor.
          map('gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')

          -- Jump to the implementation of the word under your cursor.
          --  Useful when your language has ways of declaring types without an actual implementation.
          map('gI', require('telescope.builtin').lsp_implementations, '[G]oto [I]mplementation')

          -- Jump to the type of the word under your cursor.
          --  Useful when you're not sure what type a variable is and you want to see
          --  the definition of its *type*, not where it was *defined*.
          map('<leader>D', require('telescope.builtin').lsp_type_definitions, 'Type [D]efinition')

          -- Fuzzy find all the symbols in your current document.
          --  Symbols are things like variables, functions, types, etc.
          map('<leader>ds', require('telescope.builtin').lsp_document_symbols, '[D]ocument [S]ymbols')

          -- Fuzzy find all the symbols in your current workspace
          --  Similar to document symbols, except searches over your whole project.
          map('<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')

          -- Rename the variable under your cursor
          --  Most Language Servers support renaming across files, etc.
          map('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')

          -- Execute a code action, usually your cursor needs to be on top of an error
          -- or a suggestion from your LSP for this to activate.
          map('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')
          -- map('<C-.>', vim.lsp.buf.code_action, '[C]ode [A]ction') -- This is not working as it is overridded by the last action which is bypressing cotrol and .
          -- simultainously..

          -- Opens a popup that displays documentation about the word under your cursor
          --  See `:help K` for why this keymap
          map('gh', vim.lsp.buf.hover, 'Hover Documentation')

          -- WARN: This is not Goto Definition, this is Goto Declaration.
          --  For example, in C this would take you to the header
          map('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')

          -- The following two autocommands are used to highlight references of the
          -- word under your cursor when your cursor rests there for a little while.
          --    See `:help CursorHold` for information about when this is executed
          --
          -- When you move your cursor, the highlights will be cleared (the second autocommand).
          local client = vim.lsp.get_client_by_id(event.data.client_id)
          -- if client and client.server_capabilities.documentHighlightProvider then
          --   vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
          --     buffer = event.buf,
          --     callback = vim.lsp.buf.document_highlight,
          --   })
          --
          --   vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI' }, {
          --     buffer = event.buf,
          --     callback = vim.lsp.buf.clear_references,
          --   })
          -- end
        end,
      })

      -- LSP servers and clients are able to communicate to each other what features they support.
      --  By default, Neovim doesn't support everything that is in the LSP Specification.
      --  When you add nvim-cmp, luasnip, etc. Neovim now has *more* capabilities.
      --  So, we create new capabilities with nvim cmp, and then broadcast that to the servers.
      local capabilities = vim.lsp.protocol.make_client_capabilities()
      capabilities = vim.tbl_deep_extend('force', capabilities, require('cmp_nvim_lsp').default_capabilities())

      -- Enable the following language servers
      --  Feel free to add/remove any LSPs that you want here. They will automatically be installed.
      --
      --  Add any additional override configuration in the following tables. Available keys are:
      --  - cmd (table): Override the default command used to start the server
      --  - filetypes (table): Override the default list of associated filetypes for the server
      --  - capabilities (table): Override fields in capabilities. Can be used to disable certain LSP features.
      --  - settings (table): Override the default settings passed when initializing the server.
      --        For example, to see the options for `lua_ls`, you could go to: https://luals.github.io/wiki/settings/
      local servers = {
        -- clangd = {},
        rust_analyzer = {
          capabilities = capabilities,
          cmd = {
            'rustup',
            'run',
            'stable',
            'rust-analyzer',
          },
        },
        -- ... etc. See `:help lspconfig-all` for a list of all the pre-configured LSPs
        --
        -- Some languages (like typescript) have entire language plugins that can be useful:
        --    https://github.com/pmizio/typescript-tools.nvim
        --
        -- But for many setups, the LSP (`tsserver`) will work just fine
        -- tsserver = {},
        --

        lua_ls = {
          -- cmd = {...},
          -- filetypes { ...},
          -- capabilities = {},
          settings = {
            Lua = {
              runtime = { version = 'LuaJIT' },
              workspace = {
                checkThirdParty = false,
                -- Tells lua_ls where to find all the Lua files that you have loaded
                -- for your neovim configuration.
                library = {
                  '${3rd}/luv/library',
                  unpack(vim.api.nvim_get_runtime_file('', true)),
                },
                -- If lua_ls is really slow on your computer, you can try this instead:
                -- library = { vim.env.VIMRUNTIME },
              },
              completion = {
                callSnippet = 'Replace',
              },
              -- You can toggle below to ignore Lua_LS's noisy `missing-fields` warnings
              -- diagnostics = { disable = { 'missing-fields' } },
            },
          },
        },
      }

      -- Ensure the servers and tools above are installed
      --  To check the current status of installed tools and/or manually install
      --  other tools, you can run
      --    :Mason
      --
      --  You can press `g?` for help in this menu
      require('mason').setup()

      -- You can add other tools here that you want Mason to install
      -- for you, so that they are available from within Neovim.
      local ensure_installed = vim.tbl_keys(servers or {})
      vim.list_extend(ensure_installed, {
        'stylua', -- Used to format lua code
      })
      require('mason-tool-installer').setup { ensure_installed = ensure_installed }

      require('mason-lspconfig').setup {
        handlers = {
          function(server_name)
            local server = servers[server_name] or {}
            -- This handles overriding only values explicitly passed
            -- by the server configuration above. Useful when disabling
            -- certain features of an LSP (for example, turning off formatting for tsserver)
            server.capabilities = vim.tbl_deep_extend('force', {}, capabilities, server.capabilities or {})
            require('lspconfig')[server_name].setup(server)
          end,
        },
      }
    end,
  },

  { -- Autoformat
    'stevearc/conform.nvim',
    opts = {
      notify_on_error = false,
      format_on_save = {
        timeout_ms = 500,
        lsp_fallback = true,
      },
      formatters_by_ft = {
        lua = { 'stylua' },
        -- Conform can also run multiple formatters sequentially
        -- python = { "isort", "black" },
        --
        -- You can use a sub-list to tell conform to run *until* a formatter
        -- is found.
        -- javascript = { { "prettierd", "prettier" } },
      },
    },
  },

  { -- Autocompletion
    'hrsh7th/nvim-cmp',
    event = 'InsertEnter',
    dependencies = {
      -- Snippet Engine & its associated nvim-cmp source
      {
        'L3MON4D3/LuaSnip',
        build = (function()
          -- Build Step is needed for regex support in snippets
          -- This step is not supported in many windows environments
          -- Remove the below condition to re-enable on windows
          if vim.fn.has 'win32' == 1 or vim.fn.executable 'make' == 0 then
            return
          end
          return 'make install_jsregexp'
        end)(),
      },
      'saadparwaiz1/cmp_luasnip',

      -- Adds other completion capabilities.
      --  nvim-cmp does not ship with all sources by default. They are split
      --  into multiple repos for maintenance purposes.
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-path',

      -- If you want to add a bunch of pre-configured snippets,
      --    you can use this plugin to help you. It even has snippets
      --    for various frameworks/libraries/etc. but you will have to
      --    set up the ones that are useful for you.
      -- 'rafamadriz/friendly-snippets',
    },
    config = function()
      -- See `:help cmp`
      local cmp = require 'cmp'
      local luasnip = require 'luasnip'
      luasnip.config.setup {}

      cmp.setup {
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
        },
        completion = { completeopt = 'menu,menuone,noinsert' },

        -- For an understanding of why these mappings were
        -- chosen, you will need to read `:help ins-completion`
        --
        -- No, but seriously. Please read `:help ins-completion`, it is really good!
        mapping = cmp.mapping.preset.insert {
          -- Select the [n]ext item
          ['<C-n>'] = cmp.mapping.select_next_item(),
          -- Select the [p]revious item
          ['<C-p>'] = cmp.mapping.select_prev_item(),

          -- Accept ([y]es) the completion.
          --  This will auto-import if your LSP supports it.
          --  This will expand snippets if the LSP sent a snippet.
          ['<tab>'] = cmp.mapping.confirm { select = true },
          ['<C-y>'] = cmp.mapping(function(fallback)
            fallback() -- This passes the keypress directly to Copilot/Codeium ghost text
          end, { 'i', 's' }),

          -- Manually trigger a completion from nvim-cmp.
          --  Generally you don't need this, because nvim-cmp will display
          --  completions whenever it has completion options available.

          -- ['<C-Space>'] = cmp.mapping.complete {}, -- commented by Lewin Robin as these keybinds don't work in insert mode.

          -- Think of <c-l> as moving to the right of your snippet expansion.
          --  So if you have a snippet that's like:
          --  function $name($args)
          --    $body
          --  end
          --
          -- <c-l> will move you to the right of each of the expansion locations.
          -- <c-h> is similar, except moving you backwards.

          -- ['<C-l>'] = cmp.mapping(function() -- commented by Lewin as these keybinds don't work in insert mode.
          --   if luasnip.expand_or_locally_jumpable() then
          --     luasnip.expand_or_jump()
          --   end
          -- end, { 'i', 's' }),
          -- ['<C-h>'] = cmp.mapping(function()
          --   if luasnip.locally_jumpable(-1) then
          --     luasnip.jump(-1)
          --   end
          -- end, { 'i', 's' }),
        },
        sources = {
          { name = 'nvim_lsp' },
          { name = 'luasnip' },
          { name = 'path' },
          { name = 'codeium' },
        },
      }
    end,
  },

  -- { -- You can easily change to a different colorscheme.         --Edited by Lewin Robin
  --   -- Change the name of the colorscheme plugin below, and then
  --   -- change the command in the config to whatever the name of that colorscheme is
  --   --
  --   -- If you want to see what colorschemes are already installed, you can use `:Telescope colorscheme`
  --   'folke/tokyonight.nvim',
  --   priority = 1000, -- make sure to load this before all the other start plugins
  --   init = function()
  --     -- Load the colorscheme here.
  --     -- Like many other themes, this one has different styles, and you could load
  --     -- any other, such as 'tokyonight-storm', 'tokyonight-moon', or 'tokyonight-day'.
  --     vim.cmd.colorscheme 'tokyonight-night'
  --     -- You can configure highlights by doing something like
  --     vim.cmd.hi 'Comment gui=none'
  --   end,
  -- },
  {
    -- 'folke/tokyonight.nvim',
    -- 'rebelot/kanagawa.nvim',
    -- -- 'projekt0n/github-nvim-theme.nvim',
    -- 'shaunsingh/nord.nvim',
    -- 'EdenEast/nightfox.nvim',
    -- 'navarasu/onedark.nvim',
    -- 'tanvirtin/monokai.nvim',
    -- 'rose-pine/neovim',
    -- 'catppuccin/nvim',
    -- 'tiagovla/tokyodark.nvim',
    'Mofiqul/vscode.nvim',
    -- 'loctvl842/monokai-pro.nvim',
    -- 'Mofiqul/dracula.nvim',
  },
  { -- You can easily change to a different colorscheme.         --Edited by Lewin Robin
    -- Change the name of the colorscheme plugin below, and then
    -- change the command in the config to whatever the name of that colorscheme is
    --
    -- If you want to see what colorschemes are already installed, you can use `:Telescope colorscheme`
    'Mofiqul/vscode.nvim',
    -- 'Mofiqul/dracula.nvim',
    priority = 1000, -- make sure to load this before all the other start plugins
    init = function()
      -- Load the colorscheme here.
      -- Like many other themes, this one has different styles, and you could load
      -- any other, such as 'tokyonight-storm', 'tokyonight-moon', or 'tokyonight-day'.
      vim.cmd.colorscheme 'vscode'
      -- vim.cmd.colorscheme 'dracula'
      -- You can configure highlights by doing something like
      vim.cmd.hi 'Comment gui=none'
    end,
  },

  -- Highlight todo, notes, etc in comments
  { 'folke/todo-comments.nvim', event = 'VimEnter', dependencies = { 'nvim-lua/plenary.nvim' }, opts = { signs = false } },

  -- { -- Collection of various small independent plugins/modules       -- Edited by Lewin Robin
  --   'echasnovski/mini.nvim',
  --   config = function()
  --     -- Better Around/Inside textobjects
  --     --
  --     -- Examples:
  --     --  - va)  - [V]isually select [A]round [)]paren
  --     --  - yinq - [Y]ank [I]nside [N]ext [']quote
  --     --  - ci'  - [C]hange [I]nside [']quote
  --     require('mini.ai').setup { n_lines = 500 }
  --
  --     -- Add/delete/replace surroundings (brackets, quotes, etc.)
  --     --
  --     -- - saiw) - [S]urround [A]dd [I]nner [W]ord [)]Paren
  --     -- - sd'   - [S]urround [D]elete [']quotes
  --     -- - sr)'  - [S]urround [R]eplace [)] [']
  --     require('mini.surround').setup()
  --
  --     -- Simple and easy statusline.
  --     --  You could remove this setup call if you don't like it,
  --     --  and try some other statusline plugin
  --     local statusline = require 'mini.statusline'
  --     -- set use_icons to true if you have a Nerd Font
  --     statusline.setup { use_icons = vim.g.have_nerd_font }
  --
  --     -- You can configure sections in the statusline by overriding their
  --     -- default behavior. For example, here we set the section for
  --     -- cursor location to LINE:COLUMN
  --     ---@diagnostic disable-next-line: duplicate-set-field
  --     statusline.section_location = function()
  --       return '%2l:%-2v'
  --     end
  --
  --     -- ... and there is more!
  --     --  Check out: https://github.com/echasnovski/mini.nvim
  --   end,
  -- },

  -- { -- Highlight, edit, and navigate code -- commented by Lewin  as it was deprecated
  --   'nvim-treesitter/nvim-treesitter',
  --   build = ':TSUpdate',
  --   main = 'nvim-treesitter', -- <-- add this line
  --   opts = {
  --     ensure_installed = { 'bash', 'c', 'html', 'lua', 'markdown', 'vim', 'vimdoc' },
  --     auto_install = true,
  --     highlight = { enable = true },
  --     indent = { enable = true },
  --   },
  -- },

  -- The following two comments only work if you have downloaded the kickstart repo, not just copy pasted the
  -- init.lua. If you want these files, they are in the repository, so you can just download them and
  -- put them in the right spots if you want.

  -- NOTE: Next step on your Neovim journey: Add/Configure additional plugins for kickstart
  --
  --  Here are some example plugins that I've included in the kickstart repository.
  --  Uncomment any of the lines below to enable them (you will need to restart nvim).
  --
  -- require 'kickstart.plugins.debug',
  -- require 'kickstart.plugins.indent_line',

  -- NOTE: The import below can automatically add your own plugins, configuration, etc from `lua/custom/plugins/*.lua`
  --    This is the easiest way to modularize your config.
  --
  --  Uncomment the following line and add your plugins to `lua/custom/plugins/*.lua` to get going.
  --    For additional information, see `:help lazy.nvim-lazy.nvim-structuring-your-plugins`
  { import = 'custom.plugins' },
  {
    'epwalsh/obsidian.nvim',
    version = '*', -- recommended, use latest release instead of latest commit
    lazy = true,
    event = 'VimEnter',
    -- ft = 'markdown',
    -- Replace the above line with this if you only want to load obsidian.nvim for markdown files in your vault:
    -- event = {
    --   -- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand'.
    --   -- E.g. "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/**.md"
    --   "BufReadPre path/to/my-vault/**.md",
    --   "BufNewFile path/to/my-vault/**.md",
    -- },
    dependencies = {
      -- Required.
      'nvim-lua/plenary.nvim',
      -- Bellow two dependnecies where added by me - Lewin Robin
      'hrsh7th/nvim-cmp',
      'nvim-telescope/telescope.nvim',

      -- see below for full list of optional dependencies 👇
    },
    opts = {
      workspaces = {
        {
          name = 'personal',
          path = '/mnt/E/codefile/Obsidian Vault/',
        },
        -- {                                            -- This has been commented out by me because there is no work file.
        --   name = 'work',
        --   path = '~/vaults/work',
        -- },
      },

      -- -- Alternatively - and for backwards compatibility - you can set 'dir' to a single path instead of
      -- 'workspaces'. For example:
      -- dir = "~/vaults/work",

      -- Optional, if you keep notes in a specific subdirectory of your vault.
      notes_subdir = 'notes',

      -- Optional, set the log level for obsidian.nvim. This is an integer corresponding to one of the log
      -- levels defined by "vim.log.levels.*".
      log_level = vim.log.levels.INFO,

      daily_notes = {
        -- Optional, if you keep daily notes in a separate directory.
        folder = 'Dailies',
        -- Optional, if you want to change the date format for the ID of daily notes.
        date_format = '%Y-%m-%d',
        -- Optional, if you want to change the date format of the default alias of daily notes.
        alias_format = '%B %-d, %Y',
        -- Optional, if you want to automatically insert a template from your template directory like 'daily.md'
        template = 'daily.md',
      },

      -- Optional, completion of wiki links, local markdown links, and tags using nvim-cmp.
      completion = {
        -- Set to false to disable completion.
        nvim_cmp = true,
        -- Trigger completion at 2 chars.
        min_chars = 2,
      },

      -- Optional, configure key mappings. These are the defaults. If you don't want to set any keymappings this
      -- way then set 'mappings = {}'.
      mappings = {
        -- Overrides the 'gf' mapping to work on markdown/wiki links within your vault.
        ['gf'] = {
          action = function()
            return require('obsidian').util.gf_passthrough()
          end,
          opts = { noremap = false, expr = true, buffer = true },
        },
        -- Toggle check-boxes.
        ['<leader>ch'] = {
          action = function()
            return require('obsidian').util.toggle_checkbox()
          end,
          opts = { buffer = true, desc = 'add checkbox' }, -- Lewin Robin - Added Description
        },
        -- Smart action depending on context, either follow link or toggle checkbox.
        ['<cr>'] = {
          action = function()
            return require('obsidian').util.smart_action()
          end,
          opts = { buffer = true, expr = true },
        },
      },

      -- Where to put new notes. Valid options are
      --  * "current_dir" - put new notes in same directory as the current buffer.
      --  * "notes_subdir" - put new notes in the default notes subdirectory.
      new_notes_location = 'notes_subdir',

      -- Optional, customize how note IDs are generated given an optional title.
      ---@param title string|?
      ---@return string
      note_id_func = function(title)
        -- Create note IDs in a Zettelkasten format with a timestamp and a suffix.
        -- In this case a note with the title 'My new note' will be given an ID that looks
        -- like '1657296016-my-new-note', and therefore the file name '1657296016-my-new-note.md'
        local suffix = ''
        if title ~= nil then
          -- If title is given, transform it into valid file name.
          suffix = title:gsub(' ', '-'):gsub('[^A-Za-z0-9-]', ''):lower()
        else
          -- If title is nil, just add 4 random uppercase letters to the suffix.
          for _ = 1, 4 do
            suffix = suffix .. string.char(math.random(65, 90))
          end
        end
        return tostring(os.time()) .. '-' .. suffix
      end,

      -- Optional, customize how note file names are generated given the ID, target directory, and title.
      ---@param spec { id: string, dir: obsidian.Path, title: string|? }
      ---@return string|obsidian.Path The full path to the new note.
      note_path_func = function(spec)
        -- This is equivalent to the default behavior.
        local path = spec.dir / tostring(spec.id)
        return path:with_suffix '.md'
      end,

      -- Optional, customize how wiki links are formatted. You can set this to one of:
      --  * "use_alias_only", e.g. '[[Foo Bar]]'
      --  * "prepend_note_id", e.g. '[[foo-bar|Foo Bar]]'
      --  * "prepend_note_path", e.g. '[[foo-bar.md|Foo Bar]]'
      --  * "use_path_only", e.g. '[[foo-bar.md]]'
      -- Or you can set it to a function that takes a table of options and returns a string, like this:
      wiki_link_func = function(opts)
        return require('obsidian.util').wiki_link_id_prefix(opts)
      end,

      -- Optional, customize how markdown links are formatted.
      markdown_link_func = function(opts)
        return require('obsidian.util').markdown_link(opts)
      end,

      -- Either 'wiki' or 'markdown'.
      preferred_link_style = 'wiki',

      -- Optional, customize the default name or prefix when pasting images via `:ObsidianPasteImg`.
      ---@return string
      image_name_func = function()
        -- Prefix image names with timestamp.
        return string.format('%s-', os.time())
      end,

      -- Optional, boolean or a function that takes a filename and returns a boolean.
      -- `true` indicates that you don't want obsidian.nvim to manage frontmatter.
      disable_frontmatter = false,

      -- Optional, alternatively you can customize the frontmatter data.
      ---@return table
      note_frontmatter_func = function(note)
        -- Add the title of the note as an alias.
        if note.title then
          note:add_alias(note.title)
        end

        local out = { id = note.id, aliases = note.aliases, tags = note.tags }

        -- `note.metadata` contains any manually added fields in the frontmatter.
        -- So here we just make sure those fields are kept in the frontmatter.
        if note.metadata ~= nil and not vim.tbl_isempty(note.metadata) then
          for k, v in pairs(note.metadata) do
            out[k] = v
          end
        end

        return out
      end,

      -- Optional, for templates (see below).
      templates = { -- Lewin Robin commented out
        folder = 'templates',
        date_format = '%Y-%m-%d',
        time_format = '%H:%M',
        -- A map for custom variables, the key should be the variable and the value a function
        substitutions = {},
      },

      -- Optional, by default when you use `:ObsidianFollowLink` on a link to an external
      -- URL it will be ignored but you can customize this behavior here.
      ---@param url string
      follow_url_func = function(url)
        -- Open the URL in the default web browser.
        -- vim.fn.jobstart { 'open', url } -- Mac OS
        -- vim.fn.jobstart { 'msedge', url } -- Windows
        vim.fn.jobstart { 'xdg-open', url } -- linux
      end,

      -- Optional, set to true if you use the Obsidian Advanced URI plugin.
      -- https://github.com/Vinzent03/obsidian-advanced-uri
      use_advanced_uri = false,

      -- Optional, set to true to force ':ObsidianOpen' to bring the app to the foreground.
      open_app_foreground = false,

      picker = {
        -- Set your preferred picker. Can be one of 'telescope.nvim', 'fzf-lua', or 'mini.pick'.
        name = 'telescope.nvim',
        -- Optional, configure key mappings for the picker. These are the defaults.
        -- Not all pickers support all mappings.
        mappings = {
          -- Create a new note from your query.
          new = '<C-x>',
          -- Insert a link to the selected note.
          insert_link = '<C-l>',
        },
      },

      -- Optional, sort search results by "path", "modified", "accessed", or "created".
      -- The recommend value is "modified" and `true` for `sort_reversed`, which means, for example,
      -- that `:ObsidianQuickSwitch` will show the notes sorted by latest modified time
      sort_by = 'modified',
      sort_reversed = true,

      -- Optional, determines how certain commands open notes. The valid options are:
      -- 1. "current" (the default) - to always open in the current window
      -- 2. "vsplit" - to open in a vertical split if there's not already a vertical split
      -- 3. "hsplit" - to open in a horizontal split if there's not already a horizontal split
      open_notes_in = 'current',

      -- Optional, define your own callbacks to further customize behavior.
      callbacks = {
        -- Runs at the end of `require("obsidian").setup()`.
        ---@param client obsidian.Client
        post_setup = function(client) end,

        -- Runs anytime you enter the buffer for a note.
        ---@param client obsidian.Client
        ---@param note obsidian.Note
        enter_note = function(client, note) end,

        -- Runs anytime you leave the buffer for a note.
        ---@param client obsidian.Client
        ---@param note obsidian.Note
        leave_note = function(client, note) end,

        -- Runs right before writing the buffer for a note.
        ---@param client obsidian.Client
        ---@param note obsidian.Note
        pre_write_note = function(client, note) end,

        -- Runs anytime the workspace is set/changed.
        ---@param client obsidian.Client
        ---@param workspace obsidian.Workspace
        post_set_workspace = function(client, workspace) end,
      },

      -- Optional, configure additional syntax highlighting / extmarks.
      -- This requires you have `conceallevel` set to 1 or 2. See `:help conceallevel` for more details.
      ui = {
        enable = true, -- set to false to disable all additional syntax features
        update_debounce = 200, -- update delay after a text change (in milliseconds)
        -- Define how various check-boxes are displayed
        checkboxes = {
          -- NOTE: the 'char' value has to be a single character, and the highlight groups are defined below.
          [' '] = { char = '󰄱', hl_group = 'ObsidianTodo' },
          ['x'] = { char = '', hl_group = 'ObsidianDone' },
          ['>'] = { char = '', hl_group = 'ObsidianRightArrow' },
          ['~'] = { char = '󰰱', hl_group = 'ObsidianTilde' },
          -- Replace the above with this if you don't have a patched font:
          -- [" "] = { char = "☐", hl_group = "ObsidianTodo" },
          -- ["x"] = { char = "✔", hl_group = "ObsidianDone" },

          -- You can also add more custom ones...
        },
        -- Use bullet marks for non-checkbox lists.
        bullets = { char = '•', hl_group = 'ObsidianBullet' },
        external_link_icon = { char = '', hl_group = 'ObsidianExtLinkIcon' },
        -- Replace the above with this if you don't have a patched font:
        -- external_link_icon = { char = "", hl_group = "ObsidianExtLinkIcon" },
        reference_text = { hl_group = 'ObsidianRefText' },
        highlight_text = { hl_group = 'ObsidianHighlightText' },
        tags = { hl_group = 'ObsidianTag' },
        block_ids = { hl_group = 'ObsidianBlockID' },
        hl_groups = {
          -- The options are passed directly to `vim.api.nvim_set_hl()`. See `:help nvim_set_hl`.
          ObsidianTodo = { bold = true, fg = '#f78c6c' },
          ObsidianDone = { bold = true, fg = '#89ddff' },
          ObsidianRightArrow = { bold = true, fg = '#f78c6c' },
          ObsidianTilde = { bold = true, fg = '#ff5370' },
          ObsidianBullet = { bold = true, fg = '#89ddff' },
          ObsidianRefText = { underline = true, fg = '#c792ea' },
          ObsidianExtLinkIcon = { fg = '#c792ea' },
          ObsidianTag = { italic = true, fg = '#89ddff' },
          ObsidianBlockID = { italic = true, fg = '#89ddff' },
          ObsidianHighlightText = { bg = '#75662e' },
        },
      },

      -- Specify how to handle attachments.
      attachments = {
        -- The default folder to place images in via `:ObsidianPasteImg`.
        -- If this is a relative path it will be interpreted as relative to the vault root.
        -- You can always override this per image by passing a full path to the command instead of just a filename.
        img_folder = 'assets/imgs', -- This is the default
        -- A function that determines the text to insert in the note when pasting an image.
        -- It takes two arguments, the `obsidian.Client` and an `obsidian.Path` to the image file.
        -- This is the default implementation.
        ---@param client obsidian.Client
        ---@param path obsidian.Path the absolute path to the image file
        ---@return string
        img_text_func = function(client, path)
          path = client:vault_relative_path(path) or path
          return string.format('![%s](%s)', path.name, path)
        end,
      },
    },
  },
  -- {
  --   'yetone/avante.nvim', -- Commented out by Lewin Cause i am not using it.
  --   event = 'VeryLazy',
  --   version = false, -- Set this to "*" to always pull the latest release version, or set it to false to update to the latest code changes.
  --   keys = {
  --     {
  --       '<leader>a+',
  --       function()
  --         local tree_ext = require 'avante.extensions.nvim_tree'
  --         tree_ext.add_file()
  --       end,
  --       desc = 'Select file in NvimTree',
  --       ft = 'NvimTree',
  --     },
  --     {
  --       '<leader>a-',
  --       function()
  --         local tree_ext = require 'avante.extensions.nvim_tree'
  --         tree_ext.remove_file()
  --       end,
  --       desc = 'Deselect file in NvimTree',
  --       ft = 'NvimTree',
  --     },
  --   },
  --   opts = {
  --     -- add any opts here
  --     -- for example
  --     -- provider = "openai",
  --     -- openai = {
  --     --   endpoint = "https://api.openai.com/v1",
  --     --   model = "gpt-4o", -- your desired model (or use gpt-4o, etc.)
  --     --   timeout = 30000, -- timeout in milliseconds
  --     --   temperature = 0, -- adjust if needed
  --     --   max_tokens = 4096,
  --     provider = 'gemini',
  --     mode = 'legacy', -- defult is agentic which will use a lot of modes
  --     providers = {
  --       gemini = {
  --         model = 'gemini-3-flash-preview', -- Added "-preview"
  --         max_tokens = 8192,
  --         temperature = 1, -- Gemini 3 performs best at 1.0
  --       },
  --     },
  --     selector = {
  --       exclude_auto_select = { 'NvimTree' },
  --     },
  --   },
  --   -- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
  --   build = 'make',
  --   -- build = 'powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false', -- for windows
  --   dependencies = {
  --     'nvim-treesitter/nvim-treesitter',
  --     'stevearc/dressing.nvim',
  --     'nvim-lua/plenary.nvim',
  --     'MunifTanjim/nui.nvim',
  --     --- The below dependencies are optional,
  --     'echasnovski/mini.pick', -- for file_selector provider mini.pick
  --     'nvim-telescope/telescope.nvim', -- for file_selector provider telescope
  --     'hrsh7th/nvim-cmp', -- autocompletion for avante commands and mentions
  --     'ibhagwan/fzf-lua', -- for file_selector provider fzf
  --     'nvim-tree/nvim-web-devicons', -- or echasnovski/mini.icons
  --     'zbirenbaum/copilot.lua', -- for providers='copilot'
  --     {
  --       -- support for image pasting
  --       'HakonHarnes/img-clip.nvim',
  --       event = 'VeryLazy',
  --       opts = {
  --         -- recommended settings
  --         default = {
  --           embed_image_as_base64 = false,
  --           prompt_for_file_name = false,
  --           drag_and_drop = {
  --             insert_mode = true,
  --           },
  --           -- required for Windows users
  --           -- use_absolute_path = true,
  --         },
  --       },
  --     },
  --     {
  --       -- Make sure to set this up properly if you have lazy=true
  --       'MeanderingProgrammer/render-markdown.nvim',
  --       opts = {
  --         file_types = { 'Avante' },
  --       },
  --       ft = { 'Avante' },
  --     },
  --   },
  -- },
  {
    'github/copilot.vim',
    config = function()
      -- 1. Disable the default Tab mapping
      vim.g.copilot_no_tab_map = true
      -- 2. Enable/Disable as you wish
      vim.g.copilot_enabled = 0

      -- 3. Map <C-y> to accept the suggestion
      -- 'i' means insert mode, 'expr' is required because copilot#Accept is a function
      vim.keymap.set('i', '<C-y>', 'copilot#Accept("\\<CR>")', {
        expr = true,
        replace_keycodes = false,
      })
      vim.keymap.set('i', '<A-y>', '<Plug>(copilot-accept-line)')
      vim.keymap.set('i', '<C-]>', '<Plug>(copilot-next)')
      vim.keymap.set('i', '<C-[>', '<Plug>(copilot-previous)')
      vim.keymap.set('i', '<C-Space>', function()
        require('copilot.suggestion').toggle_auto_trigger()
      end, { desc = 'Toggle Copilot Suggestion' })
    end,
  },

  -- If you want Copilot suggestions integrated with nvim-cmp
  -- {
  --   'zbirenbaum/copilot-cmp',
  --   after = { 'copilot.lua' }, -- Make sure it loads after copilot.lua
  --   config = function()
  --     require('copilot_cmp').setup()
  --   end,
  -- },

  -- {
  --   'Exafunction/windsurf.nvim',
  --   dependencies = {
  --     'nvim-lua/plenary.nvim',
  --     'hrsh7th/nvim-cmp',
  --   },
  --   config = function()
  --     require('codeium').setup {}
  --   end,
  -- },
  -- error highlighting pluggins
  {
    'folke/trouble.nvim',
    opts = {}, -- for default options, refer to the configuration section for custom setup.
    cmd = 'Trouble',
    keys = {
      {
        '<leader>xx',
        '<cmd>Trouble diagnostics toggle<cr>',
        desc = 'Diagnostics (Trouble)',
      },
      {
        '<leader>xX',
        '<cmd>Trouble diagnostics toggle filter.buf=0<cr>',
        desc = 'Buffer Diagnostics (Trouble)',
      },
      {
        '<leader>cs',
        '<cmd>Trouble symbols toggle focus=false<cr>',
        desc = 'Symbols (Trouble)',
      },
      {
        '<leader>cl',
        '<cmd>Trouble lsp toggle focus=false win.position=right<cr>',
        desc = 'LSP Definitions / references / ... (Trouble)',
      },
      {
        '<leader>xL',
        '<cmd>Trouble loclist toggle<cr>',
        desc = 'Location List (Trouble)',
      },
      {
        '<leader>xQ',
        '<cmd>Trouble qflist toggle<cr>',
        desc = 'Quickfix List (Trouble)',
      },
    },
  },
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      vim.opt.laststatus = 3

      local function get_diagnostics()
        local colors = {
          error = '#FF5555', -- Red for Error
          warning = '#FFB86C', -- Orange/Yellow for Warning
          info = '#8BE9FD', -- Cyan for Info
          hint = '#BD93F9', -- Purple for Hint
        }

        local diagnostics = vim.diagnostic.get(0)
        local counts = { error = 0, warn = 0, info = 0, hint = 0 }

        for _, diagnostic in ipairs(diagnostics) do
          if diagnostic.severity == vim.diagnostic.severity.ERROR then
            counts.error = counts.error + 1
          elseif diagnostic.severity == vim.diagnostic.severity.WARN then
            counts.warn = counts.warn + 1
          elseif diagnostic.severity == vim.diagnostic.severity.INFO then
            counts.info = counts.info + 1
          elseif diagnostic.severity == vim.diagnostic.severity.HINT then
            counts.hint = counts.hint + 1
          end
        end

        local result = {}

        if counts.error > 0 then
          table.insert(result, string.format('%%#LualineDiagnosticError# %d', counts.error))
        end
        if counts.warn > 0 then
          table.insert(result, string.format('%%#LualineDiagnosticWarn# %d', counts.warn))
        end
        if counts.info > 0 then
          table.insert(result, string.format('%%#LualineDiagnosticInfo# %d', counts.info))
        end
        if counts.hint > 0 then
          table.insert(result, string.format('%%#LualineDiagnosticHint# %d', counts.hint))
        end

        -- No background color for diagnostics
        vim.api.nvim_set_hl(0, 'LualineDiagnosticError', { fg = colors.error, bg = 'NONE' })
        vim.api.nvim_set_hl(0, 'LualineDiagnosticWarn', { fg = colors.warning, bg = 'NONE' })
        vim.api.nvim_set_hl(0, 'LualineDiagnosticInfo', { fg = colors.info, bg = 'NONE' })
        vim.api.nvim_set_hl(0, 'LualineDiagnosticHint', { fg = colors.hint, bg = 'NONE' })

        return table.concat(result, ' ')
      end

      -- Static theme (same color for all modes)
      local static_theme = {
        normal = {
          a = { fg = '#1E1E1E', bg = '#569CD6', gui = 'bold' }, -- Blue accent
          b = { fg = '#D4D4D4', bg = '#2D2D2D' }, -- Soft gray mid
          c = { fg = '#CCCCCC', bg = '#1E1E1E' }, -- Dark background
        },
        insert = {
          a = { fg = '#1E1E1E', bg = '#569CD6', gui = 'bold' }, -- Blue accent
          b = { fg = '#D4D4D4', bg = '#2D2D2D' },
          c = { fg = '#CCCCCC', bg = '#1E1E1E' },
        },
        visual = {
          a = { fg = '#1E1E1E', bg = '#569CD6', gui = 'bold' }, -- Blue accent
          b = { fg = '#D4D4D4', bg = '#2D2D2D' },
          c = { fg = '#CCCCCC', bg = '#1E1E1E' },
        },
        replace = {
          a = { fg = '#1E1E1E', bg = '#569CD6', gui = 'bold' }, -- Blue accent
          b = { fg = '#D4D4D4', bg = '#2D2D2D' },
          c = { fg = '#CCCCCC', bg = '#1E1E1E' },
        },
        command = {
          a = { fg = '#1E1E1E', bg = '#569CD6', gui = 'bold' }, -- Blue accent
          b = { fg = '#D4D4D4', bg = '#2D2D2D' },
          c = { fg = '#CCCCCC', bg = '#1E1E1E' },
        },
        inactive = {
          a = { fg = '#808080', bg = '#2D2D2D' },
          b = { fg = '#808080', bg = '#2D2D2D' },
          c = { fg = '#666666', bg = '#1E1E1E' },
        },
      }

      require('lualine').setup {
        options = {
          theme = static_theme,
          section_separators = { left = '', right = '' },
          component_separators = { left = '', right = '' },
          icons_enabled = true,
        },
        sections = {
          lualine_a = {
            {
              'branch',
              fmt = function(str)
                -- Checks if the output is the default placeholder '?' or an empty string,
                -- and if so, returns nil to hide the component.
                if str and str ~= '?' and str ~= '' then
                  return str
                else
                  return nil
                end
              end,
            },
          },
          lualine_b = {
            -- {
            --   'branch',
            --   icon = '',
            --   color = { fg = '#FFFFFF' },
            -- },
            'diff',
          },
          lualine_c = { { 'filename', path = 1 } },
          lualine_x = { get_diagnostics, 'encoding', 'fileformat' },
          lualine_y = { 'progress' },
          lualine_z = { 'location' },
        },
        inactive_sections = {
          lualine_a = {},
          lualine_b = {},
          lualine_c = { 'filename' },
          lualine_x = { 'location' },
          lualine_y = {},
          lualine_z = {},
        },
        tabline = {},
        extensions = {},
      }
    end,
  },
  -- {                                              -- commented too much bloat for very less use.
  --   'folke/snacks.nvim',
  --   priority = 1000,
  --   lazy = false,
  --   ---@type snacks.Config
  --   opts = {
  --     notifier = {
  --       enabled = true,
  --       timeout = 3000,
  --     },
  --     picker = { enabled = true },
  --     scope = { enabled = true },
  --     words = { enabled = true },
  --     styles = {
  --       notification = {
  --         -- wo = { wrap = true } -- Wrap notifications
  --       },
  --     },
  --   },
  --   keys = {
  --     -- Top Pickers & Explorer
  --     {
  --       '<leader>fp',
  --       function()
  --         Snacks.picker.projects()
  --       end,
  --       desc = 'Projects',
  --     },
  --     {
  --       '<leader>sH',
  --       function()
  --         Snacks.picker.highlights()
  --       end,
  --       desc = 'Highlights',
  --     },
  --     {
  --       '<leader>si',
  --       function()
  --         Snacks.picker.icons()
  --       end,
  --       desc = 'Icons',
  --     },
  --     {
  --       '<leader>sp',
  --       function()
  --         Snacks.picker.lazy()
  --       end,
  --       desc = 'Search for Plugin Spec',
  --     },
  --     {
  --       '<leader>su',
  --       function()
  --         Snacks.picker.undo()
  --       end,
  --       desc = 'Undo History',
  --     },
  --     {
  --       '<leader>.',
  --       function()
  --         Snacks.scratch()
  --       end,
  --       desc = 'Toggle Scratch Buffer',
  --     },
  --     {
  --       '<leader>.s',
  --       function()
  --         Snacks.scratch.select()
  --       end,
  --       desc = 'Select Scratch Buffer',
  --     },
  --     {
  --       '<leader>n',
  --       function()
  --         Snacks.notifier.show_history()
  --       end,
  --       desc = 'Notification History',
  --     },
  --     {
  --       '<leader>gB',
  --       function()
  --         Snacks.gitbrowse()
  --       end,
  --       desc = 'Git Browse',
  --       mode = { 'n', 'v' },
  --     },
  --     {
  --       '<leader>un',
  --       function()
  --         Snacks.notifier.hide()
  --       end,
  --       desc = 'Dismiss All Notifications',
  --     },
  --     {
  --       ']]',
  --       function()
  --         Snacks.words.jump(vim.v.count1)
  --       end,
  --       desc = 'Next Reference',
  --       mode = { 'n', 't' },
  --     },
  --     {
  --       '[[',
  --       function()
  --         Snacks.words.jump(-vim.v.count1)
  --       end,
  --       desc = 'Prev Reference',
  --       mode = { 'n', 't' },
  --     },
  --     {
  --       '<leader>N',
  --       desc = 'Neovim News',
  --       function()
  --         Snacks.win {
  --           file = vim.api.nvim_get_runtime_file('doc/news.txt', false)[1],
  --           width = 0.6,
  --           height = 0.6,
  --           wo = {
  --             spell = false,
  --             wrap = false,
  --             signcolumn = 'yes',
  --             statuscolumn = ' ',
  --             conceallevel = 3,
  --           },
  --         }
  --       end,
  --     },
  --   },
  --   init = function()
  --     vim.api.nvim_create_autocmd('User', {
  --       pattern = 'VeryLazy',
  --       callback = function()
  --         -- Setup some globals for debugging (lazy-loaded)
  --         _G.dd = function(...)
  --           Snacks.debug.inspect(...)
  --         end
  --         _G.bt = function()
  --           Snacks.debug.backtrace()
  --         end
  --
  --         -- Override print to use snacks for `:=` command
  --         if vim.fn.has 'nvim-0.11' == 1 then
  --           vim._print = function(_, ...)
  --             dd(...)
  --           end
  --         else
  --           vim.print = _G.dd
  --         end
  --
  --         -- Create some toggle mappings
  --         Snacks.toggle.option('spell', { name = 'Spelling' }):map '<leader>us'
  --       end,
  --     })
  --   end,
  -- },
  {
    'dundalek/bloat.nvim',
    cmd = 'Bloat',
  },
  {
    'LunarVim/bigfile.nvim',
    event = 'BufReadPre', -- Load before any file opens
    opts = {
      filesize = 2, -- Trigger for files larger than 2 MiB
      features = {
        'indent_blankline',
        'illuminate',
        'lsp',
        'treesitter',
        'syntax',
        'matchparen',
        'vimopts',
        'filetype',
      },
    },
  },
  {
    'CopilotC-Nvim/CopilotChat.nvim',
    -- branch = "canary", -- REMOVE THIS: canary is deprecated, use main
    dependencies = {
      { 'github/copilot.vim' },
      { 'nvim-lua/plenary.nvim' },
      { 'nvim-telescope/telescope.nvim' },
    },
    opts = {
      model = 'gpt-5-mini',
      question_header = '  User ',
      answer_header = '  Copilot ',
      window = {
        layout = 'vertical',
        width = 0.4,
      },
      -- The New Way to set Telescope as the handler
      selection_handlers = {
        telescope = function()
          return require 'CopilotChat.codecompanion.telescope' -- New 2026 path or use the built-in picker
        end,
      },
    },
    config = function(_, opts)
      local chat = require 'CopilotChat'
      chat.setup(opts)
    end,
    keys = {
      { '<leader>aa', '<cmd>CopilotChatToggle<cr>', desc = 'AI Chat', mode = { 'n', 'v' } },
      -- Fixed Telescope Action Palette Call
      {
        '<leader>as',
        function()
          local actions = require 'CopilotChat.actions'
          -- In modern versions, you just call pick on the actions directly
          actions.pick(actions.prompt_actions())
        end,
        desc = 'AI Search Actions',
        mode = { 'n', 'v' },
      },
      {
        '<leader>ae',
        function()
          local input = vim.fn.input 'AI Edit: '
          if input ~= '' then
            require('CopilotChat').ask(input, { selection = require('CopilotChat.select').buffer })
          end
        end,
        desc = 'AI Inline Edit',
        mode = { 'n', 'v' },
      },
    },
  },
  {
    'romus204/tree-sitter-manager.nvim',
    dependencies = {},
    config = function()
      require('tree-sitter-manager').setup {
        -- Automatically install missing parsers when you open a new filetype
        auto_install = true,

        -- Optional: list of parsers to always have installed
        ensure_installed = { 'lua', 'vim', 'vimdoc', 'query', 'markdown', 'python', 'dart' },

        -- Enable highlighting by default
        highlight = true,
      }
    end,
  },
}, {
  ui = {
    -- If you have a Nerd Font, set icons to an empty table which will use the
    -- default lazy.nvim defined Nerd Font icons otherwise define a unicode icons table
    icons = vim.g.have_nerd_font and {} or {
      cmd = '⌘',
      config = '🛠',
      event = '📅',
      ft = '📂',
      init = '⚙',
      keys = '🗝',
      plugin = '🔌',
      runtime = '💻',
      require = '🌙',
      source = '📄',
      start = '🚀',
      task = '📌',
      lazy = '💤 ',
    },
  },
})

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et

-- function RunCommandBasedOnFileType()
--   -- Get the current buffer name
--   local filename = vim.fn.expand '%:t'
--
--   -- Extract the file extension
--   local file_extension = vim.fn.fnamemodify(filename, ':e')
--
--   -- Define commands based on file extensions
--   local commands = {
--     ['rs'] = 'cargo run',
--     -- ['vim'] = 'vim_command',
--     -- Add more file extensions and commands as needed
--   }
--
--   -- Get the command associated with the file extension
--   local command_to_run = commands[file_extension]
--
--   -- Check if a command is associated with the file extension
--   if command_to_run then

--     vim.cmd(command_to_run)
--   else
--     print 'No command defined for this file type'
--   end
-- end
--
-- -- Map a key to run the function
-- -- vim.api.nvim_set_keymap('n', '<C-r>r', ':lua RunCommandBasedOnFileType()<CR>', { noremap = true, silent = true })
-- vim.api.nvim_set_keymap('n', '<leader>R', RunCommandBasedOnFileType())

--NOTE: Obsidian Keymaps
vim.opt.conceallevel = 2
vim.keymap.set('n', '<leader>obss', ':ObsidianSearch<CR>', { desc = 'Goto [Obs]idian & [S]earch' })
vim.keymap.set('n', '<leader>obst', ':ObsidianToday<CR>', { desc = "Goto [Obs]idian & get [T]oday's Daily" })
vim.keymap.set('n', '<leader>obsm', ':ObsidianTomorrow<CR>', { desc = "Goto [Obs]idian & get to[m]orrow's Daily" })
vim.keymap.set('n', '<leader>obsy', ':ObsidianYesterday<CR>', { desc = "Goto [Obs]idian & get [Y]esterday's Daily" })
vim.keymap.set('n', '<leader>obsn', ':ObsidianSearch<CR>', { desc = '[Obs]idian Search' })
vim.keymap.set('n', '<leader>obso', ':ObsidianOpen<CR>', { desc = '[Obs]idian [O]pen' })
vim.keymap.set('n', '<leader>obse', ':ObsidianExtractNote<CR>', { desc = '[Obs]idian [E]xtractNotes' })
vim.keymap.set('n', '<leader>obsf', ':ObsidianFollowLink<CR>', { desc = '[Obs]idian [F]ollowLink' })

-- NOTE: Harpoon configs
local mark = require 'harpoon.mark'
local ui = require 'harpoon.ui'
vim.keymap.set('n', '<leader>a', mark.add_file, { desc = 'Add file to Harpoon' })
vim.keymap.set('n', '<leader>hp', ui.toggle_quick_menu, { desc = 'Open Harpoon UI' })

vim.keymap.set('n', '<leader>1', function()
  ui.nav_file(1)
end)
vim.keymap.set('n', '<leader>2', function()
  ui.nav_file(2)
end)
vim.keymap.set('n', '<leader>3', function()
  ui.nav_file(3)
end)
vim.keymap.set('n', '<leader>4', function()
  ui.nav_file(4)
end)
vim.keymap.set('n', '<leader>5', function()
  ui.nav_file(5)
end)
vim.keymap.set('n', '<leader>6', function()
  ui.nav_file(6)
end)
vim.keymap.set('n', '<leader>7', function()
  ui.nav_file(7)
end)
vim.keymap.set('n', '<leader>8', function()
  ui.nav_file(8)
end)
vim.keymap.set('n', '<leader>9', function()
  ui.nav_file(9)
end)
require('telescope').load_extension 'harpoon'
vim.keymap.set('n', '<leader>hf', ':Telescope harpoon marks<CR>', { desc = 'Harpoon UI in Telescope' })

-- NOTE: Terminal Keymaps
vim.keymap.set('t', '<C-p>', '<up>')
vim.keymap.set('t', '<C-n>', '<down>')
vim.keymap.set('t', '<Esc>', '<C-\\><C-n>')

-- NOTE: Oil Config
vim.keymap.set('n', '-', '<CMD>Oil<CR>', { desc = 'Open parent directory' })
local oil = require 'oil'
oil.setup {
  -- Oil will take over directory buffers (e.g. `vim .` or `:e src/`)
  -- Set to false if you still want to use netrw.
  default_file_explorer = true,
  -- Id is automatically added at the beginning, and name at the end
  -- See :help oil-columns
  columns = {
    'icon',
    -- "permissions",
    -- "size",
    -- "mtime",
  },
  -- Buffer-local options to use for oil buffers
  buf_options = {
    buflisted = false,
    bufhidden = 'hide',
  },
  -- Window-local options to use for oil buffers
  win_options = {
    wrap = false,
    signcolumn = 'no',
    cursorcolumn = false,
    foldcolumn = '0',
    spell = false,
    list = false,
    conceallevel = 3,
    concealcursor = 'nvic',
  },
  -- Send deleted files to the trash instead of permanently deleting them (:help oil-trash)
  delete_to_trash = true,
  -- Skip the confirmation popup for simple operations (:help oil.skip_confirm_for_simple_edits)
  skip_confirm_for_simple_edits = false,
  -- Selecting a new/moved/renamed file or directory will prompt you to save changes first
  -- (:help prompt_save_on_select_new_entry)
  prompt_save_on_select_new_entry = true,
  -- Oil will automatically delete hidden buffers after this delay
  -- You can set the delay to false to disable cleanup entirely
  -- Note that the cleanup process only starts when none of the oil buffers are currently displayed
  cleanup_delay_ms = 2000,
  lsp_file_methods = {
    -- Time to wait for LSP file operations to complete before skipping
    timeout_ms = 1000,
    -- Set to true to autosave buffers that are updated with LSP willRenameFiles
    -- Set to "unmodified" to only save unmodified buffers
    autosave_changes = false,
  },
  -- Constrain the cursor to the editable parts of the oil buffer
  -- Set to `false` to disable, or "name" to keep it on the file names
  constrain_cursor = 'editable',
  -- Set to true to watch the filesystem for changes and reload oil
  experimental_watch_for_changes = false,
  -- Keymaps in oil buffer. Can be any value that `vim.keymap.set` accepts OR a table of keymap
  -- options with a `callback` (e.g. { callback = function() ... end, desc = "", mode = "n" })
  -- Additionally, if it is a string that matches "actions.<name>",
  -- it will use the mapping at require("oil.actions").<name>
  -- Set to `false` to remove a keymap
  -- See :help oil-actions for a list of all available actions

  keymaps = { -- Commented by Lewin Robin as it added many keymaps
    ['g?'] = 'actions.show_help',
    ['<CR>'] = 'actions.select',
    ['<C-s>'] = 'actions.select_vsplit',
    ['<C-h>'] = 'actions.select_split',
    ['<C-t>'] = 'actions.select_tab',
    ['<C-p>'] = 'actions.preview', -- Lewin Robin -- commented because it was clashing with Telescope.
    -- ['<C-p>'] = false, -- Lewin Robin -- because telescope real keymap was kept
    -- ['<C-c>'] = 'actions.close', -- Lewin Robin  -- cause this was annoying
    ['<C-c>'] = false,
    ['<C-l>'] = 'actions.refresh',
    ['-'] = 'actions.parent',
    ['_'] = 'actions.open_cwd',
    ['`'] = 'actions.cd',
    ['~'] = 'actions.tcd',
    ['gs'] = 'actions.change_sort',
    ['gx'] = 'actions.open_external',
    ['g.'] = 'actions.toggle_hidden',
    ['g\\'] = 'actions.toggle_trash',
  },

  -- Set to false to disable all of the above keymaps
  -- use_default_keymaps = true,  -- Lewin Robin
  view_options = {
    -- Show files and directories that start with "."
    show_hidden = true,
    -- This function defines what is considered a "hidden" file
    is_hidden_file = function(name, bufnr)
      return vim.startswith(name, '.')
    end,
    -- This function defines what will never be shown, even when `show_hidden` is set
    is_always_hidden = function(name, bufnr)
      return false
    end,
    -- Sort file names in a more intuitive order for humans. Is less performant,
    -- so you may want to set to false if you work with large directories.
    natural_order = true,
    sort = {
      -- sort order can be "asc" or "desc"
      -- see :help oil-columns to see which columns are sortable
      { 'type', 'asc' },
      { 'name', 'asc' },
    },
  },
  -- Extra arguments to pass to SCP when moving/copying files over SSH
  extra_scp_args = {},
  -- EXPERIMENTAL support for performing file operations with git
  git = {
    -- Return true to automatically git add/mv/rm files
    add = function(path)
      return false
    end,
    mv = function(src_path, dest_path)
      return false
    end,
    rm = function(path)
      return false
    end,
  },
  -- Configuration for the floating window in oil.open_float
  float = {
    -- Padding around the floating window
    padding = 2,
    max_width = 0,
    max_height = 0,
    border = 'rounded',
    win_options = {
      winblend = 0,
    },
    -- This is the config that will be passed to nvim_open_win.
    -- Change values here to customize the layout
    override = function(conf)
      return conf
    end,
  },
  -- Configuration for the actions floating preview window
  preview = {
    -- Width dimensions can be integers or a float between 0 and 1 (e.g. 0.4 for 40%)
    -- min_width and max_width can be a single value or a list of mixed integer/float types.
    -- max_width = {100, 0.8} means "the lesser of 100 columns or 80% of total"
    max_width = 0.9,
    -- min_width = {40, 0.4} means "the greater of 40 columns or 40% of total"
    min_width = { 40, 0.4 },
    -- optionally define an integer/float for the exact width of the preview window
    width = nil,
    -- Height dimensions can be integers or a float between 0 and 1 (e.g. 0.4 for 40%)
    -- min_height and max_height can be a single value or a list of mixed integer/float types.
    -- max_height = {80, 0.9} means "the lesser of 80 columns or 90% of total"
    max_height = 0.9,
    -- min_height = {5, 0.1} means "the greater of 5 columns or 10% of total"
    min_height = { 5, 0.1 },
    -- optionally define an integer/float for the exact height of the preview window
    height = nil,
    border = 'rounded',
    win_options = {
      winblend = 0,
    },
    -- Whether the preview window is automatically updated when the cursor is moved
    update_on_cursor_moved = true,
  },
  -- Configuration for the floating progress window
  progress = {
    max_width = 0.9,
    min_width = { 40, 0.4 },
    width = nil,
    max_height = { 10, 0.9 },
    min_height = { 5, 0.1 },
    height = nil,
    border = 'rounded',
    minimized_border = 'none',
    win_options = {
      winblend = 0,
    },
  },
  -- Configuration for the floating SSH window
  ssh = {
    border = 'rounded',
  },
  -- Configuration for the floating keymaps help window
  keymaps_help = {
    border = 'rounded',
  },
}
-- Disabled line wrapping in nvim
vim.opt.wrap = false
require 'removeBackground'
require 'keymaps'

-- require('lspconfig').jdtls.setup {
--   on_attach = on_attach_function,
--   capabilities = capabilities,
--   root_dir = function(fname)
--     -- Your logic to determine root directory
--     return vim.fn.getcwd() -- Example: Using current working directory
--   end,
-- }

-- vim.opt.formatoptions = vim.opt.formatoptions:gsub('c', '')
-- vim.opt_local.formatoptions:remove { 'r', 'o' }
-- vim.opt.formatoptions = vim.opt.formatoptions:gsub('cro', '')
-- im.cmd 'set formatoptions-=cro'
-- vim.opt.formatoptions = 'cro'

vim.g.format_on_save_enabled = true

vim.api.nvim_set_keymap('n', '<leader>tf', [[:lua ToggleFormatOnSave()<CR>]], { noremap = true, silent = true })

function ToggleFormatOnSave()
  vim.g.format_on_save_enabled = not vim.g.format_on_save_enabled
  if vim.g.format_on_save_enabled then
    print 'Format on Save: Enabled'
  else
    print 'Format on Save: Disabled'
  end
end

require('conform').setup {
  notify_on_error = false,
  format_on_save = function()
    if vim.g.format_on_save_enabled then
      return { timeout_ms = 500, lsp_fallback = true }
    end
  end,
  formatters_by_ft = {
    lua = { 'stylua' },
  },
}

vim.opt.laststatus = 3
if vim.bo.modifiable then
  vim.opt.fileformat = 'unix'
end

vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.softtabstop = 2

-- Save this code in your init.lua (or a file it loads)

-- The ASCII art, defined as a multi-line Lua string
local ascii_art = [[
 .d88b.  d8888b. d88888b d8b   db                    
.8P  Y8. 88  `8D 88'     888o  88                    
88    88 88oodD' 88ooooo 88V8o 88                    
88    88 88~~~   88~~~~~ 88 V8o88                    
`8b  d8' 88      88.     88  V888                    
 `Y88P'  88      Y88888P VP   V8P                    
                                                     
                                                     
d8b   db  .d88b.  d888888b d88888b .d8888.           
888o  88 .8P  Y8. `~~88~~' 88'     88'  YP           
88V8o 88 88    88    88    88ooooo `8bo.             
88 V8o88 88    88    88    88~~~~~   `Y8b.           
88  V888 `8b  d8'    88    88.     db   8D           
VP   V8P  `Y88P'     YP    Y88888P `8888Y'           
                                                     
                                                     
d8888b. db      d88888b  .d8b.  .d8888. d88888b      
88  `8D 88      88'     d8' `8b 88'  YP 88'          
88oodD' 88      88ooooo 88ooo88 `8bo.   88ooooo      
88~~~   88      88~~~~~ 88~~~88   `Y8b. 88~~~~~      
88      88booo. 88.     88   88 db   8D 88.          
88      Y88888P Y88888P YP   YP `8888Y' Y88888P      
                                                     
                                                     
d888888b db    db d8888b. d88888b                    
`~~88~~' `8b  d8' 88  `8D 88'                        
   88     `8bd8'  88oodD' 88ooooo                    
   88       88    88~~~   88~~~~~                    
   88       88    88      88.                        
   YP       YP    88      Y88888P                    
                                                     
                                                     
Cb       .d88b.  d8888b. .d8888. d888888b            
`8b     .8P  Y8. 88  `8D 88'  YP `~~88~~'            
 `8b    88    88 88oooY' `8bo.      88               
  `8b   88    88 88~~~b.   `Y8b.    88               
   `8b  `8b  d8' 88   8D db   8D    88               
    `8D  `Y88P'  Y8888P' `8888Y'    YP               
                                                     
                                                     
]]

-- Function to display the ASCII art
local function show_welcome_screen()
  -- nvim_echo expects a list of parts and a boolean for history.
  -- We use 'Statement' for coloring.
  vim.api.nvim_echo({ { ascii_art, 'Statement' } }, false, {})
end

-- This will run every time Neovim starts, regardless of what file is opened.
-- show_welcome_screen() -- commented out by Lewin Robin

-- Forcefully open daily notes
--
-- -- Create an Autocmd Group to keep things tidy
-- local obsidian_autocmds = vim.api.nvim_create_augroup('ObsidianDailyNote', { clear = true })
--
-- -- Set up an autocommand to run :ObsidianToday when Neovim starts
-- vim.api.nvim_create_autocmd('VimEnter', {
--   group = obsidian_autocmds,
--   pattern = '*', -- Apply to all files/buffers
--   callback = function()
--     -- Check if the Obsidian plugin is loaded and the command exists
--     if vim.fn.exists ':ObsidianToday' == 2 then
--       -- Execute the ObsidianToday command
--       vim.cmd 'ObsidianToday'
--     end
--   end,
--   -- Use 'nested' if you need other autocommands to run after this one,
--   -- but generally not needed for a simple startup command.
--   -- nested = true,
-- })
require('flutter-tools').setup {
  flutter_path = '/snap/bin/flutter',
}

vim.keymap.set('n', '<C-f>', '<cmd>silent !tmux neww tmux-sessionizer<CR>')

-- Command to manually start Copilot
vim.api.nvim_create_user_command('CopilotOn', function()
  vim.g.copilot_enabled = 1
  vim.cmd 'Copilot enable'
  print 'Copilot Started!'
end, {})

-- Optional: A command to turn it back off if needed
vim.api.nvim_create_user_command('CopilotOff', function()
  vim.g.copilot_enabled = 0
  vim.cmd 'Copilot disable'
  print 'Copilot Disabled.'
end, {})

vim.keymap.set('n', '<leader>gh', '<cmd>diffget //2<CR>', { desc = 'Replace with modification in the left pane ' })
vim.keymap.set('n', '<leader>gl', '<cmd>diffget //3<CR>', { desc = 'Replace with modification in the right pane ' })
vim.keymap.set('v', '<leader>gh', ':diffget //2<CR>', { desc = 'Replace with modification in the left pane ' })
vim.keymap.set('v', '<leader>gl', ':diffget //3<CR>', { desc = 'Replace with modification in the right pane ' })

vim.api.nvim_create_autocmd('FileType', {
  callback = function()
    pcall(vim.treesitter.start)
  end,
})
vim.opt.mouse = ''
