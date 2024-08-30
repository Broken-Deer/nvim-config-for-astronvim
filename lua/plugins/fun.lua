return {
	"Eandrju/cellular-automaton.nvim",
	keys = "<leader>fun",
	config = function()
		vim.keymap.set("n", "<leader>fun", "<cmd>CellularAutomaton make_it_rain<CR>")
	end,
}
