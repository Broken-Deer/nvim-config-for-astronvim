return {
	{
		"AstroNvim/astroui",
		---@type AstroUIOpts
		opts = {
			-- add new user interface icon
			icons = {
				VimIcon = "",
				ScrollText = "",
				GitBranch = "",
				GitAdd = "",
				GitChange = "",
				GitDelete = "",
			},
			-- modify variables used by heirline but not defined in the setup call directly
			status = {
				-- define the separators between each section
				separators = {
					left = { "", "" }, -- separator for the left side of the statusline
					right = { "", "" }, -- separator for the right side of the statusline
					tab = { "", "" },
					left_only = { "", "" },
					right_only = { "", "" },
				},
				-- add new colors that can be used by heirline
				colors = function(hl)
					local get_hlgroup = require("astroui").get_hlgroup
					-- use helper function to get highlight group properties
					hl.blank_bg = get_hlgroup("Folded").fg
					hl.file_info_bg = get_hlgroup("Visual").bg
					hl.nav_icon_bg = get_hlgroup("String").fg
					hl.nav_fg = hl.nav_icon_bg
					hl.folder_icon_bg = get_hlgroup("Error").fg
					return hl
				end,
				attributes = {
					mode = { bold = true },
				},
				icon_highlights = {
					file_icon = {
						statusline = false,
					},
				},
			},
		},
	},
	{
		"rebelot/heirline.nvim",
		opts = function(_, opts)
			local status = require("astroui.status")
			opts.winbar = { -- create custom winbar
				-- store the current buffer number
				init = function(self)
					self.bufnr = vim.api.nvim_get_current_buf()
				end,
				fallthrough = false, -- pick the correct winbar based on condition
				-- inactive winbar
				{
					condition = function()
						return not status.condition.is_active()
					end,
					-- show the path to the file relative to the working directory
					status.component.separated_path({
						path_func = status.provider.filename({ modify = ":.:h" }),
					}),
					-- add the file name and icon
					status.component.file_info({
						file_icon = {
							hl = status.hl.file_icon("winbar"),
							padding = { left = 0 },
						},
						filename = {},
						filetype = false,
						file_modified = false,
						file_read_only = false,
						hl = status.hl.get_attributes("winbarnc", true),
						surround = false,
						update = "BufEnter",
					}),
				},
				-- active winbar
				{
					-- show the path to the file relative to the working directory
					status.component.separated_path({
						path_func = status.provider.filename({ modify = ":.:h" }),
					}),
					-- add the file name and icon
					status.component.file_info({ -- add file_info to breadcrumbs
						file_icon = { hl = status.hl.filetype_color, padding = { left = 0 } },
						filename = {},
						filetype = false,
						file_modified = false,
						file_read_only = false,
						hl = status.hl.get_attributes("winbar", true),
						surround = false,
						update = "BufEnter",
					}),
					-- show the breadcrumbs
					status.component.breadcrumbs({
						icon = { hl = true },
						hl = status.hl.get_attributes("winbar", true),
						prefix = true,
						padding = { left = 0 },
					}),
				},
			}
			opts.statusline = {
				-- default highlight for the entire statusline
				hl = { fg = "fg", bg = "bg" },
				-- each element following is a component in astroui.status module

				-- add the vim mode component
				status.component.mode({
					-- enable mode text with padding as well as an icon before it
					mode_text = {
						icon = { kind = "VimIcon", padding = { right = 1, left = 1 } },
					},
					padding = { right = 1 },
					-- surround the component with a separators
					surround = {
						-- it's a left element, so use the left separator
						separator = "left",
						-- set the color of the surrounding based on the current mode using astronvim.utils.status module
						color = function()
							return { main = status.hl.mode_bg() }
							-- return { main = status.hl.mode_bg(), right = "blank_bg" }
						end,
					},
				}),
				-- we want an empty space here so we can use the component builder to make a new section with just an empty string
				status.component.builder({
					{ provider = " " },
					-- define the surrounding separator and colors to be used inside of the component
					-- and the color to the right of the separated out section
					-- surround = {
					-- color = function()
					-- 	return { main = status.hl.mode_bg(), right = "blank_bg" }
					-- end,
					-- },
				}),
				-- add a component for the current git branch if it exists and use no separator for the sections
				status.component.git_branch({
					git_branch = { padding = { left = 1 } },
					surround = { separator = "none" },
				}),
				-- add a component for the current git diff if it exists and use no separator for the sections
				status.component.git_diff({
					padding = { left = 1 },
					surround = { separator = "none" },
				}),
				-- fill the rest of the statusline
				-- the elements after this will appear in the middle of the statusline
				status.component.fill(),
				-- A function to build a set of children components for information shown in the cmdline
				status.component.cmd_info(),
				-- add a component to display if the LSP is loading, disable showing running client names, and use no separator
				status.component.lsp({
					lsp_client_names = false,
					surround = { separator = "none", color = "bg" },
				}),
				-- add a component for the current diagnostics if it exists and use the right separator for the section
				status.component.diagnostics({ surround = { separator = "right" }, padding = { right = 1 } }),
				-- add a component to display LSP clients, disable showing LSP progress, and use the right separator
				status.component.lsp({
					lsp_progress = false,
					padding = { right = 1 },
					surround = { separator = "right" },
				}),
				-- NvChad has some nice icons to go along with information, so we can create a parent component to do this
				-- all of the children of this table will be treated together as a single component
				{
					flexible = 1,
					{
						status.component.builder({
							{ provider = "" },
							surround = { separator = "left_only", color = "file_info_bg" },
						}),
						-- add a file information component and only show the current working directory name
						status.component.file_info({
							-- we only want filename to be used and we can change the fname
							-- function to get the current working directory name
							--
							filename = {
								fname = function(nr)
									return vim.fn.getcwd(nr)
								end,
								padding = { left = 1, right = 1 },
							},
							-- disable all other elements of the file_info component
							filetype = false,
							file_icon = false,
							file_modified = false,
							file_read_only = false,
							-- use no separator for this part but define a background color
							surround = {
								separator = "none",
								condition = false,
							},
						}),
						status.component.builder({
							{ provider = "" },
							surround = { separator = "right_only", color = "file_info_bg" },
						}),
					},
				},
				status.component.builder({ provider = " " }),
				status.component.builder({
					{
						provider = function()
							local time = os.date("%H:%M:%S") -- show hour and minute in 24 hour format
							---@cast time string
							return status.utils.stylize("󰥔 " .. time)
						end,
					},
					update = { -- update should happen when the mode has changed as well as when the time has changed
						"User", -- We can use the User autocmd event space to tell the component when to update
						"ModeChanged",
						callback = vim.schedule_wrap(function(_, args)
							if -- update on user UpdateTime event and mode change
									(args.event == "User" and args.match == "UpdateTime")
									or (args.event == "ModeChanged" and args.match:match(".*:.*"))
							then
								vim.cmd.redrawstatus() -- redraw on update
							end
						end),
					},
					hl = status.hl.get_attributes("mode"),                    -- highlight based on mode attributes
					surround = { separator = "right", color = status.hl.mode_bg }, -- background highlight based on mode
				}),
			}
			vim.uv.new_timer():start(  -- timer for updating the time
				0,                       -- offset timer based on current seconds past the minute
				1000,                    -- update every seconds
				vim.schedule_wrap(function()
					vim.api.nvim_exec_autocmds( -- emit our new User event
						"User",
						{ pattern = "UpdateTime", modeline = false }
					)
				end)
			)
		end,
	},
}
