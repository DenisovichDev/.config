local api = vim.api


-- Numbermode Toggle
local numtogglegrp = api.nvim_create_augroup("numbertoggle", { clear = true })
api.nvim_create_autocmd({ "BufEnter", "FocusGained", "InsertLeave", "CmdlineLeave", "WinEnter" }, {
   pattern = "*",
   group = numtogglegrp,
   callback = function()
      if vim.o.nu and api.nvim_get_mode().mode ~= "i" then
         vim.opt.relativenumber = true
      end
   end,
})
api.nvim_create_autocmd({ "BufLeave", "FocusLost", "InsertEnter", "CmdlineEnter", "WinLeave" }, {
   pattern = "*",
   group = numtogglegrp,
   callback = function()
      if vim.o.nu then
         vim.opt.relativenumber = false
         -- Conditional taken from https://github.com/rockyzhang24/dotfiles/commit/03dd14b5d43f812661b88c4660c03d714132abcf
         -- Workaround for https://github.com/neovim/neovim/issues/32068
         if not vim.tbl_contains({"@", "-"}, vim.v.event.cmdtype) then
            vim.cmd "redraw"
         end
      end
   end,
})

-- Highlight on yank
local yankgrp = api.nvim_create_augroup("YankHighlight", { clear = true })
api.nvim_create_autocmd("TextYankPost", {
    command = "silent! lua vim.highlight.on_yank()",
    group = yankgrp
})

-- Hide cursor when inactive
local cursorgrp = api.nvim_create_augroup("CursorLine", { clear = true })
api.nvim_create_autocmd(
    {"WinEnter", "InsertEnter"}, {
        pattern = "*",
        command = "set cursorline",
        group = cursorgrp
    }
)
api.nvim_create_autocmd(
    {"WinLeave", "InsertLeave"}, {
        pattern = "*",
        command = "set nocursorline",
        group = cursorgrp
    }
)
-- go to last loc when opening a buffer
api.nvim_create_autocmd("BufReadPost",
    { 
        command = [[if line("'\"") > 1 && line("'\"") <= line("$") | execute "normal! g'\"" | endif]],
        group = cursorgrp
    }
)

-- check if we need to reload the file when it changed
api.nvim_create_autocmd("FocusGained", { command = [[:checktime]] })


