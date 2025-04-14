-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.keymap.set({"n", "t", "i"}, "<F11>", "<cmd>ToggleTerm direction=float <cr>", { desc = "Floating Terminal (fish)" })

