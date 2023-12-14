local map = vim.keymap.set

map({ "n", "v" }, "j", "h")
map({ "n", "v" }, "k", "j")
map({ "n", "v" }, "i", "k")
map({ "n", "v" }, "h", "i")

map({ "n", "v" }, "<A-i>", "4k", opt)
map({ "n", "v" }, "<A-k>", "4j", opt)
map({ "n", "v" }, "<A-j>", "9h", opt)
map({ "n", "v" }, "<A-l>", "9l", opt)

map({"n", "v", "i"}, "<A-d>", "<ESC>")
