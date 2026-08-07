return {
    {
        'RRethy/vim-illuminate',
        config = function()
            require("illuminate").configure({
                delay = 250,
                filetypes_denylist = {
                    'markdown',
                },
            })
        end,
    },
}
