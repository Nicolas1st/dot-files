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
    { "dracula/vim", priority = 1000 },
    { "NLKNguyen/papercolor-theme", priority = 1000 },
    { "joshdick/onedark.vim", priority = 1000 },
    { "folke/tokyonight.nvim", lazy = false, priority = 1000, opts = {} },
    { "catppuccin/nvim", name = "catppuccin", priority = 1000 },
    { 'rose-pine/neovim', name = 'rose-pine' },
    { "ellisonleao/gruvbox.nvim", priority = 1000 , config = true },
    {
        'nvim-telescope/telescope.nvim', tag = '0.1.5',
        dependencies = { 'nvim-lua/plenary.nvim' }
    },
    { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
    -- { "xiyaowong/transparent.nvim" },
    {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v3.x",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons",
            "MunifTanjim/nui.nvim",
        },
    },
    {'akinsho/toggleterm.nvim', version = "*", config = true},
}
opts = {}

require("lazy").setup(plugins, opts)

-- seting keymaps
local builtin = require("telescope.builtin")
vim.keymap.set('n', '<leader>e', builtin.find_files, {})
vim.keymap.set('n', '<A-e>', builtin.find_files, {})
vim.keymap.set('n', '<leader>s', builtin.live_grep, {})
vim.keymap.set('n', '<A-s>', builtin.live_grep, {})
vim.keymap.set('n', '<leader>l', ":Neotree toggle<CR>")
vim.keymap.set('n', '<leader>f', ":Neotree filesystem reveal left<CR>")

local config = require("nvim-treesitter.configs")
config.setup({
    ensure_installed={"lua", "go", "c", "bash"},
    highlight = { enable = true },
    indent = { enable = true }
})

-- require("catppuccin").setup()

-- vim.cmd("TransparentEnable")
require("tokyonight").setup {
    transparent = true,
    styles = {
       sidebars = "transparent",
       floats = "transparent",
    }
}

vim.cmd.colorscheme "tokyonight"
