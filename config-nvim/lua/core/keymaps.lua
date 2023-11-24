local map = require("helpers.keys").map

-- Blazingly fast way out of insert mode
map("i", "jk", "<esc>")

map("v", "J", ":m '>+1<CR>gv=gv") -- move highlighted line down
map("v", "K", ":m '<-2<CR>gv=gv") -- move highlighted line up

map("n", "J", "mzJ`z") -- keep cursor in same position when appending following line
map("n", "<C-d>", "<C-d>zz") -- keep cursor in middle of screen when scrolling
map("n", "<C-u>", "<C-u>zz") -- keep cursor in middle of screen when scrolling
map("n", "n", "nzzzv") -- keep cursor in middle of screen when going through searches
map("n", "N", "Nzzzv") -- keep cursor in middle of screen when going through searches

-- map('x', '<leader>p', [["_dP]]) -- keep what is pasted (send highlighted portion into void register)

-- Yank into system clipboard
map("n", "<leader>y", [["+y]])
map("v", "<leader>y", [["+y]])
map("n", "<leader>Y", [["+Y]])

-- Paste from system clipboard
-- map('n', '<leader>p', [["+p]])
-- map('n', '<leader>P', [["+P]])
-- map('v', '<leader>p', [["+p]])
-- map('v', '<leader>P', [["+P]])

-- map('n', '<leader>d', [["_d]]) -- delete into void register (don't keep what is deleted)
-- map('v', '<leader>d', [["_d]]) -- delete into void register (don't keep what is deleted)

map("n", "Q", "<nop>") -- never press Q

-- Quick access to some common actions
-- map("n", "<leader>fw", "<cmd>w<cr>", "Write")
-- map("n", "<leader>fa", "<cmd>wa<cr>", "Write all")
-- map("n", "<leader>qq", "<cmd>q<cr>", "Quit")
map("n", "<leader>qa", "<cmd>qa!<cr>", "Quit all")
-- map("n", "<leader>dw", "<cmd>close<cr>", "Window")

-- Diagnostic keymaps
map("n", "gx", vim.diagnostic.open_float, "Show diagnostics under cursor")

-- LSP Navigation
-- Code Actions
-- map('n', 'ca', ':lua vim.lsp.buf.code_action()<CR>')
-- map('n', '<silent> <c-]>', ':lua vim.lsp.buf.definition()<CR>')
-- map('n', '<silent> <c-k>', ':lua vim.lsp.buf.signature_help()<CR>')
-- map('n', '<silent> K', ':lua vim.lsp.buf.hover()<CR>')
-- map('n', '<silent> gi', ':lua vim.lsp.buf.implementation()<CR>')
-- map('n', '<silent> gc', ':lua vim.lsp.buf.incoming_calls()<CR>')
-- map('n', '<silent> gd', ':lua vim.lsp.buf.type_definition()<CR>')
-- map('n', '<silent> gr', ':lua vim.lsp.buf.references()<CR>')
-- map('n', '<silent> gn', ':lua vim.lsp.buf.rename()<CR>')
-- map('n', '<silent> gs', ':lua vim.lsp.buf.document_symbol()<CR>')
-- map('n', '<silent> gw', ':lua vim.lsp.buf.workspace_symbol()<CR>')
--
-- map('n', '<silent> g[', ':lua vim.diagnostic.goto_prev()<CR>')
-- map('n', '<silent> g]', ':lua vim.diagnostic.goto_next()<CR>')

-- Easier access to beginning and end of lines
-- map("n", "<M-h>", "^", "Go to beginning of line")
-- map("n", "<M-l>", "$", "Go to end of line")

-- Better window navigation
map("n", "<C-h>", "<C-w><C-h>", "Navigate windows to the left")
map("n", "<C-j>", "<C-w><C-j>", "Navigate windows down")
map("n", "<C-k>", "<C-w><C-k>", "Navigate windows up")
map("n", "<C-l>", "<C-w><C-l>", "Navigate windows to the right")

-- Move with shift-arrows
map("n", "<S-Left>", "<C-w><S-h>", "Move window to the left")
map("n", "<S-Down>", "<C-w><S-j>", "Move window down")
map("n", "<S-Up>", "<C-w><S-k>", "Move window up")
map("n", "<S-Right>", "<C-w><S-l>", "Move window to the right")

-- Resize with arrows
-- map("n", "<C-Up>", ":resize +2<CR>")
-- map("n", "<C-Down>", ":resize -2<CR>")
-- map("n", "<C-Left>", ":vertical resize +2<CR>")
-- map("n", "<C-Right>", ":vertical resize -2<CR>")

-- Deleting buffers
local buffers = require("helpers.buffers")
map("n", "<leader>db", buffers.delete_this, "Delete current buffer")
map("n", "<leader>do", buffers.delete_others, "Delete other buffers")
map("n", "<leader>da", buffers.delete_all, "Delete all buffers")

-- Navigate buffers
map("n", "<S-l>", ":bnext<CR>")
map("n", "<S-h>", ":bprevious<CR>")

map("n", "<leader>bp", ":bprevious<CR>")
map("n", "<leader>bn", ":bnext<CR>")
map("n", "<leader>bf", ":bfirst<CR>")
map("n", "<leader>bl", ":blast<CR>")
map("n", "<leader>bd", ":bdelete<CR>")

-- Stay in indent mode
map("v", "<", "<gv")
map("v", ">", ">gv")

-- Switch between light and dark modes
-- map("n", "<leader>ut", function()
--     if vim.o.background == "dark" then
-- 	vim.o.background = "light"
--     else
-- 	vim.o.background = "dark"
--     end
-- end, "Toggle between light and dark themes")

-- Clear after search
-- map("n", "<leader>ur", "<cmd>nohl<cr>", "Clear highlights")

-- Comment.nvim configuration
-- current line
-- map("n", "cc", "<Plug>(comment_toggle_linewise_current)")
-- map("n", "cb", "<Plug>(comment_toggle_blockwise_current)")
map("n", "<C-_>", "<Plug>(comment_toggle_linewise_current)") -- <C-_> for control + forward slash

-- Toggle in VISUAL mode
-- map("x", "cc", "<Plug>(comment_toggle_linewise_visual)")
-- map("x", "cb", "<Plug>(comment_toggle_blockwise_visual)")
map("x", "<C-_>", "<Plug>(comment_toggle_linewise_visual)")

-- Hop keybindings
local hop = require("hop")
local directions = require("hop.hint").HintDirection
vim.keymap.set("", "f", function()
	hop.hint_char1({ direction = directions.AFTER_CURSOR, current_line_only = true })
end, { remap = true })
vim.keymap.set("", "F", function()
	hop.hint_char1({ direction = directions.BEFORE_CURSOR, current_line_only = true })
end, { remap = true })
vim.keymap.set("", "t", function()
	hop.hint_char1({ direction = directions.AFTER_CURSOR, current_line_only = true, hint_offset = -1 })
end, { remap = true })
vim.keymap.set("", "T", function()
	hop.hint_char1({ direction = directions.BEFORE_CURSOR, current_line_only = true, hint_offset = 1 })
end, { remap = true })

-- Toggle colored column at 81
map("n", "<leader>|", ':execute "set colorcolumn=" . (&colorcolumn == "" ? "81" : "")<CR>')

-- FloaTerm configuration
map("n", "<leader>t", "<Cmd>Lspsaga term_toggle<CR>")
map("t", "<Esc>", "<C-\\><C-n>:q<CR>")

-- map("n", "<leader>ff", ":lua require('telescope.builtin').find_files()<cr>")
-- map("n", "<leader>fp", ":lua require('telescope.builtin').git_files()<cr>")
-- map("n", "<leader>fg", ":lua require('telescope.builtin').live_grep()<cr>")
-- map("n", "<leader>fb", ":lua require('telescope.builtin').buffers()<cr>")
-- map("n", "<leader>fh", ":lua require('telescope.builtin').help_tags()<cr>")
-- map("n", "<leader>fd", ":lua require('telescope.builtin').diagnostics()<cr>")
-- map("n", "<leader>fs", ":lua require('telescope.builtin').lsp_workspace_symbols()<cr>")
-- map("n", "<leader>fr", ":lua require('telescope.builtin').lsp_references()<cr>")
-- map("n", "<leader>fi", ":lua require('telescope.builtin').lsp_implementations()<cr>")
-- map("n", "<leader>fl", ":lua require('telescope.builtin').treesitter()<cr>")
-- map("n", "<leader>fk", ":lua require('telescope.builtin').keymaps()<cr>")

-- map("n", "<leader>fc", ":lua require('telescope.builtin').commands()<cr>")
-- map("n", "<leader>fch", ":lua require('telescope.builtin').command_history()<cr>")
-- map("n", "<leader>fsh", ":lua require('telescope.builtin').search_history()<cr>")
-- map("n", "<leader>fmp", ":lua require('telescope.builtin').man_pages()<cr>")
-- map("n", "<leader>fgc", ":lua require('telescope.builtin').git_commits()<cr>")
-- map("n", "<leader>fgb", ":lua require('telescope.builtin').git_branches()<cr>")

-- Vimspector
vim.cmd([[
nmap <F9> <cmd>call vimspector#Launch()<cr>
nmap <F5> <cmd>call vimspector#StepOver()<cr>
nmap <F8> <cmd>call vimspector#Reset()<cr>
nmap <F11> <cmd>call vimspector#StepOver()<cr>")
nmap <F12> <cmd>call vimspector#StepOut()<cr>")
nmap <F10> <cmd>call vimspector#StepInto()<cr>")
]])
map("n", "Db", ":call vimspector#ToggleBreakpoint()<cr>")
-- map('n', "DB", ":call vimspector#ClearBreakpoints()<cr>")
map("n", "Dw", ":call vimspector#AddWatch()<cr>")
map("n", "De", ":call vimspector#Evaluate()<cr>")

-- map('n', '<leader>dw', ':VimspectorWatch ')
map("n", "<leader>de", ":VimspectorEval ")

-- Todo List
map("n", "<leader>qf", ":TodoQuickFix<CR>")

-- Trouble
map("n", "<leader>e", ":TroubleToggle<CR>")

map("n", "<leader>u", ":UndotreeToggle<CR>")

