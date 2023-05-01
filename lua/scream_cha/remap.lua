vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex) -- open explorer window netrw

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv") -- move selection down with indentation
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv") -- move selection up with indentation

vim.keymap.set("n", "J", "mzJ`z") -- append to previous line with no cursor movement
vim.keymap.set("n", "<C-d>", "<C-d>zz") -- half-page down with cursor in the middle 
vim.keymap.set("n", "<C-u>", "<C-u>zz") -- half-page up with cursor in the middle
vim.keymap.set("n", "n", "nzzzv") -- to the next selection with cursor in the middle
vim.keymap.set("n", "N", "Nzzzv") -- to the previous selection with cursor in the middle

vim.keymap.set("n", "Q", "<nop>")
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)

-- quickfix navigation
vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]]) -- replace the word where cursor was
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true }) -- make current file executable

vim.keymap.set("n", "<leader><leader>", function()
    vim.cmd("so")
end)
