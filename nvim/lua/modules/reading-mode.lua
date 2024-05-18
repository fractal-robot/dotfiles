local function toggle_reading_mode()
  if Readonly == nil then
    Readonly = not vim.bo.modifiable
  end

  if vim.o.cursorcolumn == true then
    vim.o.cursorcolumn = false
    vim.o.sidescroll = 1060
    vim.o.cursorcolumn = false
    vim.wo.concealcursor = "nvic"

    vim.bo.modifiable = false
  else
    vim.o.cursorcolumn = true
    vim.wo.concealcursor = ""
    vim.o.sidescroll = 80

    if not Readonly then
      vim.bo.modifiable = true
    end
  end
end

vim.keymap.set("n", "<leader>tr", toggle_reading_mode, { desc = "toggle [R]eading mode", noremap = true })
