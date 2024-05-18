return {
	"jbyuki/nabla.nvim",

	config = function()
		vim.keymap.set("n", "<leader>pm", function()
			require("nabla").popup()
		end, { desc = "[P]review [M]ath" })
	end,
}
