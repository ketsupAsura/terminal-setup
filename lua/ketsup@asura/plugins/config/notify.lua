local notify = require "notify"

require("notify").setup {

    stages = 'fade_in_slide_out',
    background_colour = 'FloatShadow',
    render = 'compact',
    timeout = 3000,
}
vim.notify = require('notify')
