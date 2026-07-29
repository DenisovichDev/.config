return {
    {
        'nvim-lualine/lualine.nvim',
        dependencies = { 
            'nvim-tree/nvim-web-devicons',
            'catppuccin/nvim',
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
