return {
  {
    "folke/todo-comments.nvim",
    opts = {
      keywords = {
        WTF = {
          icon = "󱚟 ",
          color = "#964B00",
          alt = { "DAFUK", "FKME", "SHIT" },
        },
        QUESTION = {
          icon = " ",
          color = "#FFA500",
          alt = { "Q", "WHY" },
        },
        SUGGESTION = {
          icon = "󰛨 ",
          color = "#ffc0cb",
          alt = { "IDEA", "RFC" },
        },
        go = {
          icon = " ",
          color = "#ddc700",
        },
      },
    },
  },
  {
    "mfussenegger/nvim-lint",
    -- optional = true,
    opts = function(_, opts)
      opts.linters_by_ft = {
        go = { "golangcilint" },
      }
    end,
  },
  -- {
  --   "nvzone/showkeys",
  --   cmd = "ShowkeysToggle",
  --   keys = {
  --     {
  --       "<leader>uk",
  --       "<cmd>ShowkeysToggle<cr>",
  --       desc = "Toggle Show [K]eys",
  --     },
  --   },
  -- },
}
