local map = vim.keymap.set

map("i", "jk", "<Esc>")
map("i", "kj", "<Esc>")

map("n", "<leader>w", "<cmd>write<CR>")
map("n", "<leader>q", "<cmd>quit<CR>")
map("n", "<leader>h", "<cmd>nohlsearch<CR>")
map("n", "<leader>e", "<cmd>Explore<CR>")
map("n", "<leader><space>", "zz")

map("n", "G", "Gzz")
map("n", "J", "mzJ`z")
map("n", "<C-d>", "<C-d>zz")
map("n", "<C-u>", "<C-u>zz")
map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")

map("v", "J", ":m '>+1<CR>gv=gv")
map("v", "K", ":m '<-2<CR>gv=gv")

map("x", "<leader>p", '"_dP')  -- paste without overwriting clipboard
map("n", "<leader>d", '"_d')   -- delete without overwriting clipboard
map("v", "<leader>d", '"_d')
map("n", "<leader>y", '"+y')   -- yank to system clipboard
map("v", "<leader>y", '"+y')

map("n", "<C-h>", "<C-w>h")
map("n", "<C-j>", "<C-w>j")
map("n", "<C-k>", "<C-w>k")
map("n", "<C-l>", "<C-w>l")
map("n", "<leader>|", "<C-w>v")
map("n", "<leader>-", "<C-w>s")
map("n", "<C-Up>",    "<cmd>resize +2<CR>")
map("n", "<C-Down>",  "<cmd>resize -2<CR>")
map("n", "<C-Left>",  "<cmd>vertical resize -2<CR>")
map("n", "<C-Right>", "<cmd>vertical resize +2<CR>")

map("n", "<S-l>", "<cmd>bnext<CR>")
map("n", "<S-h>", "<cmd>bprevious<CR>")
map("n", "<leader>x", "<cmd>bdelete<CR>")

map("n", "]q", "<cmd>cnext<CR>zz")
map("n", "[q", "<cmd>cprev<CR>zz")
map("n", "<leader>co", "<cmd>copen<CR>")
map("n", "<leader>cc", "<cmd>cclose<CR>")

-- Zettelkasten
local zk = vim.fn.expand("~/Documents/notes/zettelkasten/scripts")

local function zk_fzf(script, arg)
    local tmp = vim.fn.tempname()
    local cmd = "python3 " .. script
    if arg ~= "" then
        cmd = cmd .. " " .. vim.fn.shellescape(arg)
    end
    vim.cmd("botright 15new")
    vim.fn.jobstart(cmd .. " > " .. tmp, {
        term = true,
        on_exit = function()
            vim.cmd("bdelete!")
            local ok, lines = pcall(vim.fn.readfile, tmp)
            if ok and #lines > 0 and lines[1] ~= "" then
                local parts = vim.split(lines[1], "\t")
                vim.cmd("edit " .. vim.fn.fnameescape(parts[#parts]))
            end
        end
    })
    vim.cmd("startinsert")
end

map("n", "<leader>zn", function()
    local kind = vim.fn.input("Kind (d=default, l=literature): ")
    if kind == "" then return end
    local title = vim.fn.input("Note title: ")
    if title == "" then return end
    local flag = kind == "l" and " --literature" or ""
    local path = vim.fn.trim(vim.fn.system(
        "python3 " .. zk .. "/new_note.py " .. vim.fn.shellescape(title) .. flag
    ))
    if path ~= "" then
        vim.cmd("edit " .. vim.fn.fnameescape(path))
    end
end)

map("n", "<leader>zf", function()
    local word = vim.fn.expand("<cWORD>")
    local path = vim.fn.trim(vim.fn.system(
        "python3 " .. zk .. "/follow_link.py " .. vim.fn.shellescape(word)
    ))
    if path ~= "" then
        vim.cmd("edit " .. vim.fn.fnameescape(path))
    end
end)

map("n", "<leader>zb", function()
    local id = vim.fn.expand("%:t:r")
    zk_fzf(zk .. "/backlinks.py", id)
end)

map("n", "<leader>zs", function()
    zk_fzf(zk .. "/search_notes.py", "")
end)

map("n", "<leader>zi", function()
    local tmp = vim.fn.tempname()
    vim.cmd("botright 15new")
    vim.fn.jobstart("python3 " .. zk .. "/search_notes.py > " .. tmp, {
        term = true,
        on_exit = function()
            vim.cmd("bdelete!")
            local ok, lines = pcall(vim.fn.readfile, tmp)
            if ok and #lines > 0 and lines[1] ~= "" then
                local parts = vim.split(lines[1], "\t")
                local id = vim.fn.fnamemodify(parts[#parts], ":t:r")
                vim.api.nvim_put({"[[" .. id .. "]]"}, "c", true, true)
            end
        end
    })
    vim.cmd("startinsert")
end)
