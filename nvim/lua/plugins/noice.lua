return {
	--[[
	{
		"rcarriga/nvim-notify",

		config = function()
			require("notify").setup({
				render = "simple",
				stages = "static",
				timeout = 4000,
				background_colour = "#000000",

				on_open = function(win)
					if vim.api.nvim_win_is_valid(win) then
						vim.api.nvim_win_set_config(win, { border = "single" })
					end
				end,
			})
		end,
	},
	--]]

	{
		"folke/noice.nvim",
		event = "VeryLazy",

		dependencies = {
			"MunifTanjim/nui.nvim",
			-- "rcarriga/nvim-notify",
		},

		config = function()
			require("noice").setup({
				presets = { inc_rename = true },

				lsp = {
					-- override markdown rendering so that **cmp** and other plugins use **Treesitter**
					override = {
						["vim.lsp.util.convert_input_to_markdown_lines"] = true,
						["vim.lsp.util.stylize_markdown"] = true,
						["cmp.entry.get_documentation"] = true, -- requires hrsh7th/nvim-cmp
					},
				},

				messages = {
					view = "mini",          -- default view for messages
					view_error = "notify",  -- view for errors
					view_warn = "notify",   -- view for warnings
					view_history = "messages", -- view for :messages
					view_search = "virtualtext", -- view for search count messages. Set to `false` to disable
				},

				--[[
				routes = {
					{
						filter = {
							event = "msg_show",
							kind = "",
							find = "written",
						},
						opts = { skip = true },
					},
					{
						filter = {
							find = "-- VISUAL --",
						},
						opts = { skip = true },
					},
					{
						filter = {
							find = "lines yanked",
						},
						opts = { skip = true },
					},
					{
						filter = {
							find = "E486",
						},
						opts = { skip = true },
					},
					{
						filter = {
							find = "1 change: before",
						},
						opts = { skip = true },
					},
					{
						filter = {
							find = "1 change: after",
						},
						opts = { skip = true },
					},
				},
				--]]

				views = {
					cmdline_popup = {
						border = {
							style = "single",
						},
					},
				},
			})
		end,
	},
}
