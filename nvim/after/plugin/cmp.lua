local cmp = require('cmp')


cmp.setup({
    window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
    },
    mapping = cmp.mapping.preset.insert({
        ['<C-,>'] = cmp.mapping.scroll_docs(-4),
        ['<C-.>'] = cmp.mapping.scroll_docs(4),
    })
})
