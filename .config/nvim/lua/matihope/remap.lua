vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

vim.keymap.set("v", "<M-j>", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "<M-k>", ":m '<-2<CR>gv=gv")

-- Make J - add bottom line to the current, without flying cursor
vim.keymap.set("n", "J", "mzJ`z")

-- Greatest remap ever - paste (and replace selection)
-- without losing clipboard
vim.keymap.set("x", "<leader>p", "\"_dP")

-- Another greatest remap ever - for the clipboard
vim.keymap.set("n", "<leader>y", "\"+y")
vim.keymap.set("v", "<leader>y", "\"+y")
vim.keymap.set("n", "<leader>Y", "\"+Y")

vim.keymap.set("i", "<C-c>", "<Esc>")

-- Delete to void
vim.keymap.set("n", "<leader>d", "\"_d")
vim.keymap.set("v", "<leader>d", "\"_d")

vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")

-- vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)
vim.keymap.set("n", "<leader>f", function ()
    vim.lsp.buf.format()
end)

-- Debugger
vim.keymap.set("n", "<leader>db", "<cmd>DapToggleBreakpoint<CR>")
vim.keymap.set("n", "<leader>dr", "<cmd>DapContinue<CR>")


vim.keymap.set("n", "<C-e>", function()
    vim.cmd("NvimTreeOpen")
end)

-- Disable search highlight
vim.keymap.set("n", "<leader>/", "<cmd>noh<CR>")


-- Exit terminal mode
vim.keymap.set("t", "<Esc>", "<C-\\><C-n>")



