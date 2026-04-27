return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  event = { "BufReadPost", "BufNewFile" },
  main = "nvim-treesitter",

  opts = {
    ensure_installed = {
      "python",
      "javascript", "typescript", "tsx",
      "html", "css",
      "json", "jsonc", "yaml", "toml",
      "markdown", "markdown_inline",
      "bash",
      "git_config", "gitcommit", "git_rebase",
      "vim", "vimdoc",
    },

    auto_install = true,

    highlight = {
      enable = true,
      disable = function(_, buf)
        local max_filesize = 500 * 1024
        local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
        if ok and stats and stats.size > max_filesize then
          return true
        end
      end,
    },

    indent = { enable = true },

    incremental_selection = {
      enable = true,
      keymaps = {
        init_selection = "<C-space>",
        node_incremental = "<C-space>",
        scope_incremental = false,
        node_decremental = "<bs>",
      },
    },
  },
}
