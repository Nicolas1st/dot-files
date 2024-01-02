vim.cmd("set expandtab")
vim.cmd("set tabstop=4")
vim.cmd("set softtabstop=4")
vim.cmd("set shiftwidth=4")
vim.cmd("set number")
vim.cmd("set relativenumber")
vim.cmd("set nohls")
vim.cmd("set ignorecase")
vim.cmd("set smartcase")

vim.g.mapleader = " "

-- install the "lazy" plugin manager if it's not installed yet
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- plugins the lazy plugin manager will install
plugins = {
    { "catppuccin/nvim", name = "catppuccin", priority = 1000 },
    {
        'nvim-telescope/telescope.nvim', tag = '0.1.5',
        dependencies = { 'nvim-lua/plenary.nvim' }
    },
    { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
    { "xiyaowong/transparent.nvim" }
}
opts = {}

require("lazy").setup(plugins, opts)

-- seting keymaps
local builtin = require("telescope.builtin")
vim.keymap.set('n', '<leader>fe', builtin.find_files, {})
vim.keymap.set('n', '<A-e>', builtin.find_files, {})
vim.keymap.set('n', '<leader>fd', builtin.live_grep, {})
vim.keymap.set('n', '<A-s>', builtin.live_grep, {})

local config = require("nvim-treesitter.configs")
config.setup({
    ensure_installed={"lua", "go", "c", "bash"},
    highlight = { enable = true },
    indent = { enable = true }
})

require("catppuccin").setup()
vim.cmd.colorscheme "catppuccin"

vim.cmd("TransparentEnable")
