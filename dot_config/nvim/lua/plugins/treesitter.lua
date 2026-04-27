return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  tag = "v0.9.2",
  event = { "BufReadPost", "BufNewFile" },

  config = function()
    require("nvim-treesitter.configs").setup({

      ensure_installed = {
        "lua", "luadoc",
        "python",
        "javascript", "typescript", "tsx",
        "html", "css",
        "json", "jsonc", "yaml", "toml",
        "markdown", "markdown_inline",
        "bash",
        "git_config", "gitcommit", "git_rebase",
        "vim", "vimdoc",
      },

      auto_install = true,   -- installs a parser when you open an unrecognised filetype

      highlight = {
        enable = true,
        -- disable treesitter on very large files where it causes lag
        disable = function(_, buf)
          local max_filesize = 500 * 1024  -- 500kb
          local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
          if ok and stats and stats.size > max_filesize then
            return true
          end
        end,
      },

      indent = {
        enable = true,
      },

      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "<C-space>",
          node_incremental = "<C-space>",   -- expand selection to next node
          scope_incremental = false,
          node_decremental = "<bs>",        -- shrink selection
        },
      },
    })
  end,
}
