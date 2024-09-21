if not vim.g.neovide then
	return {} -- do nothing if not in a Neovide session
end

return {
	"AstroNvim/astrocore",
	opts = {
		options = {
			g = {
				neovide_text_gamma = 0.8,
				neovide_text_contrast = 0.8,
				neovide_transparency = 0.9,
				neovide_hide_mouse_when_typing = true,
				neovide_cursor_vfx_mode = "torpedo",
			},
			o = {
				guifont = "FiraCode Nerd Font:h14",
			},
		},
	},
}
