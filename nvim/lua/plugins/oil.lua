return {
  "stevearc/oil.nvim",
  lazy = false,
  dependencies = { "nvim-tree/nvim-web-devicons" },
  keys = {
    {
      "<leader>o",
      function()
        require("oil").toggle_float()
      end,
      desc = "Oil file explorer",
    },
  },
  opts = {
    default_file_explorer = true,
    view_options = { show_hidden = true },
    buf_options = {
      -- buflisted = true,
      -- bufhidden = "wipe",
    },
    keymaps = {
      ["<ESC><ESC>"] = "actions.close",
    },
    float = {
      padding = 4,
    },
  },
}
