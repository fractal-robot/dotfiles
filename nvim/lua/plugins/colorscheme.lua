return {
	{
		"rose-pine/neovim",
		name = "rose-pine",
		enabled = true,

		config = function()
			require("rose-pine").setup({
				variant = "main",
				dark_variant = "main",
				dim_inactive_windows = false,
				extend_background_behind_borders = true,

				enable = {
					terminal = true,
					legacy_highlights = false,
					migrations = true,
				},

				styles = {
					bold = true,
					italic = true,
					transparency = true,
				},

				groups = {
					border = "muted",
					link = "iris",
					panel = "surface",

					error = "love",
					hint = "iris",
					info = "foam",
					note = "pine",
					todo = "rose",
					warn = "gold",

					git_add = "foam",
					git_change = "rose",
					git_delete = "love",
					git_dirty = "rose",
					git_ignore = "muted",
					git_merge = "iris",
					git_rename = "pine",
					git_stage = "iris",
					git_text = "rose",
					git_untracked = "subtle",

					h1 = "iris",
					h2 = "foam",
					h3 = "rose",
					h4 = "gold",
					h5 = "pine",
					h6 = "foam",
				},

				highlight_groups = {
					-- Comment = { fg = "foam" },
					-- VertSplit = { fg = "muted", bg = "muted" },
					NoiceMini = { bg = "surface" },
				},
			})

			-- vim.cmd.colorscheme("rose-pine")
			-- vim.cmd.colorscheme("gruvbox-material")
		end,
	},

	{
		"f4z3r/gruvbox-material.nvim",
		name = "gruvbox-material",
		lazy = false,
		priority = 1000,

		config = function()
			require("gruvbox-material").setup({
				italics = true, -- enable italics in general
				contrast = "medium",
				comments = {
					italics = true, -- enable italic comments
				},
				background = {
					transparent = true, -- set the background to transparent
				},
				float = {
					force_background = false, -- force background on floats even when background.transparent is set
					background_color = nil, -- set color for float backgrounds. If nil, uses the default color set
					-- by the color scheme
				},
			})
			vim.cmd("colorscheme gruvbox-material")
		end,
	},
}
