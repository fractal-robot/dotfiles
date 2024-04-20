return {
	{
		"rcarriga/nvim-notify",

		config = function()
			require("notify").setup({
				render = "compact",
				stages = "fade",
				background_colour = "#000000",
			})
		end,
	},
	{
		"folke/noice.nvim",
		event = "VeryLazy",

		dependencies = {
			"MunifTanjim/nui.nvim",
			"rcarriga/nvim-notify",
		},

		config = function()
			require("noice").setup({
				lsp = {
					-- override markdown rendering so that **cmp** and other plugins use **Treesitter**
					override = {
						["vim.lsp.util.convert_input_to_markdown_lines"] = true,
						["vim.lsp.util.stylize_markdown"] = true,
						["cmp.entry.get_documentation"] = true, -- requires hrsh7th/nvim-cmp
					},
				},

				routes = {
					{
						filter = {
							event = "msg_show",
							kind = "",
							find = "written",
						},
						opts = { skip = true },
					},

					routes = {
						{
							filter = {
								event = "msg_show",
								kind = "search_count",
							},
							opts = { skip = true },
						},
					},
				},

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
