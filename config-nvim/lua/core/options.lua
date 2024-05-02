vim.opt.number = true            -- bool: Show line numbers
vim.opt.relativenumber = true    -- bool: Show relative line numbers
vim.opt.scrolloff = 8            -- int:  Min num lines of context
vim.opt.signcolumn = "yes"       -- str:  Show the sign column
vim.opt.numberwidth = 4          -- gutter width
vim.opt.cursorline = true        -- display cursor line
vim.opt.cursorlineopt = "number" --

-- [[ Filetypes ]]
vim.opt.encoding = "utf8"     -- str:  String encoding to use
vim.opt.fileencoding = "utf8" -- str:  File encoding to use

-- [[ Theme ]]
vim.opt.syntax = "ON"        -- str:  Allow syntax highlighting
vim.opt.termguicolors = true -- bool: If term supports ui color then enable

-- [[ Search ]]
vim.opt.ignorecase = true -- bool: Ignore case in search patterns
vim.opt.smartcase = true  -- bool: Override ignorecase if search contains capitals
vim.opt.incsearch = true  -- bool: Use incremental search
vim.opt.hlsearch = false  -- bool: Highlight search matches

-- [[ Whitespace ]]
vim.opt.expandtab = true -- bool: Use spaces instead of tabs
vim.opt.shiftwidth = 4   -- num:  Size of an indent
vim.opt.softtabstop = 4  -- num:  Number of spaces tabs count for in insert mode
vim.opt.tabstop = 4      -- num:  Number of spaces tabs count for

vim.opt.smartindent = true
vim.opt.autoindent = true

vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

-- [[ Splits ]]
vim.opt.splitright = true -- bool: Place new window to right of current one
vim.opt.splitbelow = true -- bool: Place new window below the current one

-- Set other options
local colorscheme = require("helpers.colorscheme")
vim.cmd.colorscheme(colorscheme)

-- Set nerd font for extra icons
vim.o.guifont = "MonacoNerdFontMono-Regular:h12"

--Set completeopt to have a better completion experience
-- :help completeopt
-- menuone: popup even when there's only one match
-- noinsert: Do not insert text until a selection is made
-- noselect: Do not select, force to select one from the menu
-- shortmess: avoid showing extra messages when using completion
-- updatetime: set updatetime for CursorHold
vim.opt.completeopt = { "menuone", "noselect", "noinsert" }
vim.opt.shortmess = vim.opt.shortmess + { c = true }
-- vim.api.nvim_set_option_value("updatetime", 300, {})
vim.api.nvim_set_option_value("updatetime", 250, {})

-- Fixed column for diagnostics to appear
-- Show autodiagnostic popup on cursor hover_range
-- Goto previous / next diagnostic warning / error
-- Show inlay_hints more frequently
vim.cmd([[
set signcolumn=yes
" Show diagnostics on hover
autocmd CursorHold * lua vim.diagnostic.open_float(nil, { focusable = false })
]])

-- Vimspector options
vim.cmd([[
let g:vimspector_sidebar_width = 85
let g:vimspector_bottombar_height = 15
let g:vimspector_terminal_maxwidth = 70
]])

-- Stop vim from automatically commenting next line after comment
vim.cmd([[
au FileType * set fo-=c fo-=r fo-=o
]])
-- vim.opt.formatoptions:remove({ "c", "r", "o" })
