return {
    {
        'rcarriga/nvim-notify',
        config = function()
            require("notify").setup {
                stages = 'fade_in_slide_out',
                background_colour = 'FloatShadow',
                timeout = 3000,
                -- max_width = 60,
                top_down = false,
            }
            vim.notify = require('notify')
        end
    },
}
