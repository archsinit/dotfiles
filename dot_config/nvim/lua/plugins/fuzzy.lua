return {
  "ibhagwan/fzf-lua",
  event = "VeryLazy",

  opts = {
    -- use the fzf binary you already have installed
    fzf_bin = "fzf",

    winopts = {
      height = 0.85,
      width = 0.85,
      row = 0.35,
      col = 0.50,
      border = "rounded",
      preview = {
        border = "rounded",
        scrollbar = false,
        layout = "vertical",
        vertical = "down:45%",
      },
    },

    keymap = {
      -- keys that work inside the fzf window
      fzf = {
        ["ctrl-q"] = "select-all+accept",  -- send all results to quickfix
        ["ctrl-u"] = "preview-page-up",
        ["ctrl-d"] = "preview-page-down",
      },
    },

    fzf_opts = {
      ["--layout"] = "reverse",            -- input at the top, results below
      ["--marker"] = ">",
    },

    files = {
      cmd = "fd --type f --hidden --follow --exclude .git",
      formatter = "path.filename_first",   -- filename prominent, path dimmed
    },

    grep = {
      cmd = "rg --column --line-number --no-heading --color=always --smart-case",
      formatter = "path.filename_first",
    },

    -- dim the backdrop when fzf opens
    hls = {
      border = "FloatBorder",
      preview_border = "FloatBorder",
    },
  },

  keys = {
    { "<leader>ff", "<cmd>FzfLua files<CR>",                desc = "find files" },
    { "<leader>fr", "<cmd>FzfLua oldfiles<CR>",             desc = "recent files" },
    { "<leader>fg", "<cmd>FzfLua live_grep<CR>",            desc = "live grep" },
    { "<leader>fw", "<cmd>FzfLua grep_cword<CR>",           desc = "grep word under cursor" },
    { "<leader>fb", "<cmd>FzfLua buffers<CR>",              desc = "open buffers" },
    { "<leader>fh", "<cmd>FzfLua help_tags<CR>",            desc = "help tags" },
    { "<leader>fd", "<cmd>FzfLua diagnostics_document<CR>", desc = "document diagnostics" },
    { "<leader>fs", "<cmd>FzfLua lsp_document_symbols<CR>", desc = "document symbols" },
    { "<leader>fc", "<cmd>FzfLua commands<CR>",             desc = "commands" },
    { "<leader>fk", "<cmd>FzfLua keymaps<CR>",              desc = "keymaps" },
    { "<leader>/",  "<cmd>FzfLua blines<CR>",               desc = "fuzzy search buffer" },
  },
}
