-- Define the signs shown in the sign column

vim.diagnostic.config({
    signs = {
        text = {
            [vim.diagnostic.severity.ERROR] = " ",
            [vim.diagnostic.severity.WARN]  = " ",
            [vim.diagnostic.severity.INFO]  = " ",
            [vim.diagnostic.severity.HINT]  = "󰌶 ",
        },
    },

    -- virtual_text = {
    --     spacing = 4,
    --     source = "if_many",
    --     prefix = "●",
    -- },

    virtual_text = false,

    underline = true,

    update_in_insert = false,

    severity_sort = true,

    float = {
        focusable = true,
        style = "minimal",
        border = "rounded",
        source = "if_many",
        header = "",
        prefix = "",
    },
})
