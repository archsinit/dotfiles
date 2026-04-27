return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
  },

  config = function()
    local capabilities = vim.lsp.protocol.make_client_capabilities()

    -- keymaps only active when an LSP is attached to the buffer
    vim.api.nvim_create_autocmd("LspAttach", {
      group = vim.api.nvim_create_augroup("lsp_keymaps", { clear = true }),
      callback = function(event)
        local map = function(keys, func, desc)
          vim.keymap.set("n", keys, func, { buffer = event.buf, desc = desc })
        end

        map("gd",         "<cmd>FzfLua lsp_definitions<CR>",      "go to definition")
        map("gr",         "<cmd>FzfLua lsp_references<CR>",       "go to references")
        map("gI",         "<cmd>FzfLua lsp_implementations<CR>",  "go to implementation")
        map("gy",         "<cmd>FzfLua lsp_typedefs<CR>",         "go to type definition")
        map("gD",         vim.lsp.buf.declaration,                "go to declaration")
        map("K",          vim.lsp.buf.hover,                      "hover docs")
        map("<leader>ca", "<cmd>FzfLua lsp_code_actions<CR>",     "code actions")
        map("<leader>rn", vim.lsp.buf.rename,                     "rename symbol")
        map("<leader>fd", "<cmd>FzfLua diagnostics_document<CR>", "document diagnostics")
        map("]d",         vim.diagnostic.goto_next,               "next diagnostic")
        map("[d",         vim.diagnostic.goto_prev,               "prev diagnostic")
      end,
    })

    -- diagnostic signs in the gutter
    vim.diagnostic.config({
      virtual_text = {
        prefix = "●",
        spacing = 4,
      },
      signs = true,
      underline = true,
      update_in_insert = false,
      severity_sort = true,
      float = {
        border = "rounded",
        source = true,
      },
    })

    -- apply capabilities to all servers
    vim.lsp.config("*", { capabilities = capabilities })

    -- lua_ls needs extra settings to understand the nvim runtime
    vim.lsp.config("lua_ls", {
      settings = {
        Lua = {
          runtime = { version = "LuaJIT" },
          workspace = {
            checkThirdParty = false,
            library = vim.api.nvim_get_runtime_file("", true),
          },
          diagnostics = { globals = { "vim" } },
          telemetry = { enable = false },
        },
      },
    })

    vim.lsp.enable({
      "lua_ls",
      "pyright",
      "ts_ls",
      "html",
      "cssls",
      "jsonls",
      "yamlls",
      "marksman",
    })
  end,
}
