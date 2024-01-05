return {
    "nvim-neo-tree/neo-tree.nvim",
    name = "neotree",
    branch = "v3.x",
    netrw_hijack_behavior = "open_split",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons",
        "MunifTanjim/nui.nvim",
    },
    config = function()
        require("neo-tree").setup({
            filesystem = {
                hijack_netrw_behavior = "open_current",
            },
        })
    end
}
