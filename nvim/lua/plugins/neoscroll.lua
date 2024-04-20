return {
	"karb94/neoscroll.nvim",
	config = function()
		require("neoscroll").setup({
			mappings = {'<C-u>', '<C-d>', '<C-b>', '<C-f>',
                '<C-y>', '<C-e>', 'zt', 'zz', 'zb'},

			hide_cursor = true, -- Hide cursor while scrolling
			easing_function = nil, -- Default easing function
		})
	end,
}
