local function toogle_reading_mode()
  if vim.o.cursorcolumn == true then
    vim.o.cursorcolumn = false
    vim.o.sidescroll = 1060
    vim.o.cursorcolumn = false
    vim.wo.concealcursor = "nvic"
  else
    vim.o.cursorcolumn = true
    vim.wo.concealcursor = ""
    vim.o.sidescroll = 80
  end
end

vim.keymap.set("n", "<leader>R", toogle_reading_mode, { desc = "Toogle [R]eading mode", noremap = true, silent = true })
