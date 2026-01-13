local logos = {
  [[
      eoim  ─────────────────────────────────────────────────────────────┐
      │                                                                     │
      │  ██████╗ ███████╗██████╗ ███████╗██╗     ██████╗  ██████╗ ████████╗ │
      │  ██╔══██╗██╔════╝██╔══██╗██╔════╝██║     ██╔══██╗██╔═══██╗╚══██╔══╝ │
      │  ██║  ██║█████╗  ██████╔╝█████╗  ██║     ██████╔╝██║   ██║   ██║    │
      │  ██║  ██║██╔══╝  ██╔══██╗██╔══╝  ██║     ██╔══██╗██║   ██║   ██║    │
      │  ██████╔╝███████╗██████╔╝███████╗███████╗██████╔╝╚██████╔╝   ██║    │
      │  ╚═════╝ ╚══════╝╚═════╝ ╚══════╝╚══════╝╚═════╝  ╚═════╝    ╚═╝    │
      │             mihail.mikov@sumup.com | Verification Squad             │
      └─────────────────────────────────────────────────────────────────────┘
  ]],
  [[
           █████          █████              ████  █████               █████   
          ░░███          ░░███              ░░███ ░░███               ░░███    
        ███████   ██████  ░███████   ██████  ░███  ░███████   ██████  ███████  
       ███░░███  ███░░███ ░███░░███ ███░░███ ░███  ░███░░███ ███░░███░░░███░   
      ░███ ░███ ░███████  ░███ ░███░███████  ░███  ░███ ░███░███ ░███  ░███    
      ░███ ░███ ░███░░░   ░███ ░███░███░░░   ░███  ░███ ░███░███ ░███  ░███ ███
      ░░████████░░██████  ████████ ░░██████  █████ ████████ ░░██████   ░░█████ 
       ░░░░░░░░  ░░░░░░  ░░░░░░░░   ░░░░░░  ░░░░░ ░░░░░░░░   ░░░░░░     ░░░░░  
                          ■ grug brain with skill issues ■                     
  ]],
  [[
            \           \                 \ \                  \     
             |           |                 | |                  |    
        | \  \   \   |\   \ \   
        __ |  __\   __\   __\  |  __\   __\\_  _|  
       /   | | |   | | | |   | /   |  |    
       |   |   ____| |   |   ____| | |   | |   |  |\ 
      \ |\\   |\\  |  |\  | \  |
       \_______| \_______|\_______/  \_______|\__|\_______/  \______/   \____/ 
                       Verification Squad @ Sumup | Stay compliant!            
  ]],
  [[
                      
                                         
                                 
                                         
                      
                                eovim, btw                      
  ]],
  [[
    ████████▄   ▄████████ ████████▄   ▄█████████ ▄█    ████████▄   ▄██████▄ ▀███████▀
    ███   ▀███ ███    ███ ███    ███ ███    ██▀ ▄██  n  ███    ███ ███    ███   ███   
    ███    ███ ███        ███    ███ ███        ███  v  ███    ███ ███    ███   ███   
    ███    ███ ███▄▄▄     ███▄▄▄██▀  ███▄▄▄     ███  i  ███▄▄▄██▀  ███    ███   ███   
    ███    ███ ███▀▀▀     ███▀▀▀██▄  ███▀▀▀     ███  m  ███▀▀▀██▄  ███    ███   ███   
    ███    ███ ███        ███    ██▄ ███        ███    ███    ██▄ ███    ███   ███   
    ███   ▄███ ███    ███ ███    ███ ███    ███ ███▌    ███    ███ ███    ███   ███   
    ████████▀  ██████████ ████████▀  ██████████ ███████ ████████▀   ▀██████▀    ███   
                            ...make bugs, fix bugs; is fine...                     
  ]],
  [[
    ████████████████████████████████████████████████████████████████████████
    ███████  ████████████  ██████████████████  ██  ███████████████████  ████
    ██       ███      ███       ████      ███  ██       ████      ██       █
    █  ████  ██        ██  ████  ██        ██  ██  ████  ██  ████  ███  ████
    █  ████  ██  ████████  ████  ██  ████████  ██  ████  ██  ████  ███  ████
    ██       ███       ██       ████       ██  ██       ████      █████    █
    ████████████████████████████████████████████████████████████████████████
    █████████████████████████ spaghetti code - yum yum █████████████████████
  ]],
}

math.randomseed(os.time())
-- local project = "\n󰛂 " .. vim.fn.getcwd(0):match("([^/]+)$") .. " 󰛁"
local logo = string.gsub(logos[math.random(#logos)], "^\n$", "") -- .. project

return {
  "folke/snacks.nvim",
  opts = {
    dashboard = {
      preset = {
        header = logo,
        keys = {
          {
            action = ":lua LazyVim.pick()()",
            desc = " Find File",
            icon = "󰍉",
            key = "f",
          },
          {
            action = ":ene | startinsert",
            desc = " New File",
            icon = "",
            key = "n",
          },
          -- {
          --   action = ':lua LazyVim.pick("oldfiles")()',
          --   desc = " Recent Files",
          --   icon = "󰪶",
          --   key = "r",
          -- },
          {
            action = ':lua require("oil").toggle_float()',
            desc = " Explore Files",
            icon = "󰪶",
            key = "o",
          },
          -- {
          --   action = ":lua Snacks.terminal()",
          --   desc = " Open Terminal",
          --   icon = "",
          --   key = "t",
          -- },
          {
            action = ':lua LazyVim.pick("live_grep")()',
            desc = " Grep Text",
            icon = "󱘣",
            key = "/",
          },
          {
            action = ":lua LazyVim.pick.config_files()()",
            desc = " Edit Config",
            icon = "",
            key = "c",
          },
          {
            action = ':lua require("persistence").load()',
            desc = " Restore Session",
            icon = "󰦛",
            key = "s",
          },
          {
            action = "<cmd>Lazy<cr>",
            desc = " Lazy",
            icon = "󰒲",
            key = "l",
          },
          {
            action = "<cmd>Mason<cr>",
            desc = " Mason",
            icon = "",
            key = "m",
          },
          {
            action = "<cmd>LazyExtras<cr>",
            desc = " Lazy Extras",
            icon = "󰇳",
            key = "x",
          },
          {
            action = function()
              vim.api.nvim_input("<cmd>qa<cr>")
            end,
            desc = " Quit",
            icon = "󰩈",
            key = "q",
          },
        },
        footer = function()
          local stats = require("lazy").stats()
          local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
          return { "\n\n⚡ Neovim loaded " .. stats.loaded .. "/" .. stats.count .. " plugins in " .. ms .. "ms\n" }
        end,
      },
      sections = {
        {
          section = "header",
          padding = 0,
          gap = 0,
        },
        -- {
        --   section = "terminal",
        --   cmd = 'echo -e "Project: \\e[36m$(basename $(pwd))\\e[0m\n"',
        --   padding = 0,
        --   height = 2,
        --   gap = 0,
        --   -- width = 55,
        --   align = "center",
        -- },
        { section = "keys", gap = 1, padding = 1 },
        { section = "startup", padding = 1 },
      },
      formats = {
        header = {},
      },
    },
    terminal = {
      win = {
        style = {
          title = " terminal",
          title_pos = "left",
          border = "rounded",
          position = "float",
          backdrop = 60,
          height = 0.9,
          width = 0.9,
          zindex = 50,
        },
      },
    },
    picker = {
      win = {
        preview = {
          wo = {
            wrap = true,
          },
        },
        input = {
          keys = {
            ["<C-h>"] = {
              "toggle_hidden",
              mode = { "n", "i" },
            },
            ["<C-i>"] = {
              "toggle_ignored",
              mode = { "n", "i" },
            },
          },
        },
      },
    },
  },
  keys = {
    {
      "<leader>;h",
      function()
        Snacks.dashboard()
      end,
      desc = "Show home dashboard",
    },
  },
}
