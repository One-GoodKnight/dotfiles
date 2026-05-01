-- Installation
vim.pack.add({
	"https://www.github.com/neovim/nvim-lspconfig",
	"https://github.com/mason-org/mason.nvim"
})
vim.cmd("packadd " .. "nvim-lspconfig")
vim.cmd("packadd " .. "mason.nvim")

-- Config

-- Icons
local diagnostic_signs = {
	Error = " ",
	Warn = " ",
	Hint = "",
	Info = "",
}

vim.diagnostic.config({
	virtual_text = { prefix = "●", spacing = 4 },
	signs = {
		text = {
			[vim.diagnostic.severity.ERROR] = diagnostic_signs.Error,
			[vim.diagnostic.severity.WARN] = diagnostic_signs.Warn,
			[vim.diagnostic.severity.INFO] = diagnostic_signs.Info,
			[vim.diagnostic.severity.HINT] = diagnostic_signs.Hint,
		},
	},
	underline = true,
	update_in_insert = false,
	severity_sort = true,
	float = {
		border = "rounded",
		source = true,
		header = "",
		prefix = "",
		focusable = false,
		style = "minimal",
	},
})

require('mason').setup()


-- basedpyright
vim.lsp.config('basedpyright', {
	cmd = {'basedpyright-langserver', '--stdio'},
	filetypes = {'python'},
	on_attach = function (client, _)
		-- formatting to ruff
		client.server_capabilities.documentFormattingProvider = false -- use ruff
		client.server_capabilities.documentRangeFormattingProvider = false -- use ruff
	end,
	settings = { -- see https://docs.basedpyright.com/latest/configuration/language-server-settings/
		basedpyright = {
			disableOrganizeImports = true, -- use ruff instead of it
		}
	},
})
vim.lsp.enable('basedpyright')

-- ruff
vim.lsp.enable('ruff')


-- clangd
vim.lsp.enable('clangd')
