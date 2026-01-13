return {
  "yetone/avante.nvim",
  lazy = false,
  opts = {
    provider = "ollama",
    providers = {
      ollama = {
        endpoint = "http://127.0.0.1:11434",
        model = "gpt-local-coder",
      },
    },
  },
}
