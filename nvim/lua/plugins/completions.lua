return {
	{
		-- view lsp-config.lua for setting the lsp capabilities
		"hrsh7th/cmp-nvim-lsp",
	},

	{
		"L3MON4D3/LuaSnip",

		dependencies = {
			"saadparwaiz1/cmp_luasnip",
			"rafamadriz/friendly-snippets",
		},
	},

	{
		"hrsh7th/nvim-cmp",

		dependencies = {
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-buffer",
			"onsails/lspkind.nvim",
		},

		config = function()
			local cmp = require("cmp")
			local lspkind = require("lspkind")
			require("luasnip.loaders.from_vscode").lazy_load()

			cmp.setup({

				formatting = {
					format = lspkind.cmp_format({
						mode = "symbol_text",
						-- switch to (once ready:)
						-- mode = "symbol",

						ellipsis_char = "...",
						show_labelDetails = true,
					}),
				},

				snippet = {
					-- REQUIRED - you must specify a snippet engine
					expand = function(args)              -- the function that will be executed when expand					expand = function(args)              -- the function that will be executed when expand
						require("luasnip").lsp_expand(args.body) -- snippet engine
					end,
				},

				view = {
					entries = { name = "custom", selection_order = "near_cursor" },
				},

				mapping = cmp.mapping.preset.insert({
					-- scroll the documentation window 
					["<C-b>"] = cmp.mapping.scroll_docs(-4),
					["<C-f>"] = cmp.mapping.scroll_docs(4),
					["<C-Space>"] = cmp.mapping.complete(),
					["<C-e>"] = cmp.mapping.abort(),
					["<CR>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
				}),

				-- sets the sources of the autocompletion
				sources = cmp.config.sources({
					-- cmp-nvim-lsp has more advanced support, by supporting more types of completion candidates
					{ name = "nvim_lsp" },
					{ name = "luasnip" }, -- For luasnip users.
					{ name = "neorg" },
					{ name = "path" },
					{ name = "buffer" },
				}, {
					{ name = "buffer" },
				}),
			})
		end,
	},
}
