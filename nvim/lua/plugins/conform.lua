------------------------------------
-- Neovim Config Files
------------------------------------

-- Copyright: DenisovichDev
-- (https://denisovichdev.github.io/link-tree)

return {
    {
        "stevearc/conform.nvim",

        event = { "BufWritePre" },

        opts = {
            formatters_by_ft = {
                lua = { "stylua" },

                c = { "clang_format" },
                cpp = { "clang_format" },

                python = { "ruff_format" },

                javascript = { "prettierd" },
                typescript = { "prettierd" },

                html = { "prettierd" },
                css = { "prettierd" },

                json = { "prettierd" },
                yaml = { "prettierd" },
                markdown = { "prettierd" },
            },

            format_on_save = {
                timeout_ms = 500,
                lsp_format = "fallback",
            },
        },

        keys = {
            {
                "<leader>cf",
                function()
                    require("conform").format({
                        async = true,
                        lsp_format = "fallback",
                    })
                end,

                desc = "Format",
            },
        },
    },
}
