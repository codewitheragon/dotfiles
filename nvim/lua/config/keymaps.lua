-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Better indentation: stay in visual mode
vim.keymap.set("v", "<", "<gv", { desc = "Indent out" })
vim.keymap.set("v", ">", ">gv", { desc = "Indent in" })
