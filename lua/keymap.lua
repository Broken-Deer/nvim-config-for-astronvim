local map = vim.keymap.set

vim.g.mapleader = " "
map({ "n", "v" }, "j", "h")
map({ "n", "v" }, "k", "j")
map({ "n", "v" }, "i", "k")
map({ "n", "v" }, "h", "i")

map({ "n", "v" }, "<A-i>", "4k")
map({ "n", "v" }, "<A-k>", "4j")
map({ "n", "v" }, "<A-j>", "9h")
map({ "n", "v" }, "<A-l>", "9l")

map("n", "k", [[v:count?'j':'gj']], { noremap = true, expr = true })
map("n", "i", [[v:count?'k':'gk']], { noremap = true, expr = true })

map({ "n", "v", "i" }, "<A-d>", "<ESC>")
map("n", "<C-a>", "ggVG")
map({ "n", "x" }, "<leader>p", '"0p')

-- :w, :q and :wq
map("n", "<leader>q", "<cmd>q<cr>")
map("n", "<leader>w", "<cmd>w<cr>")
map("n", "<leader>x", "<cmd>x<cr>")
