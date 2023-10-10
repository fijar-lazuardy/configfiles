require("go").setup()
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
vim.keymap.set("n", "<leader>gtj", "<cmd> GoTagAdd json <CR>") 
vim.keymap.set("n", "<leader>gtd", "<cmd> GoTagAdd db <CR>")
vim.keymap.set("n", "<leader>gfs", "<cmd> GoFillStruct <CR>")
