return {
  "yetone/avante.nvim",
  lazy = false,
  opts = {
    provider = "copilot",
    providers = {
      ollama = {
        endpoint = "http://127.0.0.1:11434",
        model = "gpt-local-coder",
        extra_request_body = {
          options = {
            num_ctx = 131072,
            temperature = 0.15,
          },
        },
      },
      copilot = {
        model = "claude-opus-4.5",
      },
    },
  },
}
