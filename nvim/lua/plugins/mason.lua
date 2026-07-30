------------------------------------
-- Neovim Config Files
------------------------------------

-- Copyright: DenisovichDev
-- (https://denisovichdev.github.io/link-tree)

return {
    {
        -- Install Mason
        'mason-org/mason.nvim',
        opts = {
            ui = {
                border = "rounded",
                height = 0.85,
                width = 0.8,
            },
        },
    },
    {
        -- Bridge between mason.nvim and nvim with lspconfig
        -- https://github.com/mason-org/mason-lspconfig.nvim
        "mason-org/mason-lspconfig.nvim",
        opts = {
            ensure_installed = {
                "lua_ls",
                "clangd",
                "jdtls",
                "pyright",
                "bashls",
                "jsonls",
                "html",
                "cssls",
                "ts_ls",
                "yamlls",
                "taplo",
            },
        },
        dependencies = {
            { "mason-org/mason.nvim", opts = {} },
            "neovim/nvim-lspconfig",
        },
    },

}
