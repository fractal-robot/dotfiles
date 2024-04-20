return {
	"lewis6991/gitsigns.nvim",

	config = function()
		require("gitsigns").setup({
			map,
		}
)

		vim.keymap.set("n", "<leader>pg", ':lua require("gitsigns").preview_hunk()<CR>', { desc = "[P]review [G]it" })
	end,
}
