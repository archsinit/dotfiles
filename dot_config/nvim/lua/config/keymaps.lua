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
