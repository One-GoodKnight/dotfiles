local augroup = vim.api.nvim_create_augroup("UserConfig", { clear = true })

-- return to last cursor position after close -> open file
vim.api.nvim_create_autocmd("BufWinEnter", {
	group = augroup,
	desc = "Restore last cursor position",
	callback = function()
		if vim.o.diff then -- except in diff mode
			return
		end

		local last_pos = vim.api.nvim_buf_get_mark(0, '"') -- {line, col}
		local last_line = vim.api.nvim_buf_line_count(0)

		local row = last_pos[1]
		if row < 1 or row > last_line then
			return
		end

		local ok = pcall(vim.api.nvim_win_set_cursor, 0, last_pos)
		if ok then
			vim.cmd("normal! zz")
		end
	end,
})

-- lsp keybinds
vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(args)
    local map = function(keys, func)
      vim.keymap.set('n', keys, func, { buffer = args.buf })
    end

    map('gd', vim.lsp.buf.definition)
    map('K', vim.lsp.buf.hover)
    map('gr', vim.lsp.buf.references)
    map('gi', vim.lsp.buf.implementation)
    map('<leader>rn', vim.lsp.buf.rename)
    map('<leader>ca', vim.lsp.buf.code_action)
  end,
})
