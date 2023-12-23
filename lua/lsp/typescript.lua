require("typescript-tools").setup({})

local keymap = vim.keymap

keymap.set("n", "<leader>m", "<cmd>TSToolsOrganizeImports<cr>")
keymap.set("n", "<leader>a", "<cmd>TSToolsAddMissingImports<cr>")
