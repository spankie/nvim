vim.g.mapleader = " "
-- show netrw file explorer
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
-- go to previous buffer
vim.keymap.set("n", "<leader><tab>", vim.cmd.bprevious)
-- save file
vim.keymap.set("n", "<leader>fs", vim.cmd.w)

-- move highlighted line down 1 line
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
-- move highlighted line up 1 line
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- go to bottom of the file
vim.keymap.set("n", "<C-d>", "<C-d>zz")
-- go to top of the file
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- make sure pasting does not copy the deleted word as well
vim.keymap.set("x", "<leader>p", "\"_dp")
-- copy to system clipboard
vim.keymap.set("v", "<leader>y", "\"+y")
-- close buffer with leader q
vim.keymap.set("n", "<leader>q", ":bd<CR>")
-- format the content of the buffer
vim.keymap.set("n", "<leader>ff", ":lua vim.lsp.buf.format()<CR>")

-- some more configuration can be done from thePrimeagen video (0 to LSP)
