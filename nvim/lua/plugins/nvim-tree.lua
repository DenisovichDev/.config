return {
    {
        "nvim-tree/nvim-tree.lua",
        dependencies = {
            "nvim-tree/nvim-web-devicons",
        },

        config = function()
            require("nvim-tree").setup({
                sort_by = "case_sensitive",

                view = {
                    width = 35,
                },
                renderer = {
                    group_empty = true,
                },
                filters = {
                    dotfiles = false,
                    custom = { "^\\.([^.]*)\\.sw[a-z]$", "\\.swp$" },
                },
                git = {
                    ignore = false,
                },
            })

            -- Keymaps
            vim.keymap.set("n", "<F5>", "<cmd>NvimTreeToggle<CR>",
                { desc = "Toggle file explorer" })

            vim.keymap.set("n", "<leader>o", "<cmd>NvimTreeFocus<CR>",
                { desc = "Focus file explorer" })
        end,
    },
}
