return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      local ensure = { "c", "c_sharp", "go", "lua", "vim", "vimdoc", "query", "markdown", "markdown_inline" }
      local installed = require("nvim-treesitter.config").get_installed()
      local to_install = vim.tbl_filter(function(lang)
        return not vim.tbl_contains(installed, lang)
      end, ensure)
      if #to_install > 0 then
        require("nvim-treesitter.install").install(to_install)
      end
    end,
  },
}
