-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.keymap.set({"n", "t", "i"}, "<F11>", "<cmd>ToggleTerm direction=float <cr>", { desc = "Floating Terminal (fish)" })

local telescope = require("telescope.builtin")
vim.keymap.set('n', '<C-p>', telescope.find_files, {})
vim.keymap.set('n', '<C-f>', function() telescope.treesitter({ symbols = { 'function' } }) end, {})
vim.keymap.set('n', '<C-s>', telescope.treesitter, {})
vim.keymap.set('n', '<F2>', function() vim.diagnostic.goto_next() end, { desc = 'Jump to next diagnostic' })
