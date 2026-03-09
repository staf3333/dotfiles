return {
  {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    opts = {
      notifier = { enabled = true },
      dashboard = { enabled = true },
      scroll = { enabled = true },
      zen = { enabled = true },
      lazygit = { enabled = true },
      rename = { enabled = true },
      words = { enabled = true },
      gitbrowse = {
        enabled = true,
        url_patterns = {
          ["visualstudio%.com"] = {
            branch = "?version=GB{branch}",
            file = "?path=/{file}&version=GB{branch}&line={line_start}&lineEnd={line_end}",
            permalink = "?path=/{file}&version=GC{commit}&line={line_start}&lineEnd={line_end}",
            commit = "/commit/{commit}",
          },
        },
      },
      indent = { enabled = true },
    },
    keys = {
      { "<leader>z", function() Snacks.zen() end, desc = "Toggle Zen Mode" },
      { "<leader>gg", function() Snacks.lazygit() end, desc = "Lazygit" },
      { "<leader>gb", function() Snacks.gitbrowse() end, desc = "Git Browse (open in GitHub)" },
      { "<leader>nh", function() Snacks.notifier.show_history() end, desc = "Notification History" },
      { "<leader>nd", function() Snacks.notifier.hide() end, desc = "Dismiss Notifications" },
      { "]]", function() Snacks.words.jump(vim.v.count1) end, desc = "Next word reference", mode = { "n", "t" } },
      { "[[", function() Snacks.words.jump(-vim.v.count1) end, desc = "Prev word reference", mode = { "n", "t" } },
    },
  },
}
