return {
	{
		"nvim-telescope/telescope.nvim",
		event = "VimEnter",
		branch = "0.1.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-telescope/telescope-ui-select.nvim",
			"nvim-tree/nvim-web-devicons",
			"davvid/telescope-git-grep.nvim",
			{
				"nvim-telescope/telescope-fzf-native.nvim",
				build = "make",
				-- `cond` is a condition used to determine whether this plugin should be
				-- installed and loaded.
				cond = function()
					return vim.fn.executable("make") == 1
				end,
			},
		},

		config = function()
			require("telescope").setup({
				defaults = {
					borderchars = { "─", "│", "─", "│", "┌", "┐", "┘", "└" },

					layout_strategy = "vertical",
					layout_config = { height = 0.99, width = 0.99 },
				},

				extensions = {
					["ui-select"] = {
						require("telescope.themes").get_dropdown(),
					},

					git_grep = {
						regex = "fixed", -- unless I know how to use regex
						skip_binary_files = true,
					},
				},
			})

			pcall(require("telescope").load_extension, "fzf")
			pcall(require("telescope").load_extension, "ui-select")
			pcall(require("telescope").load_extension("git_grep"))

			local builtin = require("telescope.builtin")
			local git_grep = require("git_grep")

			-- Using git
			vim.keymap.set("n", "<leader>sf", builtin.git_files, { desc = "[S]earch [F]iles" })
			vim.keymap.set("n", "<leader>sc", git_grep.live_grep, { desc = "[S]earch [C]ontent" })
			vim.keymap.set("n", "<leader>sw", git_grep.grep, { desc = "[S]earch current [W]ord (or selection)" })

			vim.keymap.set("n", "<leader>sd", builtin.diagnostics, { desc = "[S]earch [D]iagnostics" })
			vim.keymap.set("n", "<leader>s.", builtin.oldfiles, { desc = '[S]earch Recent Files ("." for repeat)' })
			vim.keymap.set("n", "<leader>sb", builtin.buffers, { desc = "[S]earch [B]uffers" })
			vim.keymap.set(
				"n",
				"<leader>/",
				builtin.current_buffer_fuzzy_find,
				{ desc = "[/] Fuzzily search in current buffer" }
			)
			vim.keymap.set("n", "<leader>sn", function()
				builtin.find_files({ cwd = vim.fn.stdpath("config") })
			end, { desc = "[S]earch [N]eovim files" })
		end,
	},
}
