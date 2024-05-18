return {
	"3rd/image.nvim",
	priority = 1000,
	dependencies = { "luarocks.nvim" },

	config = function()
		require("image").setup({
			backend = "kitty",
			integrations = {
				neorg = {
					enabled = true,
					download_remote_images = true,
					filetypes = { "norg" },
				},
			},

			window_overlap_clear_enabled = true, -- toggles images when windows are overlapped
			window_overlap_clear_ft_ignore = { "cmp_menu", "cmp_docs", "" },
		})
	end,
}
