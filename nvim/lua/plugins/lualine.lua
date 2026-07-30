------------------------------------
-- Neovim Config Files
------------------------------------

-- Copyright: DenisovichDev
-- (https://denisovichdev.github.io/link-tree)

return {
    {
        'nvim-lualine/lualine.nvim',
        dependencies = {
            'nvim-tree/nvim-web-devicons',
        },

        config = function()
            require("lualine").setup {
                options = {
                    theme = "material",
                    globalstatus = true,
                    -- component_separators = { left = '', right = '' },
                    -- section_separators = { left = '', right = '' },
                },
            }
        end,
    },

}
