-- TODO: Read the tagbar md -> very useful especially in large database

function get_current_filetype()
    return vim.bo.filetype
end

require "ketsup@asura.options"
require "ketsup@asura.mappings"
require "ketsup@asura.terminal"

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- bootsrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

require "ketsup@asura.plugins"

vim.lsp.set_log_level("debug")


