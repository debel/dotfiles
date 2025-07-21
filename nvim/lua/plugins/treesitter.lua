return {
  "nvim-treesitter/nvim-treesitter",
  keys = {
    { "[g", desc = "Golang syntax tokens" },
    { "]g", desc = "Golang syntax tokens" },
  },
  opts = {
    playground = { enable = true },
    highlight = {
      enable = true,
      additional_vim_regex_highlighting = false,
    },
    textobjects = {
      move = {
        goto_next_start = {
          ["]f"] = "@debel.func",
          ["]gt"] = "@debel.type",
          ["]gv"] = "@debel.decl",
          ["]gf"] = "@debel.field",
          ["]gc"] = "@debel.call",
          ["]gg"] = "@debel.go",
          ["]gd"] = "@debel.defer",
          ["]gr"] = "@debel.return",
          ["]ge"] = "@debel.return_type",
          ["]gi"] = "@debel.if",
          ["]gp"] = "@debel.param",
          ["]ga"] = "@debel.arg",
          ["]gl"] = "@debel.loop",
        },
        goto_previous_start = {
          ["[f"] = "@debel.func",
          ["[gt"] = "@debel.type",
          ["[gv"] = "@debel.decl",
          ["[gf"] = "@debel.field",
          ["[gc"] = "@debel.call",
          ["[gg"] = "@debel.go",
          ["[gd"] = "@debel.defer",
          ["[gr"] = "@debel.return",
          ["[ge"] = "@debel.rettype",
          ["[gi"] = "@debel.if",
          ["[gp"] = "@debel.param",
          ["[ga"] = "@debel.arg",
          ["[gl"] = "@debel.loop",
        },
      },
    },
  },
}
