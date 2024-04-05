-- Plugins keymap
-- shorten keymap
local keymap = vim.keymap.set

-- LSP mapping on plugins.config.lsp file

-- Diagnostic keymaps
keymap('n', '<leader>d[', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic message' })
keymap('n', '<leader>d]', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic message' })
keymap('n', '<leader>dq', vim.diagnostic.open_float, { desc = 'Open floating diagnostic message' })
keymap('n', '<leader>dw', vim.diagnostic.setloclist, { desc = 'Open diagnostics list' })

-- File Explorer keymaps
keymap('n', '<leader>fx', require('nvim-tree.api').tree.close, { desc = 'Toggle File Explorer' })
keymap('n', '<leader>ff', require('nvim-tree.api').tree.open, { desc = 'Open File Explorer' })
-- keymap('n', '<leader>f', require('nvim-tree.api').tree.open, { desc = 'File Explorer' })

-- Terminal keymaps
keymap("t", "<esc>", [[<C-\><C-n>]], { silent = true })

-- Telescope
keymap('n', '<leader>/', function()require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {winblend = 10,previewer = false,})end, { desc = 'Search' })
keymap('n', '<leader>t1', require('telescope.builtin').live_grep, { desc = 'Search in opened directory'  })
keymap('n', '<leader>t2', require('telescope.builtin').find_files, { desc = 'Find file' })
keymap('n', '<leader>t3', require('telescope.builtin').oldfiles, { desc = 'Recently opened files' })
keymap('n', '<leader>b', require('telescope.builtin').buffers, { desc = 'Open buffer' })
keymap('n', '<leader>tc', require('telescope.builtin').commands, { desc = 'Find commands' })
keymap('n', '<leader>tk', require('telescope.builtin').keymaps, { desc = 'Find keymap' })
keymap('n', '<leader>th', require('telescope.builtin').help_tags, { desc = 'Find help documentation' })

-- Delete buffer bufdelete
keymap('n', '<leader>x', function()require('bufdelete').bufdelete(0)end, { desc = 'Delete Buffer' })

-- Manger buffers harpoon
local harpoon = require("harpoon")

harpoon:setup({})

keymap("n", "<leader>a", function() harpoon:list():append() end, { desc = 'Append Buffer' })
keymap("n", "<leader>cd", function() harpoon:list():remove() end, { desc = 'Remove Buffer' })
keymap("n", "<leader>ce", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end, { desc = 'Toggle list' })
keymap("n", "<leader>1", function() harpoon:list():select(1) end, { desc = 'Buffer 1' })
keymap("n", "<leader>2", function() harpoon:list():select(2) end, { desc = 'Buffer 2' })
keymap("n", "<leader>3", function() harpoon:list():select(3) end, { desc = 'Buffer 3' })
keymap("n", "<leader>4", function() harpoon:list():select(4) end, { desc = 'Buffer 4' })
keymap("n", "<leader>cq", function() harpoon:list():prev() end, { desc = 'Previous Buffer' })
keymap("n", "<leader>cw", function() harpoon:list():next() end, { desc = 'Next Buffer' })

--Be lazy af!
keymap('n', '<leader>m', function() vim.cmd('Dashboard') end, { desc = 'Dashboard' })
keymap('n', '<leader>uq', function() vim.cmd('LspInstall') end, { desc = 'LSP Install' })
keymap('n', '<leader>ua', function() vim.cmd('TSUpdate') end, { desc = 'Treesitter Update' })
keymap('n', '<leader>us', function() vim.cmd('MasonUpdate') end, { desc = 'Mason Update' })
keymap('n', '<leader>ui', function() vim.cmd('LspInfo') end, { desc = 'LSP Info' })
keymap('n', '<leader>ul', function() vim.cmd('Lazy') end, { desc = 'Lazy' })
keymap('n', '<leader>um', function() vim.cmd('Mason') end, { desc = 'Mason' })

-- whichkey
keymap("n", "<leader>wK", "<cmd>WhichKey <CR>", { desc = "Whichkey all keymaps" })
keymap("n", "<leader>wk", function()vim.cmd("WhichKey " .. vim.fn.input "WhichKey: ")end, { desc = "Whichkey query lookup" })

-- Give names to unnamed keymaps
require('which-key').register {
  ['<leader>w'] = { name = 'WhichKey', _ = 'which_key_ignore' },
  ['<leader>c'] = { name = 'Manage Buffers', _ = 'which_key_ignore' },
  ['<leader>t'] = { name = 'Telescope', _ = 'which_key_ignore' },
  ['<leader>d'] = { name = 'Diagnostic', _ = 'which_key_ignore' },
  ['<leader>f'] = { name = 'File Explorer', _ = 'which_key_ignore' },
  ['<leader>u'] = { name = 'Real Stupid Stuff', _ = 'which_key_ignore' },
  ['<leader>l'] = { name = 'LSP', _ = 'which_key_ignore' },
}
