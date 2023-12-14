vim.opt.relativenumber = true
vim.opt.number = true
vim.opt.wrap = true
vim.opt.cursorline = true
vim.opt.mouse:append("a")
vim.opt.clipboard:append("unnamedplus")
vim.opt.wildmenu = true
vim.opt.splitright = true
vim.opt.splitbelow = true

vim.opt.ignorecase = true
vim.opt.smartcase = true

-- vim.opt.termguicolors = true
vim.opt.signcolumn = "yes"
vim.opt.showcmd = true

-- vim.g.mapleader = " "
local map = vim.keymap.set

map("n", "j", "h")
map("n", "k", "j")
map("n", "i", "k")
map("n", "h", "i")

map("n", "<A-i>", "4k", opt)
map("n", "<A-k>", "4j", opt)
map("n", "<A-j>", "9h", opt)
map("n", "<A-l>", "9l", opt)

map({"n", "v", "i"}, "<A-d>", "<ESC>")
