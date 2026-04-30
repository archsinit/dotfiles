return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
  },
  keys = {
    { "<leader>e", "<cmd>Neotree float reveal toggle<CR>", desc = "toggle file tree" },
  },
  opts= {
    enable_git_status = true,
    window = {
      position = "float",
      popup = {
        border = { style= "rounded" },
      },
    },
    filesystem = {
      follow_current_file = { enabled = true },
      use_libuv_file_watcher = true,
      filtered_items = {
        hide_dotfiles = false,
        hide_gitignored = true,
        never_show = {
          ".git",
          "node_modules",
          "__pycache__",
          ".pytest_cache",
          ".venv",
        },
      },
    },
  },
}
