return {
	"neovim/nvim-lspconfig",

	dependencies = {
		{ "williamboman/mason.nvim", config = true },
		{ "williamboman/mason-lspconfig.nvim", opts = { ensure_installed = { "lua_ls" } } },
		{ "WhoIsSethDaniel/mason-tool-installer.nvim" },
		{ "smjonas/inc-rename.nvim", opts = {} }, -- rename using noice.nvim
		{ "folke/neodev.nvim", opts = {} },
	},

	config = function()
		-- See `:help lspconfig-all` for a list of all the pre-configured LSPs

		--  Add any additional override configuration in the following tables. Available keys are:
		--  -> cmd (table): Override the default command used to start the server
		--  -> filetypes (table): Override the default list of associated filetypes for the server
		--  -> capabilities (table): Override fields in capabilities. Can be used to disable certain LSP features.
		--  -> settings (table): Override the default settings passed when initializing the server.
		--        For example, to see the options for `lua_ls`, you could go to: https://luals.github.io/wiki/settings/

		local servers = {
			clangd = {},
			lua_ls = {

				-- cmd = {...},
				-- filetypes = { ...},
				-- capabilities = {},
				settings = {
					Lua = {
						completion = {
							callSnippet = "Replace",
						},
						-- You can toggle below to ignore Lua_LS's noisy `missing-fields` warnings
						diagnostics = { disable = { "missing-fields" } },
					},
				},
			},

			bashls = {},
			pyright = {},
		}
		-- Keybindings
		-- Global mappings.
		-- See `:help vim.diagnostic.*` for documentation on any of the below functions
		vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Go to previous [D]iagnostic message" })
		vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Go to next [D]iagnostic fillcharsmessage" })
		vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, { desc = "Show diagnostic [E]rror messages" })
		vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uickfix list" })

		vim.keymap.set("n", "<leader>r", ":IncRename ", { desc = "LSP: [R]ename" })

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
				map("<leader>d", require("telescope.builtin").lsp_document_symbols, "[D]ocument Symbols")
				-- Fuzzy find all the symbols in your current workspace
				map("<leader>w", require("telescope.builtin").lsp_dynamic_workspace_symbols, "[W]orkspace Symbols")

				-- Execute a code action, usually your cursor needs to be on top of an error
				-- or a suggestion from your LSP for this to activate.
				map("<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction")

				-- Opens a popup that displays documentation about the word under your cursor
				--  See `:help K` for why this keymap.
				map("K", vim.lsp.buf.hover, "Hover Documentation")

				-- vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, opts)

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

				function _G.toggle_diagnostics()
					vim.diagnostic.enable(not vim.diagnostic.is_enabled())
					local state = vim.diagnostic.is_enabled() and "enabled" or "disabled"
					vim.notify("Diagnostics " .. state, vim.log.levels.INFO)
				end

				map("<leader>td", toggle_diagnostics, "Toggle [D]iagnostics")
			end,
		})

		local capabilities = vim.lsp.protocol.make_client_capabilities()
		capabilities = vim.tbl_deep_extend("force", capabilities, require("cmp_nvim_lsp").default_capabilities())

		require("mason").setup()

		local ensure_installed = vim.tbl_keys(servers or {})
		vim.list_extend(ensure_installed, {
			"stylua", -- Used to format Lua code
		})
		require("mason-tool-installer").setup({ ensure_installed = ensure_installed })

		require("mason-lspconfig").setup({
			handlers = {
				function(server_name)
					local server = servers[server_name] or {}
					-- Override only values explicitly passed by the server configuration above.
					server.capabilities = vim.tbl_deep_extend("force", {}, capabilities, server.capabilities or {})
					require("lspconfig")[server_name].setup(server)
				end,
			},
		})

		require("lspconfig").ltex.setup({
			settings = {
				ltex = {
					language = "en-US",
					additionalRules = {
						languageModel = "~/system/models/ngrams/",
					},
				},
			},
		})
	end,
}
