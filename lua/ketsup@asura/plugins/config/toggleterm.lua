local toggleterm = require "toggleterm"

toggleterm.setup({
    size = function(term)
        if term.direction == "horizontal" then
            return 15
        elseif term.direction == "vertical" then
            return 50
        end
    end,
    direction = "tab",
    autochdir = true,
    shell = vim.o.shell,

    shade_terminals = true, -- NOTE: this option takes priority over highlights specified so if you specify Normal highlights you should set this to false
    shading_factor = '-10', -- the percentage by which to lighten terminal background, default: -30 (gets multiplied by -3 if background is light)

    winbar = {
        enabled = true,
        name_formatter = function(term)
          return " Terminal"
        end
    },
})
