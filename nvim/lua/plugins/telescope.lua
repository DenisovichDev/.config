------------------------------------
-- Neovim Config Files
------------------------------------

-- Copyright: DenisovichDev
-- (https://denisovichdev.github.io/link-tree)

return {
    {
        'nvim-telescope/telescope.nvim',
        version = '*',
        dependencies = {
            'nvim-lua/plenary.nvim',
            -- optional but recommended
            { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
        },
        keys = {
            { '<leader>ff', require('telescope.builtin').find_files, mode = 'n', desc = 'Find files' },
            { '<leader>fg', require('telescope.builtin').live_grep,  mode = 'n', desc = 'Live grep' },
            { '<leader>fb', require('telescope.builtin').buffers,    mode = 'n', desc = 'List buffers' },
            { '<leader>fr', require('telescope.builtin').resume,     mode = 'n', desc = 'Resume picker' },
        },
    }
}
