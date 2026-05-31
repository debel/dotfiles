return {
  {
    "mason-org/mason.nvim",
    opts = {
      ensure_installed = {
        "vacuum",
        "delve",
        "docker-compose-language-service",
        "dockerfile-language-server",
        "gofumpt",
        "goimports",
        "golangci-lint",
        "gopls",
        "hadolint",
        "js-debug-adapter",
        "json-lsp",
        "lua-language-server",
        "markdown-toc",
        "markdownlint-cli2",
        "marksman",
        "shfmt",
        "sqlfluff",
        "sqlfmt",
        "stylua",
        "taplo",
        "templ",
        "terraform-ls",
        "tflint",
        "vtsls",
        "yaml-language-server",
        "zls",
        "bash-language-server",
        "shellcheck",
      },
      ui = {
        border = "rounded",
      },
    },
  },
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        gopls = {
          settings = {
            gopls = {
              gofumpt = true,
              codelenses = {
                gc_details = true,
                generate = true,
                run_govulncheck = true,
                test = true,
                tidy = true,
                upgrade_dependency = true,
                vendor = true,
              },
              hints = {
                assignVariableTypes = true,
                compositeLiteralFields = true,
                compositeLiteralTypes = true,
                constantTypes = true,
                functionTypeParameters = true,
                paramterName = true,
                rangeVariableTypes = true,
              },
              analyses = {
                nilness = true,
                unusedparams = true,
                unusedwrite = true,
                useany = true,
              },
              usePlaceholders = true,
              completeUnimported = true,
              staticcheck = true,
            },
          },
        },
      },
      setup = {
        gopls = function() end,
      },
    },
  },
  {
    "folke/trouble.nvim",
    opts = {
      modes = {
        lsp = {
          focus = true,
          auto_close = true,
          mode = "workspace_symbols",
          filter = {
            -- any = {
            --   kind = { "Method" },
            -- },
          },
          win = {
            type = "float",
            border = "rounded",
            size = { width = 0.4, height = 0.7 },
            position = { 10, 50 },
            title = " LSP References",
          },
          preview = {
            type = "float",
            border = "rounded",
            position = { 10, 165 },
            size = { width = 0.3, height = 0.7 },
            zindex = 500,
          },
          keys = {
            q = "close",
            ["<esc>"] = "close",
            ["<cr>"] = "jump",
          },
        },
      },
    },
  },
  {
    "nvim-neotest/neotest",
  },
}
