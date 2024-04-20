-- enable on buffer that has no filetype: https://github.com/norcalli/nvim-colorizer.lua?tab=readme-ov-file#caveats

return {
	"norcalli/nvim-colorizer.lua",

	config = function()
		require("colorizer").setup(nil, {name = false})
	end,
}
