-- Notes 
-- vim.fn.getbufvar(bufnr, "&filetype") 
--      └> can be used to retrieve the filetype value for any buffer
-- vim.bo.filetype 
--      └> specifically refers to the filetype of the currently active buffer.
-- vim.api.nvim_buf_get_name(buf) 
--       └> returns the full path of the file associated with the buffer buf. 
--       If the buffer is not associated with a file, it returns an empty string.
-- vim.fn.bufname(bufnr) 
--       └> returns the name of the file associated with the buffer bufnr as a string. 
--       If the buffer is not associated with a file, it returns an empty string.
--

-- icons based on file types
local file_icons = {
    ["lua"] = { " ", guifg = "#4682B4" },
    [ "python" ] = { " ", guifg = "#F4C430" }, -- ffde57, 4584b6, 646464
    [ "cpp" ] = { " ", guifg = "#6495ED" },
    [ "java" ] = { "󰬷 ", guifg = "#FF5733" },
    [ "c" ] = { " ", guifg = "#555555" },
    [ "json" ] = { "󰘦 ", guifg = "#F4C430" },
    [ "rust" ] = " ",
}

-- Function to determine the icon for a buffer
local function get_file_icon(bufnr)
    local filetype = vim.fn.getbufvar(bufnr, "&filetype") -- returns the filtype of an open buffer
    return file_icons[filetype] or " " -- Default icon
end

-- Function for the render format
local myRender_fmt = function(props)
        local icon = get_file_icon(props.buf)

        local bufname = vim.api.nvim_buf_get_name(props.buf)
        -- local bufname = vim.fn.bufname(props.buf)

        local fmt = bufname ~= '' and vim.fn.fnamemodify(bufname, ':t') or '[No Name]'
        if vim.api.nvim_buf_get_option(props.buf, 'modified') then
            fmt = fmt .. ' '
        end


        return {
            { icon },
            { fmt },
        }

end


-- Set up incline.nvim
require("incline").setup {
    render = myRender_fmt,
    window = {
        winhighlight = {
            active = { Normal = "InclineNormal" },
            inactive = { Normal = "InclineNormalNC" },
        },
    },
}
