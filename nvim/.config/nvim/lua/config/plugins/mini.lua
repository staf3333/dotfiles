-- lua/custom/plugins/mini.lua
return {
    {
        'echasnovski/mini.nvim',
        config = function()
            require('mini.pairs').setup()

            local statusline = require 'mini.statusline'
            statusline.setup { use_icons = true }
        end
    }
}
