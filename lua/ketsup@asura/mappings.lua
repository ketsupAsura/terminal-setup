local opts = { noremap = true, silent = true }

local term_opts = { silent = true }

-- Shorten function name
local mappings = vim.keymap.set

--Remap space as leader key
mappings("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Normal --
-- Better window navigation
mappings("n", "<C-h>", "<C-w>h", opts)
mappings("n", "<C-j>", "<C-w>j", opts)
mappings("n", "<C-k>", "<C-w>k", opts)
mappings("n", "<C-l>", "<C-w>l", opts)

-- Resize with arrows
mappings("n", "<C-Up>", ":resize -2<CR>", opts)
mappings("n", "<C-Down>", ":resize +2<CR>", opts)
mappings("n", "<C-Left>", ":vertical resize -2<CR>", opts)
mappings("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Navigate buffers
mappings("n", "<S-l>", ":bnext<CR>", opts)
mappings("n", "<S-h>", ":bprevious<CR>", opts)

-- delete buffer
mappings("n", "<leader>x", ":bdelete<CR>", opts)

-- Move text up and down
mappings("n", "<A-j>", ":m .+1<CR>==", opts)
mappings("n", "<A-k>", ":m .-2<CR>==", opts)

-- Nvim-tree
mappings("n", "<leader>e", ":NvimTreeFocus<CR>", opts)
mappings("n", "<C-n>", ":NvimTreeToggle<CR>", opts)

-- Toggleterm
mappings("n", "<M-3>", ":ToggleTerm<CR>", opts)

-- Tagbar
mappings("n", "<leader>tg", ":TagbarToggle<CR>", opts)

-- Insert --
mappings("i", "nm", "<ESC>", opts)

-- Visual --
-- Stay in indent mode
mappings("v", "<", "<gv^", opts)
mappings("v", ">", ">gv^", opts)

-- Move text up and down
mappings("v", "<A-j>", ":m '>+1<CR>gv=gv", opts)
mappings("v", "<A-k>", ":m '<-2<CR>gv=gv", opts)
mappings("v", "p", '"_dP', opts)

-- Visual Block --
-- Move text up and down
mappings("x", "J", ":m '>+1<CR>gv=gv", opts)
mappings("x", "K", ":m '<-2<CR>gv=gv", opts)
mappings("x", "<A-j>", ":m '>+1<CR>gv=gv", opts)
mappings("x", "<A-k>", ":m '<-2<CR>gv=gv", opts)

-- Terminal --
-- Better terminal navigation
-- mappings("t", "<C-h>", "<C-\\><C-N><C-w>h", term_opts)
-- mappings("t", "<C-j>", "<C-\\><C-N><C-w>j", term_opts)
-- mappings("t", "<C-k>", "<C-\\><C-N><C-w>k", term_opts)
-- mappings("t", "<C-l>", "<C-\\><C-N><C-w>l", term_opts)

mappings("t", "<M-3>", "<CMD>ToggleTerm<CR>", term_opts)
mappings('t', 'nm', "<C-\\><C-n>", term_opts)
