local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup

local function group(name)
  return augroup(name, { clear = true })
end

autocmd("TextYankPost", {
  group = group("yank_highlight"),
  callback = function()
    vim.highlight.on_yank({ higroup = "Visual", timeout = 150 })
  end,
})

autocmd("BufReadPost", {
  group = group("restore_cursor"),
  callback = function()
    local mark = vim.api.nvim_buf_get_mark(0, '"')
    local line_count = vim.api.nvim_buf_line_count(0)
    if mark[1] > 0 and mark[1] <= line_count then
      vim.cmd('normal! g`"zz')
    end
  end,
})

autocmd("FileType", {
  group = group("lua_treesitter_fix"),
  pattern = "lua",
  callback = function()
    pcall(vim.treesitter.stop)
  end,
})

autocmd("FileType", {
  group = group("markdown_settings"),
  pattern = "markdown",
  callback = function()
    local o = vim.opt_local
    o.wrap = true
    o.linebreak = true
    o.breakindent = true
    o.spell = true
    o.spelllang = "en_us"
    o.conceallevel = 2
    o.textwidth = 0
    o.shiftwidth = 4
    vim.keymap.set("n", "j", "gj", { buffer = true, silent = true })
    vim.keymap.set("n", "k", "gk", { buffer = true, silent = true })
  end,
})

autocmd("BufWritePre", {
  group = group("trim_whitespace"),
  pattern = { "*.lua", "*.py", "*.js", "*.ts", "*.tsx", "*.jsx", "*.css", "*.html" },
  callback = function()
    local view = vim.fn.winsaveview()
    vim.cmd([[%s/\s\+$//e]])
    vim.fn.winrestview(view)
  end,
})

autocmd("BufWritePre", {
  group = group("auto_mkdir"),
  callback = function(event)
    local file = vim.uv.fs_realpath(event.match) or event.match
    vim.fn.mkdir(vim.fn.fnamemodify(file, ":p:h"), "p")
  end,
})

autocmd("VimResized", {
  group = group("resize_splits"),
  callback = function()
    local current_tab = vim.fn.tabpagenr()
    vim.cmd("tabdo wincmd =")
    vim.cmd("tabnext " .. current_tab)
  end,
})

autocmd({ "InsertEnter" }, {
  group = group("number_toggle"),
  callback = function() vim.opt_local.relativenumber = false end,
})

autocmd({ "InsertLeave" }, {
  group = group("number_toggle"),
  callback = function() vim.opt_local.relativenumber = true end,
})

autocmd("FileType", {
  group = group("quick_close"),
  pattern = { "help", "man", "qf", "lspinfo", "notify", "checkhealth", "startuptime" },
  callback = function(event)
    vim.bo[event.buf].buflisted = false
    vim.keymap.set("n", "q", "<cmd>close<CR>", { buffer = event.buf, silent = true })
  end,
})
