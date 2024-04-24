return {
	"stevearc/conform.nvim",
	lazy = false,

	config = function()
		require("conform").setup({
			opts = {
				notify_on_error = true,

				--[[
				format_on_save = function(bufnr)
					-- Disable "format_on_save lsp_fallback" for languages that don't
					-- have a well standardized coding style. You can add additional
					-- languages here or re-enable it for the disabled ones.
					local disable_filetypes = { c = true, cpp = true }
					return {
						timeout_ms = 500,
						lsp_fallback = not disable_filetypes[vim.bo[bufnr].filetype],
					}
				end,

				formatters = {
					neorg = {
						command = "norg-fmt",
						args = { "$FILENAME" },
						stdin = false,
						cwd = require("conform.util").root_file({ ".editorconfig", "package.json" }),
						require_cwd = true,
					},
				},
				--]]

				-- :help conform-formatters
				formatters_by_ft = {
					lua = { "stylua" },
					c = { "clang-format" },
					cpp = { "clang-format" },
					-- sh = { "beautysh" }, -- TODO: make it work
					-- norg = { "neorg" },
					python = { "isort", "black" },
				},
			},
		})
	end,

	keys = {
		{

			"<leader>f",
			function()
				require("conform").format({ async = true, lsp_fallback = true })
			end,
			mode = "",
			desc = "[F]ormat buffer",
		},
	},
}
