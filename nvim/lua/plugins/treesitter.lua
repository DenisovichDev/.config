------------------------------------
-- Neovim Config Files
------------------------------------

-- Copyright: DenisovichDev
-- (https://denisovichdev.github.io/link-tree)

return {
    {
        'nvim-treesitter/nvim-treesitter',
        lazy = false,
        build = ':TSUpdate',

        config = function()
            -- require('nvim-treesitter').setup({})

            require('nvim-treesitter').install({
                "lua",
                "vim",
                "vimdoc",
                "query",

                "bash",
                "c",
                "cpp",
                "python",

                "markdown",
                "markdown_inline",
                "latex",

                "json",
                "yaml",
                "toml",

                "html",
                "css",
                "javascript",
                "typescript",
            })

            vim.api.nvim_create_autocmd("FileType", {
                pattern = {
                    "lua",
                    "vim",
                    "c",
                    "cpp",
                    "python",
                    "javascript",
                    "typescript",
                    "html",
                    "css",
                    "markdown",
                    "json",
                    "yaml",
                    "toml",
                    "bash",
                    "tex",
                },

                callback = function()
                    vim.treesitter.start()

                    vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
                end,
            })
        end,

    },
}
