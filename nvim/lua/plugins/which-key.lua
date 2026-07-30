return {
    {
        "folke/which-key.nvim",
        dependencies = {
            'nvim-tree/nvim-web-devicons',
            'nvim-mini/mini.icons'
        },
        event = "VeryLazy",
        opts = {
            preset = "modern",

            delay = 300,

            spec = {
                { "<leader>x", group = "Diagnostics" },
                { "<leader>c", group = "Code" },
                { "<leader>g", group = "Git" },
                { "<leader>f", group = "Find" },
            },
        },
        keys = {
            {
                "<leader>?",
                function()
                    require("which-key").show({ global = false })
                end,
                desc = "Buffer Local Keymaps (which-key)",
            },
        },
    }
}
