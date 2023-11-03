require("go").setup {
    tag_options="",
    test_runner='richgo',
    run_in_floaterm=true,
    floaterm = {   -- position
        posititon = 'auto', -- one of {`top`, `bottom`, `left`, `right`, `center`, `auto`}
        width = 0.45, -- width of float window if not auto
        height = 0.98, -- height of float window if not auto
        title_colors = 'dracula', -- default to nord, one of {'nord', 'tokyo', 'dracula', 'rainbow', 'solarized ', 'monokai'}
  },
}
-- require("gopher").setup {
--   commands = {
--     go = "go",
--     gomodifytags = "gomodifytags",
--     gotests = "~/go/bin/gotests", -- also you can set custom command path
--     impl = "impl",
--     iferr = "iferr",
--   },
-- }
-- Run gofmt + goimport on save

local format_sync_grp = vim.api.nvim_create_augroup("GoImport", {})
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*.go",
  callback = function()
   require('go.format').goimport()
  end,
  group = format_sync_grp,
})




vim.keymap.set("n", "<leader>gie", "<cmd> GoIfErr <CR>") 
vim.keymap.set("n", "<leader>gtj", "<cmd> GoAddTag json <CR>") 
vim.keymap.set("n", "<leader>gtd", "<cmd> GoAddTag db <CR>")
vim.keymap.set("n", "<leader>gfs", "<cmd> GoFillStruct <CR>")

