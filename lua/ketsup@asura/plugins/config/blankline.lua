local blankline = require "indent_blankline"

blankline.setup({
    indentLine_enabled = 1,
    filetype_exclude = {
        "help",
        "terminal",
        "lazy",
        "lspinfo",
        "mason",
        "buffer_manager",
        "",
    },
    buftype_exclude = { "terminal" },
    show_trailing_blankline_indent = false,
    show_first_indent_level = false,
    show_current_context = false,
    show_current_context_start = false,
})
