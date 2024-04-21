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

vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.o.termguicolors = true

require("lazy").setup("plugins", {
	change_detection = {
		notify = false,
	},
})

-- things for neorg
vim.wo.foldlevel = 99
vim.wo.conceallevel = 2
vim.wo.wrap = false

vim.opt.scrolloff = 10

vim.opt.foldenable = false -- disable native nvim folding

vim.o.tabstop = 2 -- tabulation width
vim.o.shiftwidth = 2 -- tabulation width when >> or <<

vim.o.cursorcolumn = true
vim.o.cursorline = true

vim.opt.colorcolumn = "80"
vim.opt.textwidth = 80

vim.o.hlsearch = true -- highlight on search, interfere with noice.nvim?
vim.keymap.set("n", "<leader><leader>", "<cmd>nohlsearch<CR>", { desc = "[ ] Clear highlights" })

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
