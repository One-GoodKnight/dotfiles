-- Installation
vim.pack.add({"https://github.com/Diogo-ss/42-header.nvim"})

-- Config
require("42header").setup({
	default_map = true,						-- Default mapping <F1> in normal mode.
    auto_update = true,						-- Update header when saving.
    user = "aginiaux",						-- Your user.
    mail = "aginiaux@student.42lyon.fr",	-- Your mail.
})

vim.g.user = "aginiaux"
vim.g.mail = "aginiaux@student.42lyon.fr"
