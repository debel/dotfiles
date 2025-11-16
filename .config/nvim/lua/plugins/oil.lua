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
      desc = "Toggle Oil file explorer (float)",
    },
    {
      "<leader>be",
      function()
        require("oil").open(nil, nil, function()
          local buf = vim.api.nvim_get_current_buf()

          vim.api.nvim_set_option_value("buflisted", true, { buf = buf })
        end)
      end,
      desc = "Open Oil file explorer (buffer)",
    },
    {
      "<leader>e",
      function()
        -- Find any window with oil filetype

        local oil_winnr = nil

        for winnr = 1, vim.fn.winnr("$") do
          local bufnr = vim.fn.winbufnr(winnr)

          if vim.bo[bufnr].filetype == "oil" then
            oil_winnr = winnr

            break
          end
        end

        if oil_winnr then
          vim.cmd(oil_winnr .. "wincmd c")
        else
          vim.cmd("topleft 33vs")

          require("oil").open()
        end
      end,

      desc = "Toggle Oil file explorer (split)",
    },
  },
  opts = {
    default_file_explorer = true,
    cleanup_delay_ms = false,
    view_options = { show_hidden = true },
    buf_options = {
      -- buflisted = true,
      -- bufhidden = "wipe",
    },
    keymaps = {
      ["<ESC><ESC>"] = "actions.close",
      ["<C-l>"] = "<cmd>wincmd l<cr>",
      ["<C-h>"] = "<cmd>wincmd h<cr>",
      ["<CR>"] = {
        callback = function()
          local oil = require("oil")
          local entry = oil.get_cursor_entry()

          if not entry then
            return
          end

          if entry.type == "directory" then
            -- Navigate into directories normally
            oil.select()
          elseif vim.fn.winnr("$") > 1 then
            local dir = oil.get_current_dir()
            local filepath = dir .. entry.name

            -- If we have multiple windows, open file in the next window
            vim.cmd("wincmd w")
            vim.cmd("edit " .. vim.fn.fnameescape(filepath))
          else
            -- Single window, open normally
            oil.select()
          end
        end,
        desc = "Smart file opening",
      },
    },
    float = {
      padding = 4,
      border = "rounded",
    },
  },
  {
    "stevearc/quicker.nvim",
    ft = "qf",
    opts = {},
  },
}
