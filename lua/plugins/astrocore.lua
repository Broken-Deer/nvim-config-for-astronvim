-- AstroCore provides a central place to modify mappings, vim options, autocommands, and more!
--Configuration documentation can be found with `:h astrocore`
-- NOTE: We highly recommend setting up the Lua Language Server (`:LspInstall lua_ls`)
--       as this provides autocomplete and documentation while editing
---@type LazySpec
return {
	"AstroNvim/astrocore",
	---@type AstroCoreOpts
	opts = {
		-- Configure core features of AstroNvim
		features = {
			large_buf = { size = 1024 * 256, lines = 10000 }, -- set global limits for large files for disabling features like treesitter
			autopairs = true, -- enable autopairs at start
			cmp = true, -- enable completion at start
			diagnostics_mode = 3, -- diagnostic mode on start (0 = off, 1 = no signs/virtual text, 2 = no virtual text, 3 = on)
			highlighturl = true, -- highlight URLs at start
			notifications = true, -- enable notifications at start
		},
		-- Diagnostics configuration (for vim.diagnostics.config({...})) when diagnostics are on
		diagnostics = {
			virtual_text = true,
			underline = true,
		},
		-- vim options can be configured here
		options = {
			opt = { -- vim.opt.<key>
				relativenumber = true, -- sets vim.opt.relativenumber
				number = true, -- sets vim.opt.number
				spell = false, -- sets vim.opt.spell
				scrolloff = 3,
				sidescrolloff = 3,
				signcolumn = "yes", -- sets vim.opt.signcolumn to yes
				wrap = false, -- sets vim.opt.wrap
				showcmd = true,
			},
			g = { -- vim.g.<key>
				-- configure global vim variables (vim.g)
				-- NOTE: `mapleader` and `maplocalleader` must be set in the AstroNvim opts or before `lazy.setup`
				-- This can be found in the `lua/lazy_setup.lua` file
				neovide_text_gamma = 0.8,
				neovide_text_contrast = 0.8,
				neovide_transparency = 0.9,
				neovide_hide_mouse_when_typing = true,
				neovide_cursor_vfx_mode = "torpedo",
			},
			o = {
				guifont = "FiraCode Nerd Font Mono:h14",
			},
		},
		-- Mappings can be configured through AstroCore as well.
		-- NOTE: keycodes follow the casing in the vimdocs. For example, `<Leader>` must be capitalized
		mappings = {
			-- first key is the mode
			n = {
				-- second key is the lefthand side of the map

				-- navigate buffer tabs
				["]b"] = {
					function()
						require("astrocore.buffer").nav(vim.v.count1)
					end,
					desc = "Next buffer",
				},
				["[b"] = {
					function()
						require("astrocore.buffer").nav(-vim.v.count1)
					end,
					desc = "Previous buffer",
				},

				-- mappings seen under group name "Buffer"
				["<Leader>bd"] = {
					function()
						require("astroui.status.heirline").buffer_picker(function(bufnr)
							require("astrocore.buffer").close(bufnr)
						end)
					end,
					desc = "Close buffer from tabline",
				},

				-- tables with just a `desc` key will be registered with which-key if it's installed
				-- this is useful for naming menus
				["<Leader>b"] = { desc = "Buffers" },

				-- setting a mapping to false will disable it
				-- ["<C-S>"] = false,
				["<Leader>c"] = {
					function()
						local bufs = vim.fn.getbufinfo({ buflisted = true })
						require("astrocore.buffer").close(0)
						if require("astrocore").is_available("alpha-nvim") and not bufs[2] then
							require("alpha").start()
						end
					end,
					desc = "Close buffer",
				},
				["`"] = { "~" },
				-- Neovide full screen
				["<F11>"] = { "<cmd>let g:neovide_fullscreen = !g:neovide_fullscreen<CR>" },

				-- Qwerty Keymaps
				["<C-K>"] = { "5<C-y>" },
				["<C-J>"] = { "5<C-e>" },
				["<A-j>"] = { "ddp" }, -- NOTE: You need add "xterm*metaSendsEscape: true" to ~/.Xdefaults and run "xrdb -l ~/.Xdefaults"
				["<A-k>"] = { "ddkP" },
				["j"] = { [[v:count?'j':'gj']], desc = "" },
				["k"] = { [[v:count?'k':'gk']], desc = "" },
				["J"] = { "5j", desc = "" },
				["K"] = { "5k", desc = "" },
				["H"] = { "0" },
				["L"] = { "$" },
				["c,."] = { "c%" },
				["<Leader>sw"] = { "<cmd>set wrap<CR>" },
				["<C-A>"] = { "ggVG" },
				["<A-o>"] = { "o<esc>k$" },
				-- Windows
				["<leader>w"] = { desc = "Window Move" },
				["<leader>wk"] = { "<C-w>k" },
				["<leader>wj"] = { "<C-w>j" },
				["<leader>wh"] = { "<C-w>h" },
				["<leader>wl"] = { "<C-w>l" },
				["<up>"] = { "<cmd>res -1<CR>" },
				["<down>"] = { "<cmd>res +1<CR>" },
				["<left>"] = { "<cmd>vertical resize+1<CR>" },
				["<right>"] = { "<cmd>vertical resize-1<CR>" },
				-- Buffers
				["<C-W>"] = { "<Leader>c" },
				-- Others
				["<Leader>k"] = { "K" },

				-- Colemak Keymaps
				-- Movement
				-- ["u"] = { "k" },
				-- ["e"] = { "j" },
				-- ["n"] = { "h" },
				-- ["i"] = { "l" },
				-- ["U"] = { "5k" },
				-- ["E"] = { "5j" },
				-- ["N"] = { "0" },
				-- ["I"] = { "$" },
				-- ["h"] = { "e" },
				-- ["<C-U>"] = { "5<C-y>" },
				-- ["<C-E>"] = { "5<C-e>" },
				-- ["ci"] = { "cl" },
				-- ["cn"] = { "ch" },
				-- ["ck"] = { "ci" },
				-- ["c,."] = { "c%" },
				-- ["yh"] = { "ye" },
				-- Actions
				-- ["l"] = { "u" },
				-- ["k"] = { "i" },
				-- ["K"] = { "I" },

				-- Buffers FIXME:
				-- ["<C-W>"] = { "<Leader>c" },

				-- Others
				-- ["<Leader>sw"] = { "<cmd>set wrap<CR>" },
				-- ["<C-A>"] = { "ggVG" },
				-- ["J"] = { "K" },
			},
			v = {
				["`"] = { "~" },
				-- Neovide full screen
				["<F11>"] = { "<cmd>let g:neovide_fullscreen = !g:neovide_fullscreen<CR>" },

				-- Qwerty Keymaps
				["J"] = { "5j" },
				["K"] = { "5k" },
				["H"] = { "0" },
				["L"] = { "$" },
				["<C-J>"] = { "5<C-y>" },
				["<C-K>"] = { "5<C-e>" },
				-- Actions
				["<C-A>"] = { "<ESC> ggVG" },

				-- Colemak Keymaps
				-- Movement
				-- ["u"] = { "k" },
				-- ["e"] = { "j" },
				-- ["n"] = { "h" },
				-- ["i"] = { "l" },
				-- ["U"] = { "5k" },
				-- ["E"] = { "5j" },
				-- ["N"] = { "0" },
				-- ["I"] = { "$" },
				-- ["h"] = { "e" },
				-- ["<C-U>"] = { "5<C-y>" },
				-- ["<C-E>"] = { "5<C-e>" },
				-- Actions
				-- ["k"] = { "i" },
				-- ["K"] = { "I" },
				-- ["<C-A>"] = { "<ESC>ggVG" },
			},
			i = {
				["<c-y>"] = { "<ESC>A {}<ESC>i<CR><ESC>ko" },
				["<c-v>"] = { "<ESC>pa" },
				-- Neovide full screen
				["<F11>"] = { "<cmd>let g:neovide_fullscreen = !g:neovide_fullscreen<CR>" },

				-- Qwerty Keymaps
				["<c-h>"] = { "<esc>I" },
				["<c-l>"] = { "<esc>A" },

				-- Colemak Keymaps
				-- ["<c-n>"] = { "<ESC>A" },
				-- ["<c-i>"] = { "<ESC>I" },
			},
		},
	},
}
