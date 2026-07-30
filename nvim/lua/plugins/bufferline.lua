------------------------------------
-- Neovim Config Files
------------------------------------

-- Copyright: DenisovichDev
-- (https://denisovichdev.github.io/link-tree)

return {
    {
        'akinsho/bufferline.nvim',
        version = "*",
        dependencies = {
            'nvim-tree/nvim-web-devicons'
        },

        config = function()
            require("bufferline").setup {
                options = {
                    separator_style = "slant",
                    -- hover = {
                    --     enabled = true,
                    --     delay = 200,
                    --     reveal = { 'close' }
                    -- }
                },
            }
        end,
    }
}
