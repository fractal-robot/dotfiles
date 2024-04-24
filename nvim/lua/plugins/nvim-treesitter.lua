return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",

	config = function()
		require("nvim-treesitter.configs").setup({
			auto_install = true,
			ensure_installed = { "c", "lua", "vimdoc", "vim", "markdown" },

			borderchars = { "─", "│", "─", "│", "┌", "┐", "┘", "└" },

			highlight = { enable = true },
		})
	end,
}
