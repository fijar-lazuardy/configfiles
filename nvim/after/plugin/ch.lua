require("cheat-sheet").setup({
  auto_fill = {
    filetype = true,
    current_word = false,
  },

  main_win = {
    style = "minimal",
    border = "double",
  },

  input_win = {
    style = "minimal",
    border = "double",
  },
})

vim.keymap.set("n", "<leader>ch", "<cmd> CheatSH<CR>")
