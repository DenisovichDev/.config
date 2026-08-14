------------------------------------
-- Neovim Config Files
------------------------------------

-- Copyright: DenisovichDev
-- (https://denisovichdev.github.io/link-tree)


-- Calender plugin
-- Still under development, google calender implementation soon

return {
    {
        "atiladefreitas/bloocky",
        config = function()
            require("bloocky").setup({
                -- Where time blocks are persisted
                -- save_path = vim.fn.stdpath("data") .. "/bloocky_blocks.json",
                week_start = "monday"

            })
        end,
    }
}
