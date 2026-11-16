-- Same motion as f and F but with 2 chars + highlight + full file
--                s     S

local function seek(dir)
    return function()
        local ok1, a = pcall(vim.fn.getcharstr)
        if not ok1 or a == "\27" then return "" end -- Esc cancels
        local ok2, b = pcall(vim.fn.getcharstr)
        if not ok2 or b == "\27" then return "" end
        -- \V = literal match, no regex surprises
        return dir .. "\\V" .. vim.fn.escape(a .. b, "\\" .. dir) .. "\r"
    end
end

vim.keymap.set({ "n", "x", "o" }, "s", seek("/"), { expr = true }) -- forward
vim.keymap.set({ "n", "x", "o" }, "S", seek("?"), { expr = true }) -- backward

vim.keymap.set({ "n", "x", "o" }, ";", "n")
vim.keymap.set({ "n", "x", "o" }, ",", "N")
