vim.g.mapleader = " " -- space for leader
vim.g.maplocalleader = " " -- space for localleader

-- Disable space's default behavior
vim.keymap.set({ "n", "v" }, "<Space>", "<Nop>", { silent = true })


local keymap = vim.keymap

vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Move to left window" })
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Move to bottom window" })
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Move to top window" })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Move to right window" })

keymap.set("n", "<leader>c", ":nohlsearch<CR>", { desc = "Clear search highlights" })

keymap.set("n", "n", "nzzzv", { desc = "Next search result (centered)" })
keymap.set("n", "N", "Nzzzv", { desc = "Previous search result (centered)" })
keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Half page down (centered)" })
keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Half page up (centered)" })

keymap.set("x", "<leader>p", '"_dP', { desc = "Paste without yanking" })
keymap.set({ "n", "v" }, "<leader>x", '"_d', { desc = "Delete without yanking" })

keymap.set("v", "<", "<gv", { desc = "Indent left and reselect" })
keymap.set("v", ">", ">gv", { desc = "Indent right and reselect" })

keymap.set("n", "J", "mzJ`z", { desc = "Join lines and keep cursor position" })

keymap.set({"n", "v"}, "z", "zz", { desc = "Centers screen (overrides some other keybinds)" })

keymap.set('n', '<Esc>', function()
  for _, win in ipairs(vim.api.nvim_list_wins()) do
    if vim.api.nvim_win_get_config(win).relative ~= '' then
      vim.api.nvim_win_close(win, false)
    end
  end
end, { desc = "Close floating windows like lsp function definitions" })






--























--


















--





























--



