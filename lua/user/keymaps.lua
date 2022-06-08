local opts = { noremap = true, silent = true }

-- Shorten Function Name
local keymap = vim.api.nvim_set_keymap

-- Remap Space as Leader Key
keymap("","<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Modes
-- 			normal_mode = "n"
-- 			insert_mode = "i"
-- 			visual_mode = "v"
-- 			visual_block_mode = "x"
-- 			term_mode = "t"
-- 			command_mode = "c"


-- Normal --
-- Better Window Navigation 
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

keymap("n", "<Space>e", ":NERDTree<cr>",opts)                 -- Explorer

-- Spell Check
keymap("n", "<F2>", ":set spell!<CR>",opts)                	-- toggle spell check
keymap("n", "<F3>", ":set spelllang=en<CR>",opts)           -- English spell check
keymap("n", "<F4>", ":set spelllang=pt_br<CR>",opts)        -- Portuguese spell check

-- Resize with Arrow
keymap("n", "<C-Up>", ":resize -2<cr>", opts)
keymap("n", "<C-Down>", ":resize +2<cr>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<cr>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<cr>", opts)

-- Navigate Buffers
keymap("n", "<S-l>", ":bnext<cr>",opts)
keymap("n", "<S-h>", ":bprevious<cr>",opts)

-- Insert --
-- Press jk Fast to Enter Normal Mode
-- keymap("i", "<CAPSLOCK>", "<ESC>", opts)

-- Visual -- 
-- Stay in Indent Mode
keymap("v", "<", "<gv",opts)
keymap("v", ">", ">gv",opts)

-- Move Text Up and Down
keymap("v", "<A-j>", ":move '>+1<CR>gv-gv",opts)
keymap("v", "<A-k>", ":move '<-2<CR>gv-gv",opts)

-- Visual Block --
-- Move text up and down
keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)

-- Terminal --
-- Better terminal navigation
--keymap("t", "<C-h>", "<C-\\><C-N><C-w>h", term_opts)
--keymap("t", "<C-j>", "<C-\\><C-N><C-w>j", term_opts)
--keymap("t", "<C-k>", "<C-\\><C-N><C-w>k", term_opts)
--keymap("t", "<C-l>", "<C-\\><C-N><C-w>l", term_opts)

-- Felipe 
--
keymap("n", "<C-s>", ":w<CR>", opts)
keymap("v", "<C-s>", ":w<CR>", opts)
keymap("n", "<C-q>", ":q<CR>", opts)
keymap("v", "<C-q>", ":q<CR>", opts)

vim.cmd("xnoremap <silent> <leader>jr :<C-u>MagmaEvaluateVisual<CR>")
keymap("n", "<Bslash>", "$", { noremap = false, silent = true })
keymap("v", "<Bslash>", "$", { noremap = false, silent = true })

keymap("n", ";", ":", opts)
-- I swapped <ESC> with CapsLock using the following command in the terminal:
-- setxkbmap -option caps:swapescape
-- With this I can use CapsL to exit the active mode (as well pop-ups)

keymap("v", "p", '"_dP', opts)

-- when changing do not yank
keymap("n", "c", '"_c', opts)
