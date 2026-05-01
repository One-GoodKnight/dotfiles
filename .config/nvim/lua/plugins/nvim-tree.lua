vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Installation
vim.pack.add({"https://github.com/nvim-tree/nvim-tree.lua"})
vim.cmd("packadd " .. "nvim-tree.lua")

-- Config
require("nvim-tree", dsfas).setup({
	view = {
		width = 35,
	},
	filters = {
		dotfiles = false,
	},
	renderer = {
		group_empty = true,
	},
})

vim.api.nvim_set_hl(0, "NvimTreeWinSeparator", { fg = "#2a2a2a", bg = "none" })

vim.keymap.set("n", "<leader>e", function()
	require("nvim-tree.api").tree.toggle()
end, { desc = "Toggle NvimTree" })
