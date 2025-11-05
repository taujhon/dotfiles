-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Sane edit new line
vim.keymap.set("n", "o", function()
  local count = vim.v.count1
  vim.cmd("normal! " .. count .. "o")
  vim.cmd("normal! $")
  vim.cmd("startinsert!")
end)
vim.keymap.set("n", "O", function()
  local count = vim.v.count1
  vim.cmd("normal! " .. count .. "O")
  if count > 1 then
    vim.cmd("normal! " .. (count - 1) .. "kA")
  end
  vim.cmd("normal! $")
  vim.cmd("startinsert!")
end)

-- sane find/replace default
vim.keymap.set({ "n", "v" }, "/", "/\\v")
vim.keymap.set("n", "<Leader>r", ":%s/\\v", { desc = "Global replace" })
vim.keymap.set("v", "<Leader>r", ":'<,'>s/\\v", { desc = "Line replace" })
vim.keymap.set("n", "<Leader>R", ":%s/\\v<C-r><C-w>/<C-r><C-w>/gI<Left><Left><Left>", { desc = "(w)ord replace" })

-- move selected
-- vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
-- vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- keep cursor in place
vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- yank to clipboard
-- vim.keymap.set({ "n", "v" }, "<Leader>y", '"+y`]')
-- vim.keymap.set("n", "<Leader>Y", '"+Y`]')

-- convenient cursor placement after yank and paste
vim.keymap.set("v", "y", "y`]")
vim.keymap.set({ "n", "v" }, "p", "p`]")

-- delete to void register
-- vim.keymap.set("n", "<Leader>d", '"_d')
-- vim.keymap.set("v", "<Leader>d", '"_d')

-- keep yank on paste
-- vim.keymap.set("x", "<Leader>p", '"_dP')

vim.keymap.set("n", "Q", "<Nop>")

vim.keymap.set("n", "<Leader>W", function()
  if vim.g.autosave then
    vim.g.autosave = false
    vim.print("Autosave off")
  else
    vim.g.autosave = true
    vim.print("Autosave on")
  end
end, { desc = "Toggle auto-save" })

vim.keymap.set("n", "<Leader>ue", function()
  if vim.o.laststatus == 0 then
    vim.o.laststatus = 3
    vim.notify("Statusline shown")
  else
    vim.o.laststatus = 0
    vim.notify("Statusline hidden")
  end
end, { desc = "Toggle statusline" })

-- all
vim.keymap.set("n", "<Leader>aa", "ggVG", { desc = "Select all" })
vim.keymap.set("n", "<Leader>ay", "ggVGy", { desc = "Yank all" })
vim.keymap.set("n", "<Leader>ad", "ggVGd", { desc = "Delete all" })
