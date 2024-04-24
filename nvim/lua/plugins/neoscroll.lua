return {
	"karb94/neoscroll.nvim",
	config = function()
		require("neoscroll").setup({
			mappings = { "<C-u>", "<C-d>", "<C-b>", "<C-f>", "zt", "zz", "zb" },

			easing_function = nil, -- Default easing function
			stop_eof = true,
		})

		local t = {}
		-- Syntax: t[keys] = {function, {function arguments}}
		t["<C-u>"] = { "scroll", { "-vim.wo.scroll", "true", "120" } }
		t["<C-d>"] = { "scroll", { "vim.wo.scroll", "true", "120" } }
		t["<C-b>"] = { "scroll", { "-vim.api.nvim_win_get_height(0)", "true", "120" } }
		t["<C-f>"] = { "scroll", { "vim.api.nvim_win_get_height(0)", "true", "120" } }
		-- t["<C-y>"] = { "scroll", { "-0.10", "false", "50" } }
		-- t["<C-e>"] = { "scroll", { "0.10", "false", "50" } }
		t["zt"] = { "zt", { "150" } }
		t["zz"] = { "zz", { "150" } }
		t["zb"] = { "zb", { "150" } }

		require("neoscroll.config").set_mappings(t)
	end,
}
