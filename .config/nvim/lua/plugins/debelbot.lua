return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    enabled = false,
  },
  {
    "folke/which-key.nvim",
    opts = {
      keys = {
        scroll_down = "<c-j>",
        scroll_up = "<c-k>",
      },
    },
  },
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
    "folke/persistence.nvim",
    opts = {
      options = { "buffers", "curdir", "tabpages", "winsize", "help", "globals", "skiprtp", "folds" },
      pre_save = function()
        -- Close all terminal, file explorere buffers before saving session
        local fallback_buf = nil

        for _, buf in ipairs(vim.api.nvim_list_bufs()) do
          if vim.bo[buf].buftype == "terminal" or vim.bo[buf].filetype == "oil" then
            vim.api.nvim_buf_delete(buf, { force = true })
          else
            fallback_buf = buf
          end
        end

        if fallback_buf ~= nil then
          vim.api.nvim_set_current_buf(fallback_buf)
        end
      end,
    },
  },
  -- {
  --   "boxart.nvim",
  --   dir = "~/.config/nvim/lua/boxart",
  -- },
  {
    "nvzone/showkeys",
    cmd = "ShowkeysToggle",
    opts = {
      winopts = {
        border = "rounded",
      },
      position = "top-right",
      show_count = true,
      exclude_modes = { "i" },
    },
    keys = {
      {
        "<leader>uk",
        "<cmd>ShowkeysToggle<cr>",
        desc = "Toggle Show [K]eys",
      },
    },
  },
}
