return {
	{
		"ggandor/flit.nvim",

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
