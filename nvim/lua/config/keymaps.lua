-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua

-- helper funcs

local text_objects_move = require("nvim-treesitter-textobjects.move")

local function setup_custom_ts_move(key, selector, desc)
  LazyVim.safe_keymap_set("n", "[" .. key, function()
    text_objects_move.goto_previous_start(selector, "textobjects")
  end, { desc = "Go to previous " .. desc })

  LazyVim.safe_keymap_set("n", "]" .. key, function()
    text_objects_move.goto_next_start(selector, "textobjects")
  end, { desc = "Go to next " .. desc })
end

local function setup_custom_ts_moves(moves)
  for move_key, move_def in pairs(moves) do
    setup_custom_ts_move(move_key, move_def[1], move_def[2])
  end
end

-- keymaps

vim.keymap.set({ "n", "v" }, "x", '"_d', { desc = "delete without cutting" })
vim.keymap.set("n", "xx", '"_dd', { desc = "delete line without cutting" })

LazyVim.safe_keymap_set("n", "[j", "<C-o>", { desc = "jump to next jump list location" })
LazyVim.safe_keymap_set("n", "]j", "<C-i>", { desc = "jump to previous jump list location" })

LazyVim.safe_keymap_set("n", "<leader>t", function()
  Snacks.terminal()
end, { desc = "Toggle terminal" })

LazyVim.safe_keymap_set("n", "<leader>'", function()
  LazyVim.pick("files", { no_ignore = true })()
end, { desc = "Explore all files (including ignored)" })

LazyVim.safe_keymap_set("n", "<leader>si", function()
  Snacks.picker.icons()
end, { desc = "Show picker for emojis" })

LazyVim.safe_keymap_set("n", "B", function()
  require("gitsigns").blame_line({ full = false })
end, { desc = "Show git blame tooltip for current line" })

-- map diagnostic helpers to show errors only
LazyVim.safe_keymap_set("n", "<leader>se", function()
  require("fzf-lua").diagnostics_document({ severity_only = true, severity_limit = vim.diagnostic.severity.ERROR })
end, { desc = "Search Errors in Document" })

LazyVim.safe_keymap_set("n", "<leader>sE", function()
  require("fzf-lua").diagnostics_workspace({ severity_only = true, severity_limit = vim.diagnostic.severity.ERROR })
end, { desc = "Search Errors in Workspace" })

-- map LSP symbol search (see ../plugins/lsp.lua)
LazyVim.safe_keymap_set("n", "gS", "<cmd>Trouble lsp toggle<cr>", { desc = "Show lsp references" })

setup_custom_ts_moves({
  ["f"] = { "@debel.func", "function definition" },
  ["gt"] = { "@debel.type", "type definition" },
  ["gv"] = { "@debel.decl", "variable declaration" },
  ["gf"] = { "@debel.field", "struct / map field" },
  ["gc"] = { "@debel.call", "function call" },
  ["gg"] = { "@debel.go", "go routine" },
  ["gd"] = { "@debel.defer", "defer statement" },
  ["gr"] = { "@debel.return", "return statement" },
  ["ge"] = { "@debel.return_type", "return type" },
  ["gi"] = { "@debel.if", "conditional" },
  ["gp"] = { "@debel.param", "function parameter" },
  ["ga"] = { "@debel.arg", "function argument" },
  ["gl"] = { "@debel.loop", "loop" },
  [";s"] = { "@debel.slide", "markdown slide" },
  [";n"] = { "@debel.note", "markdown note" },
  [";l"] = { "@debel.list", "markdown list" },
  [";c"] = { "@debel.codeblock", "markdown codeblock" },
})
