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
                    theme = "tokyonight",
                    -- theme = "material",
                    globalstatus = true,

                    -- bubble theme changes
                    -- component_separators = { left = '', right = '' },
                    component_separators = '',
                    section_separators = { left = '', right = '' },

                },
                sections = {
                    lualine_a = { { 'mode', separator = { left = '' }, right_padding = 2 } },
                    lualine_b = { 'filename', 'branch' },
                    lualine_c = {
                        '%=', --[[ add your center components here in place of this comment ]]
                    },
                    lualine_x = {},
                    lualine_y = { 'filetype', 'progress' },
                    lualine_z = {
                        { 'location', separator = { right = '' }, left_padding = 2 },
                    },
                },
                inactive_sections = {
                    lualine_a = { 'filename' },
                    lualine_b = {},
                    lualine_c = {},
                    lualine_x = {},
                    lualine_y = {},
                    lualine_z = { 'location' },
                },

            }
        end,
    },

}
