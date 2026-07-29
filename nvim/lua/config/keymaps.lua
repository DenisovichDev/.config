------------------------------------
-- Neovim Config Files
------------------------------------

-- Copyright: DenisovichDev
-- (https://denisovichdev.github.io/link-tree)


local map = vim.keymap.set

-- Verbal abuse for using yor arrow keys
map("n", "<Up>", ":echoerr \"Stop being such a peasant\"<CR>")
map("i", "<Up>", "<C-o>:echoerr \"Hah! What a loser\"<CR>")
map("n", "<Right>", ":echoerr \"Seriously, again?\"<CR>")
map("i", "<Right>", "<C-o>:echoerr \"Why don't you drink your piss tea, you little pissboy\"<CR>")
map("n", "<Down>", ":echoerr \"At this rate, you're never paying off your student loan\"<CR>")
map("i", "<Down>", "<C-o>:echoerr \"Just go back to VSCode in your girlfriend's computer\"<CR>")
map("n", "<Left>", ":echoerr \"ERROR: Too much stupid\"<CR>")
map("i", "<Left>", "<C-o>:echoerr \"Good day! You still suck\"<CR>")

-- wrap a word in these characters
-- double tap single quotes for double quotes since it's quicker
map("n", "<leader>\"", "viwc\"\"<Esc>P")        -- "
map("v", "<leader>\"", "c\"\"<Esc>P")           -- "
map("n", "<leader>'\'", "viwc\"\"<Esc>P")       -- "
map("v", "<leader>''", "c\"\"<Esc>P")           -- "
map("n", "<leader>'", "viwc''<Esc>P")           -- '
map("v", "<leader>'", "c''<Esc>P")              -- '

-- markdown latex keybinds
-- do <leader>* twice fo bold
map("n", "<leader>$", "viwc$$<Esc>P")
map("v", "<leader>$", "c$$<Esc>P")
map("n", "<leader>`", "viwc``<Esc>P")
map("v", "<leader>`", "c``<Esc>P")
map("n", "<leader>*", "viwc**<Esc>P")
map("v", "<leader>*", "c**<Esc>P")

-- brackets
-- p for parenths. It's closer.
map("n", "<leader>p", "viwc()<Esc>P")
map("n", "<leader>{", "viwc{}<Esc>P")
map("n", "<leader>[", "viwc[]<Esc>P")
map("v", "<leader>p", "c()<Esc>P")
map("v", "<leader>{", "c{}<Esc>P")
map("v", "<leader>[", "c[]<Esc>P")

-- Shortcuts for switching panels
-- use alt+hjkl to move between split/vsplit panels
map("t", "<A-h>", "<C-\\><C-n><C-w>h")
map("t", "<A-j>", "<C-\\><C-n><C-w>j")
map("t", "<A-k>", "<C-\\><C-n><C-w>k")
map("t", "<A-l>", "<C-\\><C-n><C-w>l")

-- Switch between split buffers
map("n", "<A-h>", "<C-w>h")
map("n", "<A-j>", "<C-w>j")
map("n", "<A-k>", "<C-w>k")
map("n", "<A-l>", "<C-w>l")

-- switch tabs with Ctrl + j/k
map("n", "<C-j>", ":bp<CR>")
map("n", "<C-k>", ":bn<CR>")

-- normal mode
map("i", "jk", "<Esc>")
-- Disable highlighting after search by Esc and /
map("n", "<Esc>/", ":noh<CR>")
map("n", "tc", ":tabclose<CR>")

-- Commenting Shortcuts
-- Recursive maps
map("n", "<C-_>", "gcc", { remap = true })
map("v", "<C-_>", "gc", {remap = true })
-- Opening/Closing markdown preview: mp return
map("n", "mp<CR>", "<Plug>MarkdownPreviewToggle", { remap = true })
-- Better tabbing
map("v", "<", "<gv")
map("v", ">", ">gv")
-- Easy CAPS
map("i", "<c-u>", "<ESC>viwUi")
map("n", "<c-u>", "viwU<Esc>")
-- Quick compile scripts
-- map <leader>g :!comp <c-r>%<CR><CR>
-- PDF preview
-- map <leader>o :!pdfout <c-r>%<CR><CR>

-- Leave terminal mode
map("t", "<Esc>", [[<C-\><C-n>]])

-- Open a terminal
map("n", "<C-n>", function()
    vim.cmd("split")
    vim.cmd("resize 10")
    vim.cmd("terminal")
end, { desc = "Open terminal" })
