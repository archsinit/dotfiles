return {
  {
    "williamboman/mason.nvim",
    cmd = "Mason",
    opts = {
      ui = {
        border = "rounded",
        icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗",
        },
      },
    },
  },

  {
    "williamboman/mason-lspconfig.nvim",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = { "williamboman/mason.nvim" },
    opts = {
      ensure_installed = {
        "lua_ls",        -- lua
        "pyright",       -- python
        "ts_ls",         -- typescript / javascript
        "html",          -- html
        "cssls",         -- css
        "jsonls",        -- json
        "yamlls",        -- yaml
        "marksman",      -- markdown
      },
      automatic_installation = true,
    },
  },
}
