return {
	"jbyuki/nabla.nvim",

	config = function()
		vim.keymap.set("n", "<leader>pm", ':lua require("nabla").popup()<CR>', { desc = "[P]review [M]ath" })
	end,
}
