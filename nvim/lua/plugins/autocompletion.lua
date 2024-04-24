return {
	{
		-- view lsp-config.lua for setting the lsp capabilities
		"hrsh7th/cmp-nvim-lsp",
	},

	{
		"L3MON4D3/LuaSnip",
		build = (function()
			-- Build Step is needed for regex support in snippets.
			if vim.fn.executable("make") == 0 then
				return
			end
			return "make install_jsregexp"
		end)(),

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
				completion = { completeopt = "menu,noinsert" },

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
					expand = function(args) -- the function that will be executed when expand					expand = function(args)              -- the function that will be executed when expand
						require("luasnip").lsp_expand(args.body) -- snippet engine
					end,
				},

				view = {
					entries = { name = "custom", selection_order = "near_cursor" },
				},

				mapping = cmp.mapping.preset.insert({
					-- Scroll the documentation window
					["<C-b>"] = cmp.mapping.scroll_docs(-4),
					["<C-f>"] = cmp.mapping.scroll_docs(4),

					["<C-Space>"] = cmp.mapping.complete(),
					["<C-e>"] = cmp.mapping.abort(),
					["<CR>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.

					-- Think of <c-l> as moving to the right of your snippet expansion.
					--  So if you have a snippet that's like:
					--  function $name($args)
					--    $body
					--  end
					--
					-- <c-l> will move you to the right of each of the expansion locations.
					-- <c-h> is similar, except moving you backwards.
					["<C-l>"] = cmp.mapping(function()
						if cmp.expand_or_locally_jumpable() then
							cmp.expand_or_jump()
						end
					end, { "i", "s" }),

					["<C-h>"] = cmp.mapping(function()
						if cmp.locally_jumpable(-1) then
							cmp.jump(-1)
						end
					end, { "i", "s" }),

					-- For more advanced Luasnip keymaps (e.g. selecting choice nodes, expansion) see:
					--    https://github.com/L3MON4D3/LuaSnip?tab=readme-ov-file#keymaps
				}),

				-- sets the sources of the autocompletion
				sources = cmp.config.sources({
					-- cmp-nvim-lsp has more advanced support, by supporting more types of completion candidates
					{ name = "nvim_lsp" },
					{ name = "luasnip" }, -- For luasnip users.
					{ name = "neorg" },
					{ name = "path" },
					-- { name = "buffer" },
				}, {
					{ name = "buffer" },
				}),
			})
		end,
	},
}
