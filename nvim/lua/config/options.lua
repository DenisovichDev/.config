------------------------------------
-- Neovim Config Files
------------------------------------

-- Copyright: DenisovichDev
-- (https://denisovichdev.github.io/link-tree)

local opt = vim.opt

-- Set Leader to Space
vim.g.mapleader = " "
vim.g.maplocalleader = "//"

vim.cmd('syntax on')        -- Syntax highliting
opt.hidden = true           -- Required for multiple buffers
opt.wrap = true
opt.linebreak = true

-- Additional to be Tested
opt.list = false            -- Ensure 'list' is off, as it can conflict with 'linebreak'
opt.showbreak = "↳ "        -- Prefix wrapped lines with a visual indicator
-- --------

vim.bo.fileencoding = "utf-8"
opt.pumheight = 10          -- Pop up Menu is smaller
opt.ruler = true            -- Show cursor position all the time
opt.iskeyword:append("-")   -- Treat dash separated words as word text object

opt.mouse = "a"             -- Enable your mouse
opt.splitbelow = true       -- Horizontal splits will automatically be below
opt.splitright = true
opt.termguicolors = true
opt.conceallevel = 0        -- So that I can see `` in markdown files
opt.tabstop = 4             -- Insert 2 spaces for a tab
opt.shiftwidth = 4          -- Change the number of space characters inserted for indentation
opt.smarttab = true
opt.expandtab = true        -- Converts tabs to spaces
opt.smartindent = true      -- Makes indenting smart
opt.autoindent = true       -- Good auto indent
opt.laststatus = 0          -- Always display the status line
opt.number = true           -- Line numbers
opt.cursorline = true       -- Enable highlighting of the current line
opt.background = "dark"     -- tell vim what the background color looks like
opt.showtabline = 2         -- Always show tabs
opt.showmode = false        -- We don't need to see things like -- INSERT -- anymore
opt.backup = false          -- This is recommended by coc
opt.writebackup = false     -- This is recommended by coc
opt.updatetime = 300        -- Faster completion
opt.timeoutlen = 500        -- By default timeoutlen is 1000 ms
-- Stop newline continution of comments
opt.formatoptions:remove({ "c", "r", "o" })
opt.clipboard = "unnamedplus"     -- Copy paste between vim and everything else
-- set autochdir                -- Your working directory will always be the same as your working directory

-- Write with sudo priviledges without openning with sudo nvim
-- cmap w!! w !sudo tee %

-- set shell=/bin/zsh            -- Set default shell to zsh instead of bash

vim.keymap.set('c', 'w!!', 'w !sudo tee % > /dev/null')


