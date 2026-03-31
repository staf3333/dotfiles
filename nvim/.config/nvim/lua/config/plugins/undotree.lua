return {
  {
    "mbbill/undotree",
    config = function()
      -- Windows: use diff.exe bundled with Git
      if vim.fn.has("win32") == 1 then
        vim.g.undotree_DiffCommand = "C:\\Progra~1\\Git\\usr\\bin\\diff.exe"
      end
    end,
    keys = {
      { "<leader>u", "<cmd>UndotreeToggle<cr>", desc = "Toggle Undotree" },
    },
  },
}
