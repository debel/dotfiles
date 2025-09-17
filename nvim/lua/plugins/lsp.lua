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
        "swiftlint",
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
    },
  },
  {
    "neovim/nvim-lspconfig",
    opts = {
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
}
