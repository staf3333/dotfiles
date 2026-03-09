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
      require("lspconfig").lua_ls.setup { capabilities = capabilities }
      require("lspconfig").pyright.setup { capabilities = capabilities }
      require("lspconfig").gopls.setup { capabilities = capabilities }
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
          map("gr", vim.lsp.buf.references, "Find references")
          map("gi", vim.lsp.buf.implementation, "Go to implementation")
          map("<leader>gt", vim.lsp.buf.type_definition, "Go to type definition")

          -- info
          map("K", vim.lsp.buf.hover, "Hover docs")
          map("<leader>sh", vim.lsp.buf.signature_help, "Signature help")

          -- actions
          vim.keymap.set("n", "<leader>rn", function()
            return ":IncRename " .. vim.fn.expand("<cword>")
          end, { buffer = args.buf, desc = "LSP: Rename symbol", expr = true })
          map("<leader>ca", vim.lsp.buf.code_action, "Code action")

          -- diagnostics
          map("[d", vim.diagnostic.goto_prev, "Previous diagnostic")
          map("]d", vim.diagnostic.goto_next, "Next diagnostic")
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
