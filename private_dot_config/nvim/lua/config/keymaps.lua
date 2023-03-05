-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
--
--Window control
vim.keymap.set("n", "<leader>wc", "<C-W>c", { desc = "Close Window" })
vim.keymap.set("n", "<leader>ws", "<C-W>s", { desc = "Horizontal Window Split" })
vim.keymap.set("n", "<leader>wv", "<C-W>v", { desc = "Vertical Window Split" })
--Window pane navigation
vim.keymap.set("n", "<leader>wl", "<C-W>l", { desc = "Nav window right" })
vim.keymap.set("n", "<leader>wh", "<C-W>h", { desc = "Nav window left" })
vim.keymap.set("n", "<leader>wk", "<C-W>k", { desc = "Nav window up" })
vim.keymap.set("n", "<leader>wj", "<C-W>j", { desc = "Nav window down" })
--Buffers
vim.keymap.set("n", "<leader>bk", "<cmd>bdelete<cr>", { desc = "Kill current buffer" })
vim.keymap.set("n", "<leader>bn", "<cmd>BufferLineCycleNext<cr>", { desc = "Cycle Next Buffer" })
vim.keymap.set("n", "<leader>bp", "<cmd>BufferLineCyclePrev<cr>", { desc = "Cycle Previous Buffer" })
