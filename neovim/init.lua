vim.g.mapleader = " "
vim.opt.swapfile = false

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
opts = {}

require("options")
require("bindings")
require("lazy").setup("plugins")

