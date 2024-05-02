return {
	-- "benlubas/ne:rg",
	-- branch = "reat/async_images_via_nio",
	"nvim-neorg/neorg",
	lazy = false,
	version = "*", -- Pin Neorg to the latest stable release
	dependencies = {
		-- "max397574/neorg-contexts",
		"3rd/image.nvim",
		"luarocks.nvim",
	},

	config = function()
		require("neorg").setup({
			load = {
				["core.defaults"] = {},
				["core.concealer"] = {},
				-- ["external.context"] = {},
				["core.autocommands"] = {},
				["core.integrations.treesitter"] = {},
				["core.neorgcmd"] = {},

				["core.integrations.image"] = {},
				["core.completion"] = {
					config = {
						engine = "nvim-cmp",
					},
				},
				["core.latex.renderer"] = {
					config = {
						render_on_enter = false,
					},
				},
				["core.dirman"] = {
					config = {
						workspaces = {
							notes = "~/notes",
						},
						default_workspace = "notes",
					},
				},
			},
		})

		vim.wo.foldlevel = 99
		vim.wo.conceallevel = 2
	end,
}
