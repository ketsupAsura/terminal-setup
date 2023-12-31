local options = {
    backup = false,                          -- creates a backup file
    cmdheight = 0,                           -- more space in the neovim command line for displaying messages
    completeopt = { "menuone", "noselect" }, -- mostly just for cmp
    hlsearch = false,                         -- highlight all matches on previous search pattern
    mouse = "a",                             -- allow the mouse to be used in neovim
    pumheight = 10,                          -- pop up menu height
    showmode = false,                        -- we don't need to see things like -- INSERT -- anymore
    showtabline = 0,                         -- always show tabs
    smartcase = true,                        -- smart case
    smartindent = true,                      -- make indenting smarter again
    splitbelow = true,                       -- force all horizontal splits to go below current window
    splitright = true,                       -- force all vertical splits to go to the right of current window
    swapfile = false,                        -- creates a swapfile
    termguicolors = true,                    -- set term gui colors (most terminals support this)
    timeoutlen = 300,                        -- time to wait for a mapped sequence to complete (in milliseconds)
    undofile = true,                         -- enable persistent undo
    updatetime = 300,                        -- faster completion (4000ms default)
    writebackup = false,                     -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
    expandtab = true,                        -- convert tabs to spaces
    shiftwidth = 4,                          -- the number of spaces inserted for each indentation
    tabstop = 4,                             -- insert 2 spaces for a tab
    cursorline = true,                       -- highlight the current line
    number = true,                           -- set numbered lines
    relativenumber = false,                  -- set relative numbered lines
    numberwidth = 1,                         -- column width 
    wildmenu = true,
    background = 'dark',
    clipboard = 'unnamedplus',               -- copy to the system's clipboard

    signcolumn = "yes",                      -- always show the sign column, otherwise it would shift the text each time
    wrap = false,                            -- display lines as one long line
    linebreak = false,                       -- companion to wrap, don't split words
    scrolloff = 8,                           -- minimal number of screen lines to keep above and below the cursor
    sidescrolloff = 8,                       -- minimal number of screen columns either side of cursor if wrap is `false`
    whichwrap = "bs<>[]hl",                  -- which "horizontal" keys are allowed to travel to prev/next line

    -- set pwsh as the default terminal 
    shell = "pwsh",
    shellcmdflag = "-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.Encoding]::UTF8;",
    shellredir = "-RedirectStandardOutput %s -NoNewWindow -Wait",
    shellpipe = "2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode",
    shellquote = "",
    shellxquote = "",

}

for k, v in pairs(options) do
    vim.opt[k] = v
end

--[[vim.cmd[[
    augroup AutoSaveFolds
        autocmd!
        autocmd BufWinLeave * mkview
        autocmd BufWinEnter * silent! loadview
    augroup END
]]
