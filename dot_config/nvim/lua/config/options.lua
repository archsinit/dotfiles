local opt = vim.opt

opt.number = true
opt.relativenumber = true
opt.scrolloff = 8
opt.signcolumn = "yes"
opt.cursorline = true
opt.wrap = false

opt.splitright = true
opt.splitbelow = true

opt.expandtab = true
opt.shiftwidth = 2
opt.tabstop = 2
opt.smartindent = true

opt.ignorecase = true
opt.smartcase = true
opt.hlsearch = true

opt.mouse = "a"
opt.clipboard = "unnamedplus"
opt.updatetime = 200
opt.timeoutlen = 300

opt.swapfile = false
opt.undofile = true

opt.termguicolors = true
opt.showmode = false
opt.laststatus = 3              -- single global statusline
opt.fillchars = { eob = " " }  -- hides ~ at end of buffer

opt.completeopt = { "menu", "menuone", "noselect" }

opt.foldmethod = "expr"
opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
opt.foldlevel = 99
opt.foldlevelstart = 99
