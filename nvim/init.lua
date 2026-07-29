------------------------------------
-- Neovim Config Files
------------------------------------

-- Copyright: DenisovichDev
-- (https://denisovichdev.github.io/link-tree)

-- Autocommands
require("config.autocmds")

-- general settings
require("config.options")

-- plugin settings
require("config.plug-opts")

-- general keymaps
require("config.keymaps")

-- plugins
require("config.lazy")



--- nvim tree related, to be moved else where
 -- disable netrw at the very start of your init.lua
  vim.g.loaded_netrw = 1
  vim.g.loaded_netrwPlugin = 1

  -- optionally enable 24-bit colour
  -- vim.opt.termguicolors = true

  -- empty setup using defaults
  -- require("nvim-tree").setup()

  -- OR setup with a config

  ---@type nvim_tree.config

  --   renderer = {
  --     group_empty = true,
  --   },
  --   filters = {
  --     dotfiles = true,
  --   },
  -- }
  -- require("nvim-tree").setup(config)
-- ---





print("Hello, Lua is running seccessfully. Everything is beautiful and nothing is hurt")



