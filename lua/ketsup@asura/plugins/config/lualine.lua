-- TODO:
-- add color to the custom components

-- FIX:
-- time_fmt() -> it sometimes break the component

local lualine = require "lualine"

local left_icon = function()
    return ' '
end

local right_icon = function()
    return ' '
end

local mode_fmt = function(str)
    return " " .. str:sub(1, 1) .. " "
end

local time_fmt = function()
    local fmt = nil
    local cond1 = os.date("%p")
    local cond2 = tonumber(os.date("%I"))

    if cond1 == "am" then
        if cond2 < 5 then
            fmt = "  %I:%M"
        elseif cond2 <= 6 then
            fmt = " %I:%M"
        end
    elseif cond1 == "pm" then
        if cond2 >= 7 then
            fmt = " %I:%M"
        elseif cond2 >= 4 then
            fmt = " %I:%M"
        end
    else
        fmt = " %I:%M"
    end
    return fmt
end

local nvimbattery = {
    function()
        return require("battery").get_status_line()
    end,
}

local lspName = function()
    local msg = ''
    local buf_ft = vim.api.nvim_buf_get_option(0, 'filetype')
    local clients = vim.lsp.get_active_clients()
    if next(clients) == nil then
        return msg
    end
    for _, client in ipairs(clients) do
        local filetypes = client.config.filetypes
        if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
            return client.name
        end
    end
    return msg
end

lualine.setup {
    options = {
        icons_enabled = true,
        theme = "horizon",
        component_separators = { left = '', right = '' },
        section_separators = { left = '', right = '' },
        disabled_filetypes = {
            statusline = { "toggleterm" },
            winbar = {},
        },
        ignore_focus = { "NvimTree" },
        always_divide_middle = true,
        globalstatus = true,
        refresh = {
            statusline = 1000,
            tabline = 1000,
            winbar = 1000,
        }
    },
    sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {
            {
                left_icon,
                color = { fg = '#337a2c' },        -- Sets highlighting of component
                padding = { left = 0, right = 0 }, -- We don't need space before this
            },

            {
                'mode',
                fmt = mode_fmt,
                --separator = { left = ' ', right = ' '},
            },

            {
                "branch",
                icons_enabled = true,
                icon = { "", align = "left", color = { fg = "#d0342c" } },
                color = { fg = "#d0342c" },
            },

            { "diff" }, -- when editing a github file

            lspName,

            {
                "diagnostics",
                sections = { 'error', 'warn', 'hint' },
                sources = { 'nvim_lsp', 'nvim_diagnostic', 'coc' },
                symbols = { error = ' ', warn = ' ', hint = ' ' },
                update_in_insert = true,
            },


            function()
                return "%="
            end,

            { "filename" },

        },
        lualine_x = {

            { "filetype" },

            { 'progress' },

            {
                'datetime',
                style = "%I:%M %p",
                --separator = { left = ' ', right = ' '},
            },

            {
                right_icon,
                color = { fg = '#337a2c' },
                padding = { left = 0 },
            },
        },
        lualine_y = {},
        lualine_z = {}
    },
    inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {},
        lualine_x = {},
        lualine_y = {},
        lualine_z = {}
    },
    tabline = {},
    winbar = {},
    inactive_winbar = {},
    extensions = {}
}
