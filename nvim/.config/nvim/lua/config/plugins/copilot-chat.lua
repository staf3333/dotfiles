return {
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    dependencies = {
      "zbirenbaum/copilot.lua",
      "nvim-lua/plenary.nvim",
    },
    opts = {
      model = "claude-sonnet-4.6",
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
      {
        "<leader>cq",
        function()
          local input = vim.fn.input("Copilot: ")
          if input ~= "" then
            require("CopilotChat").ask(input, { selection = require("CopilotChat.select").visual })
          end
        end,
        mode = "v",
        desc = "Copilot ask about selection",
      },
    },
  },
}
