return {
	"stevearc/oil.nvim",
	-- Optional dependencies
	dependencies = { "nvim-tree/nvim-web-devicons" },

	config = function()
		require("oil").setup({
			delete_to_trash = true,
			skip_confirm_for_simple_edits = true,

			columns = {
				"icon",
				-- "mtime",
				-- "permissions",
				-- "size",
			},

			keymaps = {
				["g?"] = "actions.show_help",
			},

			keymaps_help = {
				border = "single",
			},

			float = {
				padding = 2,
				border = "single",
			},

			preview = {
				-- Width dimensions can be integers or a float between 0 and 1 (e.g. 0.4 for 40%)
				-- min_width and max_width can be a single value or a list of mixed integer/float types.
				-- max_width = {100, 0.8} means "the lesser of 100 columns or 80% of total"
				max_width = 0.9,
				-- min_width = {40, 0.4} means "the greater of 40 columns or 40% of total"
				min_width = { 40, 0.4 },
				-- optionally define an integer/float for the exact width of the preview window
				-- Height dimensions can be integers or a float between 0 and 1 (e.g. 0.4 for 40%)
				-- min_height and max_height can be a single value or a list of mixed integer/float types.
				-- max_height = {80, 0.9} means "the lesser of 80 columns or 90% of total"
				max_height = 0.9,
				-- min_height = {5, 0.1} means "the greater of 5 columns or 10% of total"
				min_height = { 5, 0.1 },
				-- optionally define an integer/float for the exact height of the preview window
				height = nil,
				border = "single",
			},
			-- Configuration for the floating progress window
			progress = {
				border = "single",
				minimized_border = "none", -- TODO: what is this option
			},
			-- Configuration for the floating SSH window
			ssh = {
				border = "single",
			},
		})

		vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })
	end,
}
