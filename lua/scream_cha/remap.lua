vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex, { desc = 'open explorer window netrw' })

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = 'move selection down with indentation' })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = 'move selection up with indentation' })

vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = 'half-page down with cursor in the middle' })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = 'half-page up with cursor in the middle' })
vim.keymap.set("n", "n", "nzzzv", { desc = 'to the next selection with cursor in the middle' })
vim.keymap.set("n", "N", "Nzzzv", { desc = 'to the previous selection with cursor in the middle' })
vim.keymap.set("n", "//", ":nohlsearch<CR>", { desc = "Clear search highlight" })

vim.keymap.set("n", "Q", "<nop>")
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)

-- navigation
vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")

vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true, desc = 'make current file executable' })
vim.keymap.set("n", "<leader><leader>", function()
    vim.cmd("so")
end)

vim.keymap.set("n", '<Tab>', ":tabn<CR>", { desc = "Move to the next tab" })
vim.keymap.set("n", '<S-Tab>', ":tabp<CR>", { desc = "Move to the prev tab" })

vim.keymap.set("n", "<leader>ss", ":split<CR>", { desc = "Split buffer" })
vim.keymap.set("n", "<leader>vs", ":vsplit<CR>", { desc = "Vertically split buffer" })

vim.keymap.set("n", "<C-h>", "<C-W>h", { desc = "Go to left window" })
vim.keymap.set("n", "<C-j>", "<C-W>j", { desc = "Go to lower window" })
vim.keymap.set("n", "<C-k>", "<C-W>k", { desc = "Go to upper window" })
vim.keymap.set("n", "<C-l>", "<C-W>l", { desc = "Go to right window" })

vim.keymap.set("v", "<leader>cb", '"*y', { desc = "Copy to system clipboard" })
vim.keymap.set("n", "x", '"_x', { desc = 'erase one character without rewriting the clipboard' })

vim.keymap.set("n", "<F12>", "<cmd>Neotree toggle<CR>", { desc = "Toggle NeoTree" })
