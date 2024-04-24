return {
	"goolord/alpha-nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	lazy = false,
	priority = 999,

	config = function()
		require("alpha").setup(require("alpha.themes.startify").config)
	end,
}
