return {
	"3rd/image.nvim",

	config = function()
		require("image").setup({
			backend = "kitty",
			integrations = {
				neorg = {
					enabled = true,
					clear_in_insert_mode = false,
					download_remote_images = true,
					only_render_image_at_cursor = true,
					filetypes = { "norg" },
				},
			},

			window_overlap_clear_enabled = true,

		})
	end,
}
