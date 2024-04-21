-- set mason, then mason-lspconfig, then lspconfig

return {
	{
		"neovim/nvim-lspconfig",

		dependencies = {
			{ "williamboman/mason.nvim",                  config = true }, -- NOTE: Must be loaded before dependants
			{ "williamboman/mason-lspconfig.nvim",        opts = { ensure_installed = { "lua_ls" } } },
			{ "WhoIsSethDaniel/mason-tool-installer.nvim" },
			{ "smjonas/inc-rename.nvim",                  opts = {} }, -- rename using noice.nvim
			{ "folke/neodev.nvim",                        opts = {} },
		},

		config = function()
			---------- configuration of the differents lsp

			local lspconfig = require("lspconfig")

			lspconfig.lua_ls.setup({
				-- settings = {
				-- 	Lua = {
				-- 		completion = {
				-- 			callSnippet = "Replace"
				-- 		}
				-- 	}
				-- }
			})

			---------- keybindings

			-- Global mappings.
			-- See `:help vim.diagnostic.*` for documentation on any of the below functions
			vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Go to previous [D]iagnostic message" })
			vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Go to next [D]iagnostic fillcharsmessage" })
			vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, { desc = "Show diagnostic [E]rror messages" })
			vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uickfix list" })

			-- Use LspAttach autocommand to only map the following keys
			-- after the language server attaches to the current buffer
			vim.api.nvim_create_autocmd("LspAttach", {
				group = vim.api.nvim_create_augroup("UserLspConfig", {}),
				callback = function(event)
					-- Enable completion triggered by <c-x><c-o>
					vim.bo[event.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

					local map = function(keys, func, desc)
						vim.keymap.set("n", keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
					end

					map("gd", require("telescope.builtin").lsp_definitions, "[G]oto [D]efinition")
					map("gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")

					map("gr", require("telescope.builtin").lsp_references, "[G]oto [R]eferences")
					-- map("gI", require("telescope.builtin").lsp_implementations, "[G]oto [I]mplementation")
					-- (useful when the language has ways of declaring types without an actual implementation)

					map("<leader>D", require("telescope.builtin").lsp_type_definitions, "Type [D]efinition")

					-- Fuzzy find all the symbols in the current document
					map("<leader>ds", require("telescope.builtin").lsp_document_symbols, "[D]ocument [S]ymbols")
					-- Fuzzy find all the symbols in your current workspace
					map(
						"<leader>ws",
						require("telescope.builtin").lsp_dynamic_workspace_symbols,
						"[W]orkspace [S]ymbols"
					)

					-- Execute a code action, usually your cursor needs to be on top of an error
					-- or a suggestion from your LSP for this to activate.
					map("<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction")

					-- Opens a popup that displays documentation about the word under your cursor
					--  See `:help K` for why this keymap.
					map("K", vim.lsp.buf.hover, "Hover Documentation")

					-- vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, opts)
					-- vim.keymap.set("n", "<leader>f", function()
					-- 	vim.lsp.buf.format({ async = true })
					-- end, opts)
					-- end,

					-- Highlight references of the word under the cursor
					local client = vim.lsp.get_client_by_id(event.data.client_id)
					if client and client.server_capabilities.documentHighlightProvider then
						vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
							buffer = event.buf,
							callback = vim.lsp.buf.document_highlight,
						})

						vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
							buffer = event.buf,
							callback = vim.lsp.buf.clear_references,
						})
					end
				end,
			})

			local capabilities = vim.lsp.protocol.make_client_capabilities()
			capabilities = vim.tbl_deep_extend("force", capabilities, require("cmp_nvim_lsp").default_capabilities())
		end,
	},
}
