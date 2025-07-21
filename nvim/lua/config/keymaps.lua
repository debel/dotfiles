-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

function simple_table_to_string(tbl)
  local result = "{"
  for k, v in pairs(tbl) do
    local key = type(k) == "number" and "[" .. k .. "]" or k
    local value
    if type(v) == "string" then
      value = '"' .. v .. '"'
    elseif type(v) == "table" then
      value = simple_table_to_string(v)
    else
      value = tostring(v)
    end
    result = result .. key .. "=" .. value .. ", "
  end
  result = result:sub(1, -3) .. "}" -- Remove last comma and space
  return result
end

LazyVim.safe_keymap_set("n", "[j", "<C-o>", { desc = "jump to next jump list location" })
LazyVim.safe_keymap_set("n", "]j", "<C-i>", { desc = "jump to previous jump list location" })

LazyVim.safe_keymap_set("n", "<leader>t", function()
  Snacks.terminal()
end, { desc = "Toggle terminal" })

LazyVim.safe_keymap_set("n", "<leader>'", function()
  LazyVim.pick("files", { no_ignore = true })()
end, { desc = "Explore all files (including ignored)" })

LazyVim.safe_keymap_set("n", "<leader>c'0", "<cmd>LspStop<cr>", { desc = "Stop LSP for buffer" })
LazyVim.safe_keymap_set("n", "<leader>c'1", "<cmd>LspStart<cr>", { desc = "Start LSP for buffer" })

LazyVim.safe_keymap_set("n", "<leader>si", function()
  Snacks.picker.icons()
end, { desc = "Show picker for emojis" })

LazyVim.safe_keymap_set("n", "B", function()
  require("gitsigns").blame_line({ full = false })
end, { desc = "Show git blame tooltip for current line" })

LazyVim.safe_keymap_set("n", "gm", function()
  require("fzf-lua").lsp_live_workspace_symbols({
    lsp_query = vim.fn.expand("<cword>"),
    kind = "Method",
  })
end, { desc = "List methods belonging to given struct" })
