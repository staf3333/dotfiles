return {
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    dependencies = {
      "zbirenbaum/copilot.lua",
      "nvim-lua/plenary.nvim",
    },
    opts = {
      window = {
        layout = "vertical",
        width = 0.4,
      },
    },
    keys = {
      { "<leader>cc", "<cmd>CopilotChatToggle<cr>", desc = "Copilot Chat toggle" },
      { "<leader>ce", "<cmd>CopilotChatExplain<cr>", mode = "v", desc = "Copilot explain selection" },
      { "<leader>cr", "<cmd>CopilotChatReview<cr>", mode = "v", desc = "Copilot review selection" },
      { "<leader>cf", "<cmd>CopilotChatFix<cr>", mode = "v", desc = "Copilot fix selection" },
      { "<leader>co", "<cmd>CopilotChatOptimize<cr>", mode = "v", desc = "Copilot optimize selection" },
      { "<leader>ct", "<cmd>CopilotChatTests<cr>", mode = "v", desc = "Copilot generate tests" },
    },
  },
}
