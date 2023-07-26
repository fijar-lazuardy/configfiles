local options = {
  ensure_installed = { "lua", "go", "python", "rust", "python3" },
  sync_install = false,
  auto_install = true,

  highlight = {
    enable = true,
    use_languagetree = true,
    additional_vim_regex_highlighting = false,
  },

  indent = { enable = true },
}

return options
