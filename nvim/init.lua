local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

vim.opt.colorcolumn = "80"
vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.o.termguicolors = true

require("lazy").setup("plugins", {
	change_detection = {
		notify = false,
	},
})

-- things for taking notes
vim.api.nvim_create_autocmd({ "BufEnter", "BufWinEnter" }, {
	pattern = "*.norg",
	callback = function()
		vim.o.wrap = false
	end,
})

vim.opt.foldenable = false -- disable native nvim folding
vim.wo.foldlevel = 99

vim.wo.conceallevel = 2
vim.o.breakindent = true

vim.o.tabstop = 2 -- tabulation width
vim.o.shiftwidth = 2 -- tabulation width when >> or <<
vim.opt.expandtab = true -- TODO: decide on usage

vim.o.cursorcolumn = true
vim.o.cursorline = true

vim.o.hlsearch = true -- highlight on search, interfere with noice.nvim?
vim.keymap.set("n", "<leader><leader>", "<cmd>nohlsearch<CR>", { desc = "[ ] Clear highlights" })

vim.o.textwidth = 80

-- vim.api.nvim_set_hl(0, "Normal", { bg = "LightGray" })

-- Make relative line numbers default
vim.o.number = true
vim.o.relativenumber = true

-- Enable mouse mode
vim.o.mouse = "a"

-- sync clipboard between OS and Neovim.
--  See `:help 'clipboard'`
vim.o.clipboard = "unnamedplus"

-- Save undo history
vim.o.undofile = true

-- If any uppercase letter, case sensitive search
vim.o.ignorecase = true
vim.o.smartcase = true

-- Keep signcolumn on by default
vim.wo.signcolumn = "yes" -- or 'auto', column on the left of line number

-- Decrease update time
vim.o.updatetime = 250 -- default to 4000

-- Completeopt to have a better completion experience
vim.o.completeopt = "menuone,noselect"

-- The cursor to be always block
vim.o.guicursor = "a:block"

-- Highlight when yanking text
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking text",
	group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})

local files = vim.fn.readdir(vim.fn.stdpath("config") .. "/lua/modules")
for _, file in ipairs(files) do
	if file:match("%.lua$") then
		local module_name = file:gsub("%.lua$", "")
		require("modules." .. module_name)
	end
end

for _, file in ipairs(vim.fn.readdir(vim.fn.stdpath("config") .. "/lua/plugins", [[v:val =~ '\.lua$']])) do
	require("plugins." .. file:gsub("%.lua$", ""))
end

-- Adding other default keymaps
-- vim.api.nvim_buf_add_user_command(0, "W", vim.api.save_buffer(0), {})
vim.cmd([[
  cnoreabbrev W w
  cnoreabbrev Q q
]])

-- vim.api.nvim_set_keymap("n", "<Esc>", ":w<CR>", { noremap = true })
vim.keymap.set("n", "<Esc>", "<cmd>write<cr>", { noremap = true })

-- vim.keymap.set("n", "gp", '"_d"+p', { noremap = true, silent = true })
vim.keymap.set("v", "gp", '"_d"+p', { noremap = true })

--------------------
-- disabled commands
--------------------

vim.keymap.set("n", "yy", "", { noremap = true })
vim.keymap.set("n", "dd", "", { noremap = true })
