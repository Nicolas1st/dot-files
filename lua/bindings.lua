-- seting keymaps
vim.keymap.set('n', '<leader>i', ":Neotree toggle<CR>")

-- fast vertical navigation
vim.keymap.set('n', '<A-j>', '<C-d>zz')
vim.keymap.set('n', '<A-k>', '<C-u>zz')

vim.keymap.set('n', '<C-d>', '<C-d>zz')
vim.keymap.set('n', '<C-u>', '<C-u>zz')

-- more ergonomic autocomplete keys
vim.keymap.set({'i', 'v', 'n', 'c'}, '<A-n>', '<C-n>')
vim.keymap.set({'i', 'v', 'n', 'c'}, '<A-p>', '<C-p>')
vim.keymap.set({'i'}, '<A-o>', '<C-x><C-o>')

-- more ergonomic just keys
vim.keymap.set('n', '<A-i>', '<C-i>')
vim.keymap.set('n', '<A-o>', '<C-o>')

vim.keymap.set('n', '<leader>;', '<C-6>')

-- make default bindings more consistent
vim.keymap.set('n', 'Y', 'y$')

-- window manipulation shortcuts
vim.keymap.set('n', '<leader>w', "<C-w>")
vim.keymap.set('n', '<leader>h', "<C-w>h")
vim.keymap.set('n', '<leader>j', "<C-w>j")
vim.keymap.set('n', '<leader>k', "<C-w>k")
vim.keymap.set('n', '<leader>l', "<C-w>l")
vim.keymap.set('n', '<leader>s', "<C-w>s")
vim.keymap.set('n', '<leader>v', "<C-w>v")
vim.keymap.set('n', '<leader>c', "<C-w>c")
vim.keymap.set('n', '<C-c>', "<C-w>c")

-- terminal
vim.keymap.set('t', '<Esc><Esc>', "<C-\\><C-n>")
vim.keymap.set('n', '<A-r>', "<cmd>ToggleTerm direction=float<cr>")
vim.keymap.set('t', '<A-r>', "<cmd>ToggleTerm direction=float<cr>")
vim.keymap.set('i', '<A-r>', "<cmd>ToggleTerm direction=float<cr>")
vim.keymap.set('n', '<A-w>', "<cmd>w<cr>")

vim.keymap.set('n', 'zh', "<C-w>h")
vim.keymap.set('n', 'zj', "<C-w>j")
vim.keymap.set('n', 'zk', "<C-w>k")
vim.keymap.set('n', 'zl', "<C-w>l")
