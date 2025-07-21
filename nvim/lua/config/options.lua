-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
--

vim.opt.clipboard = "unnamedplus"

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

-- vim.api.nvim_set_hl(0, "@keyword.sql", { bold = true, underline = true })
-- vim.api.nvim_set_hl(0, "@variable.member.sql", { italic = true })
-- vim.api.nvim_set_hl(0, "@type.sql", { italic = true })
-- vim.api.nvim_set_hl(0, "@variable.parameter.sql", { standout = true })
-- vim.api.nvim_set_hl(0, "@attribute.sql", { bold = true })

-- vim.api.nvim_set_hl(0, "@property.json", { bold = true })
-- vim.api.nvim_set_hl(0, "@number.json", { italic = true })
-- vim.api.nvim_set_hl(0, "@string.json", { italic = true })
-- vim.api.nvim_set_hl(0, "@boolean.json", { italic = true })
