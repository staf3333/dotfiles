return {
    {
        'MeanderingProgrammer/render-markdown.nvim',
        ft = { 'markdown', 'codecompanion' },
        dependencies = {
            'nvim-treesitter/nvim-treesitter',
            'echasnovski/mini.nvim',
        },
        opts = {},
        keys = {
            {
                '<leader>mr',
                '<cmd>RenderMarkdown buf_toggle<cr>',
                ft = { 'markdown', 'codecompanion' },
                desc = 'Render Markdown (in-buffer) toggle',
            },
        },
    },
}
