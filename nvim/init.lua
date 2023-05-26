--//             ██
--//            ░░
--//    ██    ██ ██ ██████████
--//   ░██   ░██░██░░██░░██░░██
--//   ░░██ ░██ ░██ ░██ ░██ ░██
--//    ░░████  ░██ ░██ ░██ ░██
--//     ░░██   ░██ ███ ░██ ░██
--//      ░░    ░░ ░░░  ░░  ░░

--// plugins
--//-------------------------------------------------
local Plug = vim.fn['plug#']
vim.call('plug#begin', '~/.config/nvim/bundle')
  -- vim init
  Plug 'lewis6991/impatient.nvim'         -- speed up vim load time
  Plug 'nvim-lua/plenary.nvim'            -- lua functions

  -- settings
  Plug 'tpope/vim-sensible'               -- sensible defaults

  -- appearance
  Plug 'miyakogi/conoline.vim'            -- highlights the line of the cursor
  Plug 'vim-airline/vim-airline'          -- advanced status & tab line

  -- colorscheme
  Plug ('chaoslogick/dracula.vim', { as = 'dracula'}) -- custom dracula color theme

  -- syntax
  Plug 'hrsh7th/nvim-cmp'                 -- completion plugin
  Plug 'mattn/emmet-vim'                  -- fast code completion
  --Plug 'tpope/vim-sleuth'                 -- heuristically set buffer options
  Plug 'Darazaki/indent-o-matic'          -- automatic indentation
  Plug ('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})  -- treesitter syntax parsing system
  Plug 'nvim-treesitter/playground'       -- treesitter playground option, view syntax tree

  -- typing
  Plug 'tpope/vim-repeat'                 -- repeating maps with '.'
  Plug 'tpope/vim-surround'               -- modify surrounding chars
  Plug 'tpope/vim-unimpaired'             -- bracket mappings
  Plug 'chaoren/vim-wordmotion'           -- extended word motions
  Plug 'tpope/vim-rsi'                    -- readline style insertion
  Plug 'AckslD/nvim-neoclip.lua'          -- clipboard manager
  --Plug 'gelguy/wilder.nvim'               -- wilder wildmenu
  Plug 'github/copilot.vim'               -- github copilot

  -- comments
  Plug 'terrortylor/nvim-comment'         -- single line over block comment
  --Plug 'preservim/nerdcommenter'          -- comment functions

  -- file navigation
  Plug ('nvim-telescope/telescope.nvim', { tag = '0.1.0' }) -- telescope fuzzy finder
  Plug 'princejoogie/dir-telescope.nvim'  -- telescope dir extension
  Plug 'ThePrimeagen/harpoon'             -- super fast file navigation
  Plug 'preservim/nerdtree'               -- tree file navigation

  -- buffer navigation
  Plug 'ggandor/leap.nvim'                -- fast on-screen cursor navigation
  Plug 'mg979/vim-visual-multi'           -- visual multi cursor
  Plug 'kevinhwang91/nvim-bqf'            -- better quickfix window

  -- system
  Plug 'skywind3000/asyncrun.vim'         -- async run commands
  Plug 'numToStr/FTerm.nvim'              -- floating terminal
  Plug 'edluffy/hologram.nvim'            -- terminal image viewer

  -- git
  Plug 'tpope/vim-git'                    -- git commands
  Plug 'tpope/vim-fugitive'               -- git wrapper
  Plug 'rbong/vim-flog'                   -- git log viewer
  Plug 'kdheepak/lazygit.nvim'            -- lazygit wrapper
  Plug 'lewis6991/gitsigns.nvim'          -- git integration (gitlense)
  --Plug 'f-person/git-blame.nvim'          -- git blame similar to vscode's gitlens
  --Plug 'APZelos/blamer.nvim'

  -- language specific
  Plug 'tbastos/vim-lua'                  -- lua syntax
  Plug 'pangloss/vim-javascript'          -- javascript syntax support
  Plug 'posva/vim-vue'                    -- vue syntax support
  --Plug 'leafOfTree/vim-vue-plugin'        -- more vue support
  Plug 'maxmellon/vim-jsx-pretty'         -- jsx syntax support
  Plug 'neowit/vim-force.com'             -- salesforce
  Plug 'tpope/vim-rails'                  -- rails tools
  Plug 'vim-scripts/c.vim'                -- c/c++ ide

  -- lsp
  Plug 'williamboman/mason.nvim'          -- lsp, linter, dap  package manager
  --Plug 'prabirshrestha/vim-lsp'           -- async lsp
  --Plug 'neovim/nvim-lspconfig'            -- quickstart lsp config

  -- linting & testing
  Plug 'eslint/eslint'                    -- eslint
  Plug 'vim-test/vim-test'                -- fast testing

  -- debugging
  --Plug 'puremourning/vimspector'          -- multi-language graphical debugging

  -- app support
  Plug 'epwalsh/obsidian.nvim'            -- obsidian notes

  -- fun
  --Plug 'goolord/alpha-nvim'                -- start window
  --Plug 'glepnir/dashboard-nvim'            -- vim dashboard

  -- help
  Plug 'folke/which-key.nvim'             -- key bindings assistant
vim.call('plug#end')


--// command reference
--//-------------------------------------------------
-- H            -- Home
-- L            -- End
-- J            -- Join lines below
-- K            -- Open help on word
-- w/W          -- Move forward word
-- b/B          -- Move back word
-- ^f           -- PgDn
-- ^b           -- PgUp


--// general
--//-------------------------------------------------
vim.opt.history = 1000                 -- store :cmdline history
vim.opt.autoread = true                -- reload files changed outside vim
vim.opt.autowrite = true               -- continually write directly to file on disk
vim.opt.hidden = true                  -- keeps buffers hidden
vim.opt.lazyredraw = true              -- don't redraw while using macros, registers, etc.
vim.opt.magic = true                   -- for regular expressions turn magic on

-- turn backup off, most of this is under version control
vim.opt.backup = false
vim.opt.swapfile = false
vim.opt.undofile = false

-- restrict some commands in non-default .vimrc
vim.opt.secure = true

-- modelines security measure
vim.opt.modelines = 0

-- netrw
vim.g.netrw_browse_split = 0
vim.g.netrw_banner = 0
vim.g.netrw_winsize = 25


--// local options
--//------------------------------------------------
local augroup = vim.api.nvim_create_augroup
local main_group = augroup('Main', {})

local autocmd = vim.api.nvim_create_autocmd
local yank_group = augroup('HighlightYank', {})

--local map = vim.api.nvim_set_keymap
local function map(mode, lhs, rhs, opts)
  local options = { noremap=true, silent=true }
  if opts then
    options = vim.tbl_extend('force', options, opts)
  end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end


--// autocmd
--//-------------------------------------------------
-- save on losing focus
autocmd('FocusLost', { pattern = '*', command = 'wa' })

-- momentarily highlight yanked text
autocmd('TextYankPost', {
    group = yank_group,
    pattern = '*',
    callback = function()
        vim.highlight.on_yank({
            higroup = 'IncSearch',
            timeout = 40,
        })
    end,
})

-- delete trailing spaces
autocmd('BufWritePre', {
    group = main_group,
    pattern = '*',
    command = [[%s/\s\+$//e]],
})

-- return to last edit position when opening files
autocmd('BufReadPost', { pattern = '*', command = 'silent! normal! g`"zv' })


--// font & color
--//------------------------------------------------
vim.opt.background = dark                -- dark background

-- set color scheme
--colorscheme demonlord
--colorscheme hybrid
vim.cmd('colorscheme dracula')

-- use Unix as the standard file type
vim.opt.ffs = 'unix,dos,mac'


--// user interface
--//------------------------------------------------
vim.opt.number = true                     -- display line numbers
vim.opt.relativenumber = true             -- relative line numbers
--vim.opt.foldcolumn = true                 -- remove left margin padding
vim.opt.cmdheight = 1                     -- height of the command bar
vim.opt.ruler = true                      -- show line + column number of cursor
vim.opt.showcmd = true                    -- show incomplete cmds down the bottom
vim.opt.showmode = false                  -- show current mode down the bottom [OR: noshowmode]
vim.opt.visualbell = true                 -- no sounds
vim.opt.laststatus = 2                    -- always show the status line
vim.opt.showmatch = true                  -- show matching brackets when text indicator is over them
vim.opt.matchtime = 3                     -- duration of parens highlight in 1/10 seconds
vim.opt.splitbelow = true                 -- spltting a window will put the new window below the current one
vim.opt.splitright = true                 -- same as above but for horizontal splits
vim.opt.clipboard = 'unnamed,unnamedplus' -- use system clipboard
vim.opt.cursorline = true                 -- highlight current line
vim.opt.hidden = true                     -- hide buffer when abandoned
vim.opt.gdefault = true                   -- apply substitution globally on lines
vim.opt.modifiable = true                 -- set buffers to modifiable
vim.opt.guicursor = ''                    -- gui cursor to block

-- indentation
vim.opt.autoindent = true                 -- auto indentation
vim.opt.smartindent = true                -- be smart when indenting
vim.opt.smarttab = true                   -- be smart when using tabs
vim.opt.tabstop = 2                       -- 1 tab = 2 spaces
vim.opt.softtabstop = 2                   -- 1 softtab = 2 spaces
vim.opt.expandtab = true                  -- use spaces instead of tabs
vim.opt.wrap = false                      -- don't wrap lines
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2

-- folding
vim.opt.foldenable = false                -- dont fold by default
vim.opt.foldmethod = 'marker'             -- fold based on indent
--vim.opt.printoptions = 'paper:letter'
vim.opt.sidescrolloff = 5
vim.opt.mouse = 'nvi'

-- scrolling
vim.opt.scrolloff = 8                     -- minimum number of screen lines to keep above and below the cursor
vim.opt.sidescroll = 1                    -- minimum number of columns to scroll horizontally
vim.opt.sidescrolloff = 10                -- minimum number of screen lines to keep left and right of the cursor

-- wildmenu completion
vim.opt.wildmenu = true
vim.opt.wildmode = 'list:longest'
vim.opt.wildignore = [[
  .hg,.git,.svn,
  *.jpg,*.bmp,*.gif,*.png,*.jpeg,
  *.o,*.obj,*.exe,*.dll,*.manifest,
  *.spl,
  *.sw?,
  *.DS_Store
]]

-- search & results settings
vim.opt.incsearch = true                  -- find the next match as we type the search
vim.opt.hlsearch = false                  -- no highlight searches by default
vim.opt.ignorecase = true                 -- ignore case when searching...
vim.opt.smartcase = true                  -- ...unless we type a capital

-- TODO: fix these characters
--vim.opt.listchars = 'tab:▸\\,trail:·,extends:»,precedes:«,nbsp:·,eol:¬'

-- linebreak on 500 characters
vim.opt.linebreak = true
vim.opt.textwidth = 500

-- TODO: spell checking option settings
--vim.opt.dictionary = '/usr/share/dict/words'


--// command input
--//------------------------------------------------
vim.opt.backspace = 'indent,eol,start'    -- allow backspace in insert mode
vim.opt.whichwrap = '<,>,h,l'             -- allow arrow key to wrap around lines

-- mapleader
vim.g.mapleader = ' '
vim.opt.updatetime = 40


--// keymaps & remaps
--//-----------------------------------------------
-- fast saving
map('n', '<leader>w', ':w!<CR>')

-- :W sudo saves the file
-- (useful for handling the premission-denied error)
--vim.cmd('command! W :w !sudo tee % > /dev/null')

-- fuck everything
map('n', '<leader>qq', ':q!<CR>')

-- remap ESC
map('i', 'kk', '<ESC>', {noremap = true})

-- move lines
map('n', '<C-j>', ':m .+1<CR>==')
map('n', '<C-k>', ':m .-2<CR>==')
map('i', '<C-j>', '<ESC> :m .+1<CR>==gi')
map('i', '<C-k>', '<ESC> :m .-2<CR>==gi')
map('v', '<C-j>', ':m \'>+1<CR>gv=gv')
map('v', '<C-k>', ':m \'<-2<CR>gv=gv')

map('n', '<C-Down>', ':m .+1<CR>==')
map('n', '<C-Up>', ':m .-2<CR>==')
map('i', '<C-Down>', '<ESC> :m .+1<CR>==gi')
map('i', '<C-Up>', '<ESC> :m .-2<CR>==gi')
map('v', '<C-Down>', ':m \'>+1<CR>gv=gv')
map('v', '<C-Up>', ':m \'<-2<CR>gv=gv')

-- cursor in place when using J
map('n', 'J', 'mzJ`z')

-- cursor at middle page during C-d, C-u, C-f, C-b, <Up>, <Down>
map('n', '<C-d>', '<C-d>zz')
map('n', '<C-u>', '<C-u>zz')
map('n', '<C-f>', '<C-f>zz')
map('n', '<C-b>', '<C-b>zz')
map('n', '<PageDown>', '<C-f>zz')
map('n', '<PageUp>', '<C-b>zz')

-- cursor at middle page during search
map('n', 'n', 'nzzzv')
map('n', 'N', 'Nzzzv')

-- retain register during paste
map('x', '<leader>p', [["_dP]])

-- <leader>y to yank into system clipboard
vim.keymap.set({'n', 'v'}, '<leader>y', [["+y]])
map('n', '<leader>Y', [["+Y]])

-- <leader>d to delete to void register
vim.keymap.set({'n', 'v'}, '<leader>d', [["_d]])

-- dont use Q
map('n', 'Q', '<nop>')

-- disable arrow keys
--map('n', '<Up>', '<nop>')
--map('n', '<Down>', '<nop>')
--map('n', '<Left>', '<nop>')
--map('n', '<Right>', '<nop>')

-- fast project switching with tmux integration
--map('n', '<C-f>', '<cmd>silent !tmux neww tmux-sessionizer<CR>')

-- cursor at middle page fixes
--map('n', '<C-j>', '<cmd>cprev<CR>zz')
--map('n', '<C-k>', '<cmd>cnext<CR>zz')
--map('n', '<leader>j', '<cmd>lprev<CR>zz')
--map('n', '<leader>k', '<cmd>lnext<CR>zz')

-- moving around lines
map('n', 'H', '<Home>')
map('n', 'L', '<End>')

-- <leader>s to replace current word across whole file
map('n', '<leader>s', [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- move around splits using Ctrl + {h,j,k,l}
--map('n', '<C-h>', '<C-w>h')
--map('n', '<C-j>', '<C-w>j')
--map('n', '<C-k>', '<C-w>k')
--map('n', '<C-l>', '<C-w>l')

--map('n', '<C-Up>', ':wincmd k<cr>', {})
--map('n', '<C-Down>', ':wincmd j<cr>', {})
--map('n', '<C-Left>', ':wincmd h<cr>', {})
--map('n', '<C-Right>', ':wincmd l<cr>', {})

-- reload file without restart nvim
map('n', '<leader>rr', ':so<CR>')

-- inserting blank lines
map('n', '<CR>', 'o<ESC>', {noremap = true})

-- more useful line deleting
map('n', '-', 'dd')

-- auto-close brackets and quotes
map('i', '{', '{}<Esc>ha', {noremap = true})
map('i', '(', '()<Esc>ha', {noremap = true})
map('i', '[', '[]<Esc>ha', {noremap = true})
map('i', '<', '<><Esc>ha', {noremap = true})
map('i', '"', '""<Esc>ha', {noremap = true})
map('i', "'", "''<Esc>ha", {noremap = true})
map('i', '`', '``<Esc>ha', {noremap = true})


--// buffer controls
-- open a new empty buffer
map('n', '<leader>bn', ':enew<cr>', {noremap = true})

-- move to the next buffer
map('n', '<leader>bl', ':bnext<cr>', {noremap = true})
map('n', '<A-Right>', ':bnext<cr>', {noremap = true})

-- move to the previous buffer
map('n', '<leader>bh', ':bprevious<cr>', {noremap = true})
map('n', '<A-Left>', ':bprevious<cr>', {noremap = true})

-- close the current buffer and move to the previous one
-- this replicates the idea of closing a tab
map('n', '<leader>bc', ':bp <BAR> bd #<cr>', {noremap = true})

-- show all open buffers and their status
map('n', '<leader>bs', ':ls<cr>', {noremap = true})

-- switch CWD to the directory of the open buffer
map('n', '<leader>cd', ':cd %:p:h<cr>:pwd<cr>', {noremap = true})

-- specify the behavior when switching between buffers
vim.opt.switchbuf = 'useopen,usetab,newtab'
vim.opt.showtabline = 2

local function BufcloseCloseIt()
  local current_buf_num = vim.call('bufnr', {'%'})
  local alternate_buf_num = vim.call('bufnr', {'#'})

  if vim.call('buflisted', {alternate_buf_num}) then
    vim.cmd('buffer #')
  else
    vim.cmd('bnext')
  end

  if vim.call('bufnr', {'%'}) == current_buf_num then
    vim.cmd('new')
  end

  if vim.call('buflisted', {current_buf_num}) then
    vim.cmd('bdelete! ' .. current_buf_num)
  end
end

vim.cmd('command! Bclose call BufcloseCloseIt()')


--// tab controls
-- useful mappings for managing tabs
map('n', '<leader>tn', ':tabnew<cr>')
map('n', '<leader>to', ':tabonly<cr>')
map('n', '<leader>tc', ':tabclose<cr>')
map('n', '<leader>tm', ':tabmove')
map('n', '<leader>t<leader>', ':tabnext')

-- new tab with ctrl+t
map('n', '<C-T>', ':tabnew<cr>', {silent = true})

-- let 'tl' toggle between this and the last accessed tab
vim.g.lasttab = 1
map('n', '<leader>tl', [[:exe 'tabn '.g.lasttab<CR>]])
autocmd('TabLeave', { pattern = '*', command = 'let lasttab = tabpagenr()' })

-- opens a new tab with the current buffer's path
-- super useful when editing files in the same directory
map('n', '<leader>te', [[:tabedit <C-r>=expand('%:p:h')<CR>]])

-- open netrw
vim.keymap.set('n', '<leader>px', vim.cmd.Ex)


--// plugin configurations
--//-------------------------------------------------
vim.keymap.set('n', '<leader>pi', vim.cmd.PlugInstall)
vim.keymap.set('n', '<leader>pu', vim.cmd.PlugUpdate)
vim.keymap.set('n', '<leader>pc', vim.cmd.PlugClean)


--// mason
require('mason').setup()


--// python venv settings
local home = vim.env.HOME
vim.g.python_host_prog = home .. '/.pyenv/shims/python'
vim.g.python2_host_prog = home ..'/.pyenv/shims/python2'
vim.g.python3_host_prog = home .. '/.pyenv/shims/python3'


--// treesitter
require('nvim-treesitter.configs').setup {
  -- A list of parser names, or 'all'
  ensure_installed = { 'javascript', 'lua', 'ruby', 'python', 'c' },

  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,

  -- Automatically install missing parsers when entering buffer
  -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
  auto_install = true,

  incremental_selection = {
    enable = false,
  },

  highlight = {
    -- `false` will disable the whole extension
    enable = true,

    -- NOTE: these are the names of the parsers and not the filetype. (for example if you want to
    -- disable highlighting for the `tex` filetype, you need to include `latex` in this list as this is

    -- list of language that will be disabled
    disable = { 'html', 'css', 'vue' },

    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  }
}


--// terminal mappings
-- map('n', '<C-t>t', ':term<CR>', { noremap = true })               -- open
-- map('t', '<Esc>', '<C-\\><C-n>')                                  -- exit
-- map('n', '<leader>th', ':split | :term<CR>', { noremap = true })
-- map('n', '<leader>tv', ':vsplit | :term<CR>', { noremap = true })


--// fterm
require('FTerm').setup({
  auto_close = true,
  border = 'double',
  dimensions  = {
    height = 0.75,
    width = 0.9,
    x = 0.5,
    y = 0.2
  },
})

map('n', '<C-space>', '<cmd>lua require("FTerm").toggle()<CR>', { noremap = true, silent = true })
map('t', '<C-space>', '<C-\\><C-n><cmd>lua require("FTerm").toggle()<CR>', { noremap = true, silent = true })


--// telescope
require('telescope').setup({
  defaults = {
    -- Default configuration for telescope goes here:
    -- config_key = value,
   mappings = {
      i = {
        -- map actions.which_key to <C-h> (default: <C-/>)
        -- actions.which_key shows the mappings for your picker,
        -- e.g. git_{create, delete, ...}_branch for the git_branches picker
        ['<C-h>'] = 'which_key'
      }
    }
  },
  pickers = {},
  extensions = {}
})

require('dir-telescope').setup({
  hidden = true,
  no_ignore = false,
  show_preview = true
})

local builtin = require('telescope.builtin')
local dir = require('telescope').load_extension('dir')

vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fo', builtin.oldfiles, {})
vim.keymap.set('n', '<leader>fm', builtin.marks, {})
vim.keymap.set('n', '<leader>/', function ()
  builtin.grep_string({ search = vim.fn.input('grep > ') })
end)

vim.keymap.set('n', '<leader>fc', dir.live_grep, { noremap = true, silent = true })

vim.keymap.set('n', '<C-p>', builtin.git_files, {})
vim.keymap.set('n', '<C-p>b', builtin.git_branches, {})

--// airline
-- vim.g.airline_theme='luna'
-- vim.g.airline_theme='minimalist'
local gset = vim.api.nvim_set_var
gset('airline#extensions#tabline#enabled', 1)
gset('airline#extensions#branch#enabled', 1)
gset('airline#extensions#tabline#fnamemod', '%t')

vim.g.airline_powerline_fonts = 1
vim.g.airline_section_c = '%t'

-- the separator used on the left side *
vim.g.airline_left_sep = ':'

-- the separator used on the right side *
vim.g.airline_right_sep = ':'


--// emmet
vim.g.user_emmet_install_global = 0
vim.g.user_emmet_leader_key = '<TAB>'
vim.g.user_emmet_settings = {
  ['javascript.jsx'] = {
    ['extends'] = 'jsx',
  }
}
autocmd('FileType', { pattern = 'html,css,js,vue', command = 'EmmetInstall'})


--// harpoon
require('harpoon').setup({
  global_settings = {
    -- sets the marks upon calling `toggle` on the ui, instead of require `:w`.
    save_on_toggle = false,

    -- saves the harpoon file upon every change. disabling is unrecommended.
    save_on_change = true,

    -- sets harpoon to run the command immediately as it's passed to the terminal when calling `sendCommand`.
    enter_on_sendcmd = false,

    -- closes any tmux windows harpoon that harpoon creates when you close Neovim.
    tmux_autoclose_windows = false,

    -- filetypes that you want to prevent from adding to the harpoon list menu.
    excluded_filetypes = { 'harpoon' },

    -- set marks specific to each git branch inside git repository
    mark_branch = false,
  }
})

local mark = require('harpoon.mark')
local ui = require('harpoon.ui')

vim.keymap.set('n', '<C-a>', mark.add_file)
vim.keymap.set('n', '<C-e>', ui.toggle_quick_menu)

vim.keymap.set('n', '<C-h>', function() ui.nav_file(1) end)
vim.keymap.set('n', '<C-t>', function() ui.nav_file(2) end)
vim.keymap.set('n', '<C-n>', function() ui.nav_file(3) end)
vim.keymap.set('n', '<C-s>', function() ui.nav_file(4) end)


--// nvim comment
require('nvim_comment').setup()

map('n', '<leader>c<space>', ':CommentToggle<CR>', { noremap = true, silent = true })


--// gitsigns
require('gitsigns').setup()


--// lazygit
vim.g.lazygit_floating_window_winblend = 0 -- transparency of floating window
vim.g.lazygit_floating_window_scaling_factor = 0.9 -- scaling factor for floating window
vim.g.lazygit_floating_window_use_plenary = 0 -- use plenary.nvim to manage floating window if available
vim.g.lazygit_use_neovim_remote = 1 -- fallback to 0 if neovim-remote is not installed
vim.g.lazygit_use_custom_config_file_path = 0 -- config file path is evaluated if this value is 1

vim.keymap.set('n', '<leader>gg', vim.cmd.LazyGit)


--// fugitive
--local fugitive_group = augroup('fugitive_group', {})
--autocmd('BufWinEnter', {
--    group = fugitive_group,
--    pattern = '*',
--    callback = function()
--        if vim.bo.ft ~= 'fugitive' then
--            return
--        end
--
--        local bufnr = vim.api.nvim_get_current_buf()
--        local opts = { buffer = bufnr, remap = false }
--    end,
--})
--
--map('n', '<leader>g', ':Git<cr>', { noremap = true, silent = true})
--map('n', '<leader>l', ':Flog<cr>', { noremap = true, silent = true})


--// which key
local wk = require('which-key')
wk.setup {
  ignore_missing = false, -- enable this to hide mappings for which you didn't specify a label
}
wk.register({
}, { prefix = '<leader>' })


--// dashboard
-- local db = require('dashboard')
-- db.preview_command = 'cat | lolcat -S 10'
-- db.preview_file_path = home .. '/.config/nvim/static/neovim.cat'
-- db.preview_file_height = 12
-- db.preview_file_width = 50


--// neoclip
require('neoclip').setup()

--// nerdtree
vim.g.NERDTreeWinPos = 'left'
--vim.NERDTreeIgnore = {''}
vim.g.NERDTreeWinSize = 24
vim.g.NERDTreeShowHidden = 1
vim.g.NERDTreeHighlightCursorline = 1
vim.g.NERDTreeMinimalUI = 1
vim.g.NERDTreeDirArrows = 1

vim.keymap.set('n', '<leader>nn', ':NERDTreeToggle<CR>', {noremap = true, silent=true})
vim.keymap.set('n', '<leader>nf', ':NERDTreeFind<CR>', {noremap = true})
vim.keymap.set('n', '<leader>nb', ':NERDTreeFromBookmark<CR>', {noremap = true})
