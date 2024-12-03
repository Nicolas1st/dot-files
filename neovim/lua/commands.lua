vim.api.nvim_create_user_command(
    'CustomCommands',
    function()
        vim.cmd("edit /home/user/.config/nvim/lua/commands.lua")
    end,
    {}
)

vim.api.nvim_create_user_command(
    'BuildGo',
    function()
        vim.cmd('cexpr system("go build main.go") | copen')
    end,
    {}
)

vim.api.nvim_create_user_command(
    'TestGo',
    function()
        vim.cmd('cexpr system("go test -v ./...") | copen')
    end,
    {}
)

