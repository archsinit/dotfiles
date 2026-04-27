return {
  "nvim-lualine/lualine.nvim",
  event = "VeryLazy",

  opts = {
    options = {
      -- theme = require("catppuccin.utils.lualine")("mocha"),
      theme = "catppuccin-mocha",
      globalstatus = true,          -- matches laststatus=3 in options.lua
      component_separators = "",
      section_separators = { left = "", right = "" },
      disabled_filetypes = {
        statusline = { "lazy", "mason" },
      },
    },

    sections = {
      lualine_a = {
        { "mode", separator = { left = "" }, padding = { left = 0, right = 1 } },
      },
      lualine_b = {
        { "branch", icon = "" },
        {
          "diff",
          symbols = { added = " ", modified = " ", removed = " " },
        },
      },
      lualine_c = {
        {
          "filename",
          path = 1,                 -- show relative path
          symbols = {
            modified = "●",
            readonly = "",
            unnamed = "[no name]",
          },
        },
        {
          "diagnostics",
          symbols = { error = " ", warn = " ", hint = " ", info = " " },
        },
      },
      lualine_x = {
        {
          function()
            local clients = vim.lsp.get_clients({ bufnr = 0 })
            if #clients == 0 then return "" end
            local names = {}
            for _, c in ipairs(clients) do
              table.insert(names, c.name)
            end
            return " " .. table.concat(names, " ")
          end,
        },
      },
      lualine_y = {
        { "filetype", icon_only = false },
        { "progress" },
      },
      lualine_z = {
        { "location", separator = { right = "" }, padding = { left = 1, right = 0 } },
      },
    },

    inactive_sections = {
      lualine_a = {},
      lualine_b = {},
      lualine_c = { "filename" },
      lualine_x = { "location" },
      lualine_y = {},
      lualine_z = {},
    },
  },
}
