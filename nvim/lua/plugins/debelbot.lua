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
      priority = 10,
      keywords = {
        WTF = {
          icon = "󱚟 ",
          color = "#964B00",
          alt = { "DAFUK", "FKME", "SHIT" },
        },
        QUESTION = {
          icon = " ",
          color = "#FFA500",
          alt = { "Q", "WHY", "HYPOTESIS" },
        },
        SUGGESTION = {
          icon = "󰛨 ",
          color = "#ffc0cb",
          alt = { "IDEA", "RFC", "PLAN" },
        },
        WIP = {
          icon = " ",
          color = "#cc7722",
        },
        go = {
          icon = " ",
          color = "#ddc700",
        },
      },
    },
  },
  -- {
  --   "ibhagwan/fzf-lua",
  --   opts = function(_, opts)
  --     local actions = require("fzf-lua.actions")
  --     return vim.tbl_deep_extend("force", opts, {
  --       files = {
  --         actions = {
  --           ["ctrl-h"] = actions.toggle_hidden,
  --           ["ctrl-i"] = actions.toggle_ignore,
  --         },
  --       },
  --       grep = {
  --         actions = {
  --           ["ctrl-h"] = actions.toggle_hidden,
  --           ["ctrl-i"] = actions.toggle_ignore,
  --         },
  --       },
  --       diagnostics = {
  --         actions = {
  --           ["ctrl-h"] = actions.toggle_hidden,
  --           ["ctrl-i"] = actions.toggle_ignore,
  --         },
  --       },
  --     })
  --   end,
  -- },
  {
    "mfussenegger/nvim-lint",
    -- optional = true,
    opts = function(_, opts)
      opts.linters_by_ft = {
        go = { "golangcilint" },
      }
    end,
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
  --   "stevearc/conform.nvim",
  --   opts = {
  --     formatters_by_ft = {
  --       sql = { "sqlfmt" },
  --     },
  --   },
  -- },
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
