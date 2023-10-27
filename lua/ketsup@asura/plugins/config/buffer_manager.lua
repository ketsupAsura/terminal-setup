local opts = { noremap = true }
local map = vim.keymap.set
local buffer_manager = require "buffer_manager"

buffer_manager.setup({

    line_keys = "1234567890",
    select_menu_item_commands = {
        edit = {
            key = "<CR>",
            command = "edit"
        },
        v = {
            key = "<C-v>",
            command = "vsplit"
        },
        h = {
            key = "<C-h>",
            command = "split"
        },
    },
    focus_alternate_buffer = false,
    short_file_names = true,
    short_term_names = true,
    loop_nav = true,
    highlight = "",
    win_extra_options = { number = false },
    borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },

})

local bmui = require("buffer_manager.ui")

map("n", "<leader>b", bmui.toggle_quick_menu, opts)
