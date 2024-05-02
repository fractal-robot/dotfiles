local function format_selection()
	local filetype = vim.bo.filetype
	if filetype ~= "txt" and filetype ~= "norg" then
		vim.notify("Cannot format width: invalid filetype", vim.log.levels.WARN)
		return
	end

	-- Get start and end line numbers of selected text
	local vstart = vim.fn.getpos("v")[2]
	local vend = vim.fn.getpos(".")[2]
	if vstart > vend then
		vstart, vend = vend, vstart
	end

	-- Get selected text as a table of lines
	local lines = vim.api.nvim_buf_get_lines(0, vstart - 1, vend, false)

	-- Define maximum width
	local max_width = 80

	-- Function to wrap text to a maximum width
	local function wrap_text(text)
		local wrapped_lines = {}
		for line in text:gmatch("[^\r\n]+") do
			while #line > max_width do
				local wrapped_line = line:sub(1, max_width)
				table.insert(wrapped_lines, wrapped_line)
				line = line:sub(max_width + 1)
			end
			table.insert(wrapped_lines, line)
		end
		return wrapped_lines
	end

	-- Wrap each line and rejoin them
	local wrapped_lines = {}
	for _, line in ipairs(lines) do
		local wrapped = wrap_text(line)
		for _, wrapped_line in ipairs(wrapped) do
			table.insert(wrapped_lines, wrapped_line)
		end
	end

	-- Set formatted text back to buffer
	vim.api.nvim_buf_set_lines(0, vstart - 1, vend, false, wrapped_lines)
end

vim.keymap.set("v", "A", format_selection, { desc = "[A] Format selected text", noremap = true })
