return {
  {
    "nvim-treesitter/nvim-treesitter",
    branch = "main",
    opts = {
      playground = { enable = true },
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
      },
    },
  },
  {
    "nvim-treesitter/nvim-treesitter-textobjects",
    opts = {
      move = {
        set_jumps = true,
      },
    },
  },
}
