return {
    {
        'nvim-telescope/telescope.nvim', tag = '0.1.5',
        dependencies = { 'nvim-lua/plenary.nvim' },
        config = function()
            local builtin = require("telescope.builtin")
            vim.keymap.set('n', '<leader>e', builtin.find_files, {})
            vim.keymap.set('n', '<leader>m', builtin.live_grep, {})
            vim.keymap.set('n', '<leader>b', builtin.buffers, {})
            vim.keymap.set('n', '<leader>t', ":Telescope<CR>", {})
        end
    },
    {
        "nvim-telescope/telescope-ui-select.nvim",
        config = function()
            require("telescope").setup {
                extensions = {
                    ["ui-select"] = {
                        require("telescope.themes").get_dropdown {
                        }
                    }
                }
            }
            -- this must called to make the telescope UI work
            require("telescope").load_extension("ui-select")
        end
    }
}
