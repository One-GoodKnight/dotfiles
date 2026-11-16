-- Better f F motions, let's you use ; and , on multiple lines
-- Adds   s S motions that are the same but with 2 chars and highlight

local highlight = true -- false after f/F, true after s/S

local function seek(dir, count)
    return function()
        local chars = ""
        for _ = 1, count do
            local ok, c = pcall(vim.fn.getcharstr)
            if not ok or c == "\27" then return "" end -- Esc cancels
            chars = chars .. c
        end
        highlight = count > 1
        -- f is inclusive (df) deletes the char), / is exclusive: "v" fixes that
        local inclusive = (dir == "/" and count == 1 and vim.fn.mode(1):match("^no")) and "v" or ""
        local nohl = highlight and "" or "<cmd>nohlsearch<CR>"
        -- \V = literal match, no regex surprises
        return inclusive .. dir .. "\\V" .. vim.fn.escape(chars, "\\" .. dir) .. "\r" .. nohl
    end
end

local function repeat_seek(key)
    return function()
        return key .. (highlight and "" or "<cmd>nohlsearch<CR>")
    end
end

vim.keymap.set({ "n", "x", "o" }, "s", seek("/", 2), { expr = true })
vim.keymap.set({ "n", "x", "o" }, "S", seek("?", 2), { expr = true })
vim.keymap.set({ "n", "x", "o" }, "f", seek("/", 1), { expr = true })
vim.keymap.set({ "n", "x", "o" }, "F", seek("?", 1), { expr = true })

vim.keymap.set({ "n", "x", "o" }, ";", repeat_seek("n"), { expr = true })
vim.keymap.set({ "n", "x", "o" }, ",", repeat_seek("N"), { expr = true })
