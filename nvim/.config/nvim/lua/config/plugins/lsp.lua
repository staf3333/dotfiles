return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      'saghen/blink.cmp',
      {
        "folke/lazydev.nvim",
        ft = "lua",
        opts = {
          library = {
            { path = "${3rd}/luv/library", words = { "vim%.uv" } },
          },
        },
      },
    },
    config = function()
      local capabilities = require('blink.cmp').get_lsp_capabilities()
      local servers = { 'lua_ls', 'pyright', 'gopls', 'copilot' }
      for _, server in ipairs(servers) do
        vim.lsp.config(server, { capabilities = capabilities })
      end
      vim.lsp.enable(servers)
      vim.api.nvim_create_autocmd('LspAttach', {
        callback = function(args)
          local c = vim.lsp.get_client_by_id(args.data.client_id)
          if not c then return end

          local map = function(keys, func, desc)
            vim.keymap.set("n", keys, func, { buffer = args.buf, desc = "LSP: " .. desc })
          end

          -- navigation
          map("gd", vim.lsp.buf.definition, "Go to definition")
          map("gD", vim.lsp.buf.declaration, "Go to declaration")
          map("gr", require("telescope.builtin").lsp_references, "Find references")
          map("gi", vim.lsp.buf.implementation, "Go to implementation")
          -- grt for type_definition is a built-in default in 0.12

          -- info
          map("K", vim.lsp.buf.hover, "Hover docs")
          map("<leader>sh", vim.lsp.buf.signature_help, "Signature help")

          -- actions
          map("<leader>rn", vim.lsp.buf.rename, "Rename symbol")
          map("<leader>ca", vim.lsp.buf.code_action, "Code action")
          map("grx", vim.lsp.codelens.run, "Run codelens")

          -- diagnostics ([d and ]d are built-in defaults in 0.12)
          map("<leader>e", vim.diagnostic.open_float, "Show diagnostic")

          -- manual format only
          map("<leader>f", function()
            vim.lsp.buf.format({ bufnr = args.buf, id = c.id })
          end, "Format buffer")
        end,
      })
    end,
  },
}
