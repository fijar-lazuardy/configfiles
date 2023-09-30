local builtin = require('telescope.builtin')
local utils = require('telescope.utils')
local actions = require('telescope.actions')

require("telescope").setup {
    defaults = {
        mappings = {
            i = {
                ["<C-F>"] = actions.results_scrolling_up,
                ["<C-I>"] = actions.results_scrolling_down
            },
            n = {
                ["<C-F>"] = actions.results_scrolling_up,
                ["<C-I>"] = actions.results_scrolling_down
            },
        },
    }
}
vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
vim.keymap.set('n', '<C-p>', builtin.git_files, {})
vim.keymap.set('n', '<leader>ps', function()
	builtin.grep_string({ search = vim.fn.input("Grep >") });
end)
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
vim.keymap.set('n', '<leader>fr', function()
    builtin.find_files({cwd = utils.buffer_dir() });
end)

