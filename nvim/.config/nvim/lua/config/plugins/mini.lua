-- lua/custom/plugins/mini.lua
return {
    {
        'echasnovski/mini.nvim',
        config = function()
            require('mini.pairs').setup()
            require('mini.surround').setup({
                mappings = {
                    add = 'gsa',
                    delete = 'gsd',
                    find = 'gsf',
                    find_left = 'gsF',
                    highlight = 'gsh',
                    replace = 'gsr',
                    update_n_lines = 'gsn',
                },
            })

            local statusline = require 'mini.statusline'
            statusline.setup { use_icons = true }
        end
    }
}
