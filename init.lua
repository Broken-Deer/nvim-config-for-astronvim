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

vim.g.mapleader = " "

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup({
    "nvim-lualine/lualine.nvim",
    'nvim-tree/nvim-web-devicons',
    'Mofiqul/vscode.nvim'
})
require('core.keymap')
require('lualine').setup({
    options = {
        -- ...
        theme = 'vscode'
        -- ...
    }
})

require('vscode').load('dark')


