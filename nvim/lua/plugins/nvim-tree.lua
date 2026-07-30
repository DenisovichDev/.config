------------------------------------
-- Neovim Config Files
------------------------------------

-- Copyright: DenisovichDev
-- (https://denisovichdev.github.io/link-tree)

local function my_on_attach(bufnr)
    local api = require("nvim-tree.api")
    -- Load all default mappings
    api.config.mappings.default_on_attach(bufnr)

    local function opts(desc)
        return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
    end

    -- keymap override
    vim.keymap.set("n", "r", api.tree.reload, opts("Reload"))
    vim.keymap.set("n", "mm", api.fs.rename, opts("Rename Node"))
    vim.keymap.set("n", "ma", api.fs.create, opts("Create File or Directory"))
    vim.keymap.set("n", "dd", api.fs.remove, opts("Delete Node"))
    -- more to be added later. Run :h nvim-tree-quickstart-custom-mappings and scroll up for default mappings
end

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
                    icons = {
                        git_placement = "after", -- or "before"
                        glyphs = {
                            git = {
                                unstaged  = "󰄱",
                                staged    = "󰱒",
                                unmerged  = "",
                                renamed   = "󰁕",
                                untracked = "󰋗",
                                deleted   = "󰆴",
                                ignored   = " ",
                            },
                        },
                    },
                },
                on_attach = my_on_attach,
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
