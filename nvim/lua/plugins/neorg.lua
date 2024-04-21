return {
	--[[ {
		"vhyrro/luarocks.nvim",
		priority = 1000, -- We'd like this plugin to load first out of the rest
		config = true, -- This automatically runs `require("luarocks-nvim").setup()`
	}, --]]
	{
		"nvim-neorg/neorg",
		-- put any other flags you wanted to pass to lazy here!
		config = function()
			require("neorg").setup({
				load = {
					["core.defaults"] = {},

					["core.completion"] = {
						config = {
							engine = "nvim-cmp",
						},
					},

					["core.concealer"] = {},

					-- ["core.latex.renderer"] = {
					-- 	config = {
					-- 		render_on_enter = false,
				  --	},
					-- },

					-- ["core.autocommands"] = {},
					-- ["core.integrations.treesitter"] = {},
					-- ["core.neorgcmd"] = {},
					-- ["core.integrations.image"] = {},

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
	},
}
