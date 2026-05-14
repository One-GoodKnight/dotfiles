-- Installation
vim.pack.add({
	'https://github.com/saghen/blink.lib',
	'https://github.com/saghen/blink.cmp'
})

-- Config
local cmp = require('blink.cmp')
cmp.build():wait(60000)
cmp.setup({
  keymap = {
    preset = 'enter',
    ['<C-n>'] = { 'show', 'select_next', 'fallback' },
    ['<Escape>'] = { 'hide', 'fallback' },
  },
  completion = {
    menu = { auto_show = false },
    documentation = { auto_show = false },
  },
  sources = { default = { 'lsp', 'path', 'snippets', 'buffer' } },
  fuzzy = { implementation = "prefer_rust" }
})
