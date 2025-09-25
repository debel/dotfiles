local logo1 = [[
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
]]

local logo2 = [[
           █████          █████              ████  █████               █████   
          ░░███          ░░███              ░░███ ░░███               ░░███    
        ███████   ██████  ░███████   ██████  ░███  ░███████   ██████  ███████  
       ███░░███  ███░░███ ░███░░███ ███░░███ ░███  ░███░░███ ███░░███░░░███░   
      ░███ ░███ ░███████  ░███ ░███░███████  ░███  ░███ ░███░███ ░███  ░███    
      ░███ ░███ ░███░░░   ░███ ░███░███░░░   ░███  ░███ ░███░███ ░███  ░███ ███
      ░░████████░░██████  ████████ ░░██████  █████ ████████ ░░██████   ░░█████ 
       ░░░░░░░░  ░░░░░░  ░░░░░░░░   ░░░░░░  ░░░░░ ░░░░░░░░   ░░░░░░     ░░░░░  
                          ■ grug brain with skill issues ■                     
]]

local logo3 = [[
            \           \                 \ \                  \     
             |           |                 | |                  |    
        | \  \   \   |\   \ \   
        __ |  __\   __\   __\  |  __\   __\\_  _|  
       /   | | |   | | | |   | /   |  |    
       |   |   ____| |   |   ____| | |   | |   |  |\ 
      \ |\\   |\\  |  |\  | \  |
       \_______| \_______|\_______/  \_______|\__|\_______/  \______/   \____/ 
                    Verification Squad @ Sumup | Stay compliant!               
]]

local logo4 = [[
                      
                                         
                                 
                                         
                      
                              eovim, btw                        
]]

local logo5 = [[
                                                             
                                                             
                                                             
       .  ..  .   ..     .   ..  
                                           
                                   
                                         
       '    '        '   ''   '
                     ...make bugs, fix bugs; is fine...                
]]

math.randomseed(os.time())
local logos = { logo1, logo2, logo3, logo4, logo5 }
local logo = logos[math.random(#logos)]

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
          {
            action = ':lua LazyVim.pick("oldfiles")()',
            desc = " Recent Files",
            icon = "󰪶",
            key = "r",
          },
          {
            action = ':lua require("oil").toggle_float()',
            desc = " Explore Files",
            icon = "󰪶",
            key = "o",
          },
          {
            action = ":lua Snacks.terminal()",
            desc = " Open Terminal",
            icon = "",
            key = "t",
          },
          {
            action = ':lua LazyVim.pick("live_grep")()',
            desc = " Grep Text",
            icon = "󱘣",
            key = "g",
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
            action = "<cmd>LazyExtras<cr>",
            desc = " Lazy Extras",
            icon = "󰇳",
            key = "x",
          },
          {
            action = "<cmd>Lazy<cr>",
            desc = " Lazy",
            icon = "󰒲",
            key = "l",
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
          return { "⚡ Neovim loaded " .. stats.loaded .. "/" .. stats.count .. " plugins in " .. ms .. "ms\n\n\n\n" }
        end,
      },
      -- sections = {
      --   { section = "startup", padding = 0 },
      --   { section = "header", padding = 0 },
      --   {
      --     section = "terminal",
      --     cmd = 'echo -e "Project: \\e[36m$(basename $(pwd))\\e[0m\n" && git jlg',
      --     width = 150,
      --     align = "center",
      --   },
      -- },
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
      "<leader>'h",
      function()
        Snacks.dashboard()
      end,
      desc = "Show home dashboard",
    },
  },
}
