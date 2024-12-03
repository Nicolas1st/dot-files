return {
    {
        "williamboman/mason.nvim",
        config = function()
            require("mason").setup()
        end
    },
    {
        "williamboman/mason-lspconfig.nvim",
        config = function()
            require("mason-lspconfig").setup({
                ensure_installed = { "lua_ls", "gopls", "clangd" },
            }
            )
        end
    },
    {
        "neovim/nvim-lspconfig",
        config = function()
            local lspconfig = require('lspconfig')
            lspconfig.lua_ls.setup({})
            local util = require'lspconfig.util'
            lspconfig.gopls.setup({
                -- ...some other setups
                root_dir = function(fname)
                    -- see: https://github.com/neovim/nvim-lspconfig/issues/804
                    local mod_cache = vim.trim(vim.fn.system 'go env GOMODCACHE')
                    if fname:sub(1, #mod_cache) == mod_cache then
                        local clients = vim.lsp.get_active_clients { name = 'gopls' }
                        if #clients > 0 then
                            return clients[#clients].config.root_dir
                        end
                    end
                    return util.root_pattern 'go.work'(fname) or util.root_pattern('go.mod', '.git')(fname)
                end,
            })
            lspconfig.bashls.setup({})
            lspconfig.clangd.setup({})

            vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})
            vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {})
            vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, {})
            vim.keymap.set('n', 'gr', vim.lsp.buf.rename, {})
            vim.keymap.set('n', '<leader>r', vim.lsp.buf.references, {})
            vim.keymap.set({ 'n', 'v' }, '<leader>a', vim.lsp.buf.code_action, {})
        end
    },
}
