return {
	"lewis6991/gitsigns.nvim",

	config = function()
		require("gitsigns").setup({
			signs = {
				add = { text = "+" },
				change = { text = "~" },
				delete = { text = "_" },
				topdelete = { text = "‾" },
				changedelete = { text = "~" },
			},
		})

		vim.keymap.set("n", "<leader>pg", ':lua require("gitsigns").preview_hunk()<CR>', { desc = "[P]review [G]it" })
	end,
}
