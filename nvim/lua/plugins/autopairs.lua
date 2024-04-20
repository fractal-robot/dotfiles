return {
	"windwp/nvim-autopairs",
	event = "InsertEnter",

config = function()
	require('nvim-autopairs').setup({
		map_c_h = false,  -- Map the <C-h> key to delete a pair
		map_c_w = false, -- map <c-w> to delete a pair if possible
	})
end
}
