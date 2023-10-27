local treesitter = require "nvim-treesitter.configs"

treesitter.setup({
    ensure_installed = { "lua", "python", "cpp" },

    highlight = {
      enable = true,
      use_languagetree = true,
    },

    indent = { enable = true },
})
