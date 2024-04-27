local function escape_quotes(str)
	return str:gsub('"', '\\"'):gsub("'", "\\'")
end

local function format_selection()
	local filetype = vim.bo.filetype
	if filetype ~= "txt" and filetype ~= "norg" then
		vim.notify("Cannot format width: invalid filetype", vim.log.levels.WARN)
		return
	end

	local vstart = vim.fn.getpos("v")[2]
	local vend = vim.fn.getpos(".")[2]
	if vstart > vend then
		vstart, vend = vend, vstart
	end

	local lines = vim.api.nvim_buf_get_lines(0, vstart - 1, vend, false)
	local text= escape_quotes(table.concat(lines, "\n"))

	local formatted_text = vim.fn.system(string.format('printf '%s' | fmt -w 80 -g 80 -s -t', text))
	vim.api.nvim_buf_set_lines(0, vstart - 1, vend, false, vim.fn.split(formatted_text, "\n"))
end

vim.keymap.set("v", "A", format_selection, { desc = "[A] Format selected text", noremap = true })
