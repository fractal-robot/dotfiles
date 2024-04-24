return {

	{
		"jinh0/eyeliner.nvim",
		config = function()
			require("eyeliner").setup({
				highlight_on_key = true,
				dim = true,
			})
		end,
	},

	{
		"ggandor/flit.nvim",
		enabled = false, -- NOTE: disabled
		dependencies = { "ggandor/leap.nvim" },

		config = function()
			require("flit").setup({
				labeled_modes = "nv",
				multiline = true,
			})
		end,
	},

	{
		"ggandor/leap.nvim",
		dependencies = { "tpope/vim-repeat" },

		config = function()
			require("leap").create_default_mappings()
		end,
	},
}
