vim.g.undotree_WindowLayout = 2

return {
  {
    "mbbill/undotree",
    opts = {},
    keys = {
      { "<leader>z", "<cmd>UndotreeToggle<cr>", desc = "Toggle Undo Tree" },
    },
  },
}
