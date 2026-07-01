return {
  {
    "iamcco/markdown-preview.nvim",
    ft = { "markdown" },
    cmd = { "MarkdownPreview", "MarkdownPreviewStop", "MarkdownPreviewToggle" },
    build = function(plugin)
      local app = plugin.dir .. "/app"
      local cmd = vim.fn.has("win32") == 1 and { "cmd", "/c", "npm", "install", "--no-package-lock" }
        or { "npm", "install", "--no-package-lock" }
      vim.fn.jobwait({ vim.fn.jobstart(cmd, { cwd = app }) })
    end,
    keys = {
      {
        "<leader>mp",
        "<cmd>MarkdownPreviewToggle<cr>",
        ft = "markdown",
        desc = "Markdown Preview (browser) toggle",
      },
    },
  },
}
