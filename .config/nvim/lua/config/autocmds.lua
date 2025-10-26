-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

local function populate_workspace_diagnostics()
  local clients = vim.lsp.get_clients()

  for _, client in ipairs(clients) do
    -- Check if the server supports workspace diagnostics
    if
      client.server_capabilities.diagnosticProvider
      and client.server_capabilities.diagnosticProvider.workspaceDiagnostics
    then
      -- Request workspace diagnostics
      client.request("workspace/diagnostic", {}, function(err, result)
        if err then
          vim.notify("Error getting workspace diagnostics: " .. vim.inspect(err), vim.log.levels.ERROR)
          return
        end

        if result and result.items then
          for _, item in ipairs(result.items) do
            local uri = item.uri
            local bufnr = vim.uri_to_bufnr(uri)

            -- Convert LSP diagnostics to vim diagnostics format
            local diagnostics = vim.lsp.util.locations_to_items(item.diagnostics or {}, client.offset_encoding)

            -- Set diagnostics for the buffer
            vim.diagnostic.set(
              vim.lsp.diagnostic.get_namespace(client.id),
              bufnr,
              vim.lsp.diagnostic.from_lsp_diagnostic(item.diagnostics or {})
            )
          end
        end
      end, 0)
    end
  end
end

-- vim.api.nvim_create_autocmd("BufEnter", {
--   pattern = { "*" },
--   callback = function()
--     vim.notify("loading workspace...")
--     populate_workspace_diagnostics()
--   end,
-- })
