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
        "stylua",
        "taplo",
        "templ",
        "vtsls",
        "yaml-language-server",
        "zls",
      },
      ui = {
        border = "rounded",
        icons = {
          package_installed = "✔️",
          package_pending = "",
          package_uninstalled = "",
        },
      },
    },
  },
  {
    "neovim/nvim-lspconfig",
    opts = {
      settings = {
        yaml = {
          format = false,
          schemas = {
            ["https://raw.githubusercontent.com/sumup/fleet-kubernetes/refs/heads/main/charts/fleet-web-service/values.schema.json?token=GHSAT0AAAAAACXJGU6GANYI4CA5TFGM75UG2EZW6YA"] = "**/values.yaml",
          },
        },
      },
      servers = {
        gopls = {
          settings = {
            gopls = {
              buildFlags = { "-tags=test unit integration mage" },
              codelenses = {
                gc_details = true,
              },
            },
          },
        },
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
          win = {
            auto_close = true,
            type = "float",
            border = "rounded",
            size = { width = 0.4, height = 0.7 },
            position = { 5, 20 },
            title = " LSP References",
          },
          preview = {
            auto_close = true,
            type = "float",
            border = "rounded",
            size = { width = 0.4, height = 0.7 },
            position = { 5, 100 },
            zindex = 500,
          },
          keys = {
            q = "close",
            ["<esc>"] = "close",
            ["<cr>"] = "jump_close",
          },
        },
      },
    },
  },
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        sql = {},
      },
    },
  },
}
