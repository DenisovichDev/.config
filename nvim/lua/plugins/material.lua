------------------------------------
-- Neovim Config Files
------------------------------------

-- Copyright: DenisovichDev
-- (https://denisovichdev.github.io/link-tree)

return {
    {
        'marko-cerovac/material.nvim',
        config = function()
            require('material').setup({
                plugins = { -- Uncomment the plugins that you use to highlight them
                    "nvim-tree",
                },
                lualine_style = 'stealth',
            })

            -- vim.cmd.colorscheme("material")
        end,
    },
}
