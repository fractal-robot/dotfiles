return {
	"stevearc/oil.nvim",
	opts = {},
	-- Optional dependencies
	dependencies = { "nvim-tree/nvim-web-devicons" },

	config = function()
		require("oil").setup({
			columns = {
				"icon",
				-- "mtime",
				-- "permissions",
				-- "size",
			},

			delete_to_trash = true,
			skip_confirm_for_simple_edits = true,
			-- :help prompt_save_on_select_new_entry
		})

		vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })
	end,
}
