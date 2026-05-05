-- Installation
vim.pack.add({"https://github.com/nvim-mini/mini.nvim"})

-- Config


-- ai text objects
local MiniAi = require("mini.ai")

MiniAi.setup({
	custom_textobjects = {
        [","] = MiniAi.gen_spec.argument(),
    }
})
  
require("mini.move").setup({})
require("mini.surround").setup({})
require("mini.pairs").setup({})

local MiniIcons = require("mini.icons")
MiniIcons.mock_nvim_web_devicons() -- makes nvim-tree use mini.icons
MiniIcons.setup({})
