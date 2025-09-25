-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua

vim.opt.clipboard = "unnamedplus"
vim.g.lazyvim_picker = "snacks"

-- Create an autocommand group for filetype-specific highlights
local augroup = vim.api.nvim_create_augroup("DebelGoHighlights", { clear = true })

-- Function to set highlights for a specific filetype
local function set_filetype_highlights(filetype, highlights)
  vim.api.nvim_create_autocmd("FileType", {
    group = augroup,
    pattern = filetype,
    callback = function()
      for group, color in pairs(highlights) do
        vim.api.nvim_set_hl(0, group, color)
      end
    end,
  })
end

-- enable highlighting on injected sql in json inside go
set_filetype_highlights("go", {
  ["@keyword.sql"] = { bold = true, underline = true },
  ["@keyword.operator.sql"] = { bold = true },
  ["@variable.member.sql"] = { italic = true },
  ["@type.sql"] = { italic = true },
  ["@variable.parameter.sql"] = { standout = true },
  ["@attribute.sql"] = { bold = true },
  ["@property.json"] = { bold = true },
  ["@number.json"] = { italic = true },
  ["@string.json"] = { italic = true },
  ["@boolean.json"] = { italic = true },
  ["@debel.type_annotation"] = { bold = true, underline = true, standout = true },
})
