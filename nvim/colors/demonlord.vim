"// ---------------------------------------------------------------------------
"// name:   demonlord.vim
"// author: @michaelperrygoodman
"// url:    https://github.com/michaelperrygoodman/demonlord.vim
"//
"// notes:  this is hacked together from hybrid.vim
"//         combined with hex values from demonlord vscode theme
"// ---------------------------------------------------------------------------
hi clear

if exists("syntax_on")
  syntax reset
endif

let g:colors_name = "demonlord"
let s:style = &background

"// palettes
"// ---------------------------------------------------------------------------

let s:palette = { 'gui' : {} , 'cterm' : {} }

let s:gui_background = "#1f1f1f"
let s:gui_selection  = "#525252"
let s:gui_line       = "#2d2d2d"
let s:gui_comment    = "#525252"

let s:palette.gui.background = { 'dark' : s:gui_background }
let s:palette.gui.foreground = { 'dark' : "#c4c4c4"        }
let s:palette.gui.selection  = { 'dark' : s:gui_selection  }
let s:palette.gui.line       = { 'dark' : s:gui_line       }
let s:palette.gui.comment    = { 'dark' : s:gui_comment    }
let s:palette.gui.red        = { 'dark' : "#ff495b"        }
let s:palette.gui.orange     = { 'dark' : "#eea97b"        }
let s:palette.gui.yellow     = { 'dark' : "#fdce34"        }
let s:palette.gui.green      = { 'dark' : "#b8ff66"        }
let s:palette.gui.aqua       = { 'dark' : "#55fd8d"        }
let s:palette.gui.blue       = { 'dark' : "#40f9ff"        }
let s:palette.gui.purple     = { 'dark' : "#cd76ff"        }
let s:palette.gui.window     = { 'dark' : "#303030"        }
let s:palette.gui.darkcolumn = { 'dark' : "#1f1f1f"        }
let s:palette.gui.addbg      = { 'dark' : "#379b73"        }
let s:palette.gui.addfg      = { 'dark' : "#c1ff4d"        }
let s:palette.gui.changebg   = { 'dark' : "#2d2d2d"        }
let s:palette.gui.changefg   = { 'dark' : "#71b1fe"        }
let s:palette.gui.delbg      = { 'dark' : "#ff495b"        }
let s:palette.gui.darkblue   = { 'dark' : "#00005f"        }
let s:palette.gui.darkcyan   = { 'dark' : "#005f5f"        }
let s:palette.gui.darkred    = { 'dark' : "#5f0000"        }
let s:palette.gui.darkpurple = { 'dark' : "#5f005f"        }

if exists("g:demonlord_custom_term_colors") && g:demonlord_custom_term_colors == 1
  let s:cterm_foreground = "15"  " White
  let s:cterm_selection  = "8"   " DarkGrey
  let s:cterm_line       = "0"   " Black
  let s:cterm_comment    = "7"   " LightGrey
  let s:cterm_red        = "9"   " LightRed
  let s:cterm_orange     = "3"   " DarkYellow
  let s:cterm_yellow     = "11"  " LightYellow
  let s:cterm_green      = "10"  " LightGreen
  let s:cterm_aqua       = "14"  " LightCyan
  let s:cterm_blue       = "12"  " LightBlue
  let s:cterm_purple     = "13"  " LightMagenta
  let s:cterm_delbg      = "9"   " LightRed
else
  let s:cterm_foreground = "250"
  let s:cterm_selection  = "237"
  let s:cterm_line       = "235"
  let s:cterm_comment    = "243"
  let s:cterm_red        = "167"
  let s:cterm_orange     = "173"
  let s:cterm_yellow     = "221"
  let s:cterm_green      = "143"
  let s:cterm_aqua       = "109"
  let s:cterm_blue       = "110"
  let s:cterm_purple     = "139"
  let s:cterm_delbg      = "167"
endif

let s:palette.cterm.background = { 'dark' : "232"              }
let s:palette.cterm.foreground = { 'dark' : s:cterm_foreground }
let s:palette.cterm.window     = { 'dark' : "234"              }
let s:palette.cterm.selection  = { 'dark' : s:cterm_selection }
let s:palette.cterm.line       = { 'dark' : s:cterm_line      }
let s:palette.cterm.comment    = { 'dark' : s:cterm_comment   }
let s:palette.cterm.red        = { 'dark' : s:cterm_red       }
let s:palette.cterm.orange     = { 'dark' : s:cterm_orange    }
let s:palette.cterm.yellow     = { 'dark' : s:cterm_yellow    }
let s:palette.cterm.green      = { 'dark' : s:cterm_green     }
let s:palette.cterm.aqua       = { 'dark' : s:cterm_aqua      }
let s:palette.cterm.blue       = { 'dark' : s:cterm_blue      }
let s:palette.cterm.purple     = { 'dark' : s:cterm_purple    }
let s:palette.cterm.darkcolumn = { 'dark' : "234"             }
let s:palette.cterm.addbg      = { 'dark' : "65"              }
let s:palette.cterm.addfg      = { 'dark' : "193"             }
let s:palette.cterm.changebg   = { 'dark' : "60"              }
let s:palette.cterm.changefg   = { 'dark' : "189"             }
let s:palette.cterm.delbg      = { 'dark' : s:cterm_delbg     }
let s:palette.cterm.darkblue   = { 'dark' : "17"              }
let s:palette.cterm.darkcyan   = { 'dark' : "24"              }
let s:palette.cterm.darkred    = { 'dark' : "52"              }
let s:palette.cterm.darkpurple = { 'dark' : "53"              }

"// formatting
"// ---------------------------------------------------------------------------
let s:none   = "NONE"
let s:t_none = "NONE"
let s:n      = "NONE"
let s:c      = ",undercurl"
let s:r      = ",reverse"
let s:s      = ",standout"
let s:b      = ",bold"
let s:u      = ",underline"
let s:i      = ",italic"

"// highlighting primatives
"// ---------------------------------------------------------------------------
function! s:build_prim(hi_elem, field)
  " Given a:hi_elem = bg, a:field = comment
  let l:vname = "s:" . a:hi_elem . "_" . a:field " s:bg_comment
  let l:gui_assign = "gui".a:hi_elem."=".s:palette.gui[a:field][s:style] " guibg=...
  let l:cterm_assign = "cterm".a:hi_elem."=".s:palette.cterm[a:field][s:style] " ctermbg=...
  exe "let " . l:vname . " = ' " . l:gui_assign . " " . l:cterm_assign . "'"
endfunction

let s:bg_none = ' guibg=NONE ctermbg=NONE'
call s:build_prim('bg', 'foreground')
call s:build_prim('bg', 'background')
call s:build_prim('bg', 'selection')
call s:build_prim('bg', 'line')
call s:build_prim('bg', 'comment')
call s:build_prim('bg', 'red')
call s:build_prim('bg', 'orange')
call s:build_prim('bg', 'yellow')
call s:build_prim('bg', 'green')
call s:build_prim('bg', 'aqua')
call s:build_prim('bg', 'blue')
call s:build_prim('bg', 'purple')
call s:build_prim('bg', 'window')
call s:build_prim('bg', 'darkcolumn')
call s:build_prim('bg', 'addbg')
call s:build_prim('bg', 'addfg')
call s:build_prim('bg', 'changebg')
call s:build_prim('bg', 'changefg')
call s:build_prim('bg', 'delbg')
call s:build_prim('bg', 'darkblue')
call s:build_prim('bg', 'darkcyan')
call s:build_prim('bg', 'darkred')
call s:build_prim('bg', 'darkpurple')

let s:fg_none = ' guifg=NONE ctermfg=NONE'
call s:build_prim('fg', 'foreground')
call s:build_prim('fg', 'background')
call s:build_prim('fg', 'selection')
call s:build_prim('fg', 'line')
call s:build_prim('fg', 'comment')
call s:build_prim('fg', 'red')
call s:build_prim('fg', 'orange')
call s:build_prim('fg', 'yellow')
call s:build_prim('fg', 'green')
call s:build_prim('fg', 'aqua')
call s:build_prim('fg', 'blue')
call s:build_prim('fg', 'purple')
call s:build_prim('fg', 'window')
call s:build_prim('fg', 'darkcolumn')
call s:build_prim('fg', 'addbg')
call s:build_prim('fg', 'addfg')
call s:build_prim('fg', 'changebg')
call s:build_prim('fg', 'changefg')
call s:build_prim('fg', 'darkblue')
call s:build_prim('fg', 'darkcyan')
call s:build_prim('fg', 'darkred')
call s:build_prim('fg', 'darkpurple')

exe "let s:fmt_none = ' gui=NONE".          " cterm=NONE".          " term=NONE"        ."'"
exe "let s:fmt_bold = ' gui=NONE".s:b.      " cterm=NONE".s:b.      " term=NONE".s:b    ."'"
exe "let s:fmt_bldi = ' gui=NONE".s:b.      " cterm=NONE".s:b.      " term=NONE".s:b    ."'"
exe "let s:fmt_undr = ' gui=NONE".s:u.      " cterm=NONE".s:u.      " term=NONE".s:u    ."'"
exe "let s:fmt_undb = ' gui=NONE".s:u.s:b.  " cterm=NONE".s:u.s:b.  " term=NONE".s:u.s:b."'"
exe "let s:fmt_undi = ' gui=NONE".s:u.      " cterm=NONE".s:u.      " term=NONE".s:u    ."'"
exe "let s:fmt_curl = ' gui=NONE".s:c.      " cterm=NONE".s:c.      " term=NONE".s:c    ."'"
exe "let s:fmt_ital = ' gui=NONE".s:i.      " cterm=NONE".s:i.      " term=NONE".s:i    ."'"
exe "let s:fmt_stnd = ' gui=NONE".s:s.      " cterm=NONE".s:s.      " term=NONE".s:s    ."'"
exe "let s:fmt_revr = ' gui=NONE".s:r.      " cterm=NONE".s:r.      " term=NONE".s:r    ."'"
exe "let s:fmt_revb = ' gui=NONE".s:r.s:b.  " cterm=NONE".s:r.s:b.  " term=NONE".s:r.s:b."'"

exe "let s:sp_none       = ' guisp=". s:none                            ."'"
exe "let s:sp_foreground = ' guisp=". s:palette.gui.foreground[s:style] ."'"
exe "let s:sp_background = ' guisp=". s:palette.gui.background[s:style] ."'"
exe "let s:sp_selection  = ' guisp=". s:palette.gui.selection[s:style]  ."'"
exe "let s:sp_line       = ' guisp=". s:palette.gui.line[s:style]       ."'"
exe "let s:sp_comment    = ' guisp=". s:palette.gui.comment[s:style]    ."'"
exe "let s:sp_red        = ' guisp=". s:palette.gui.red[s:style]        ."'"
exe "let s:sp_orange     = ' guisp=". s:palette.gui.orange[s:style]     ."'"
exe "let s:sp_yellow     = ' guisp=". s:palette.gui.yellow[s:style]     ."'"
exe "let s:sp_green      = ' guisp=". s:palette.gui.green[s:style]      ."'"
exe "let s:sp_aqua       = ' guisp=". s:palette.gui.aqua[s:style]       ."'"
exe "let s:sp_blue       = ' guisp=". s:palette.gui.blue[s:style]       ."'"
exe "let s:sp_purple     = ' guisp=". s:palette.gui.purple[s:style]     ."'"
exe "let s:sp_window     = ' guisp=". s:palette.gui.window[s:style]     ."'"
exe "let s:sp_addbg      = ' guisp=". s:palette.gui.addbg[s:style]      ."'"
exe "let s:sp_addfg      = ' guisp=". s:palette.gui.addfg[s:style]      ."'"
exe "let s:sp_changebg   = ' guisp=". s:palette.gui.changebg[s:style]   ."'"
exe "let s:sp_changefg   = ' guisp=". s:palette.gui.changefg[s:style]   ."'"
exe "let s:sp_darkblue   = ' guisp=". s:palette.gui.darkblue[s:style]   ."'"
exe "let s:sp_darkcyan   = ' guisp=". s:palette.gui.darkcyan[s:style]   ."'"
exe "let s:sp_darkred    = ' guisp=". s:palette.gui.darkred[s:style]    ."'"
exe "let s:sp_darkpurple = ' guisp=". s:palette.gui.darkpurple[s:style] ."'"

"// vim highlighting (see :help highlight-groups)
"// ---------------------------------------------------------------------------
exe "hi! ColorColumn"   .s:fg_none        .s:bg_line        .s:fmt_none
"   Conceal"
"   Cursor"
"   CursorIM"
exe "hi! CursorColumn"  .s:fg_none        .s:bg_line        .s:fmt_none
exe "hi! CursorLine"    .s:fg_none        .s:bg_line        .s:fmt_none
exe "hi! Directory"     .s:fg_blue        .s:bg_none        .s:fmt_none
exe "hi! DiffAdd"       .s:fg_addfg       .s:bg_addbg       .s:fmt_none
exe "hi! DiffChange"    .s:fg_changefg    .s:bg_changebg    .s:fmt_none
exe "hi! DiffDelete"    .s:fg_background  .s:bg_delbg       .s:fmt_none
exe "hi! DiffText"      .s:fg_background  .s:bg_blue        .s:fmt_none
exe "hi! ErrorMsg"      .s:fg_background  .s:bg_red         .s:fmt_stnd
exe "hi! VertSplit"     .s:fg_window      .s:bg_none        .s:fmt_none
exe "hi! Folded"        .s:fg_comment     .s:bg_darkcolumn  .s:fmt_none
exe "hi! FoldColumn"    .s:fg_none        .s:bg_darkcolumn  .s:fmt_none
exe "hi! SignColumn"    .s:fg_none        .s:bg_darkcolumn  .s:fmt_none
"   Incsearch"
exe "hi! LineNr"        .s:fg_selection   .s:bg_none        .s:fmt_none
exe "hi! CursorLineNr"  .s:fg_yellow      .s:bg_none        .s:fmt_none
exe "hi! MatchParen"    .s:fg_background  .s:bg_changebg    .s:fmt_none
exe "hi! ModeMsg"       .s:fg_green       .s:bg_none        .s:fmt_none
exe "hi! MoreMsg"       .s:fg_green       .s:bg_none        .s:fmt_none
exe "hi! NonText"       .s:fg_selection   .s:bg_none        .s:fmt_none
exe "hi! Pmenu"         .s:fg_foreground  .s:bg_selection   .s:fmt_none
exe "hi! PmenuSel"      .s:fg_foreground  .s:bg_selection   .s:fmt_revr
"   PmenuSbar"
"   PmenuThumb"
exe "hi! Question"      .s:fg_green       .s:bg_none        .s:fmt_none
exe "hi! Search"        .s:fg_background  .s:bg_yellow      .s:fmt_none
exe "hi! SpecialKey"    .s:fg_selection   .s:bg_none        .s:fmt_none
exe "hi! SpellCap"      .s:fg_blue        .s:bg_darkblue    .s:fmt_undr
exe "hi! SpellLocal"    .s:fg_aqua        .s:bg_darkcyan    .s:fmt_undr
exe "hi! SpellBad"      .s:fg_red         .s:bg_darkred     .s:fmt_undr
exe "hi! SpellRare"     .s:fg_purple      .s:bg_darkpurple  .s:fmt_undr
exe "hi! StatusLine"    .s:fg_comment     .s:bg_background  .s:fmt_revr
exe "hi! StatusLineNC"  .s:fg_window      .s:bg_comment     .s:fmt_revr
exe "hi! TabLine"       .s:fg_foreground  .s:bg_darkcolumn  .s:fmt_revr
"   TabLineFill"
"   TabLineSel"
exe "hi! Title"         .s:fg_yellow      .s:bg_none        .s:fmt_none
exe "hi! Visual"        .s:fg_none        .s:bg_selection   .s:fmt_none
"   VisualNos"
exe "hi! WarningMsg"    .s:fg_red         .s:bg_none        .s:fmt_none
" FIXME LongLineWarning to use variables instead of hardcoding
hi LongLineWarning  guifg=NONE        guibg=#371F1C     gui=underline ctermfg=NONE        ctermbg=NONE        cterm=underline
"   WildMenu"

" Use defined custom background colour for terminal Vim.
if !has('gui_running') && exists("g:demonlord_custom_term_colors") && g:demonlord_custom_term_colors == 1
  let s:bg_normal = s:bg_none
else
  let s:bg_normal = s:bg_background
endif
exe "hi! Normal"        .s:fg_foreground  .s:bg_normal      .s:fmt_none

"// generic syntax highlighting (see :help group-name)
"// ---------------------------------------------------------------------------
exe "hi! Comment"         .s:fg_comment     .s:bg_none        .s:fmt_none

exe "hi! Constant"        .s:fg_purple      .s:bg_none        .s:fmt_none
exe "hi! String"          .s:fg_aqua        .s:bg_none        .s:fmt_none
exe "hi! Number"          .s:fg_orange      .s:bg_none        .s:fmt_none
exe "hi! Boolean"         .s:fg_orange      .s:bg_none        .s:fmt_none
"   Character"
"   Float"

exe "hi! Identifier"      .s:fg_purple      .s:bg_none        .s:fmt_none
exe "hi! Function"        .s:fg_changefg    .s:bg_none        .s:fmt_none

exe "hi! Statement"       .s:fg_red         .s:bg_none        .s:fmt_none
"   Conditional"
"   Repeat"
"   Label"
exe "hi! Operator"        .s:fg_aqua        .s:bg_none        .s:fmt_none
exe "hi! Keyword"         .s:fg_red         .s:bg_none        .s:fmt_none
"   Exception"

exe "hi! PreProc"         .s:fg_purple      .s:bg_none        .s:fmt_none
"   Include"
"   Define"
"   Macro"
"   PreCondit"

exe "hi! Type"            .s:fg_purple      .s:bg_none        .s:fmt_none
"   StorageClass"
exe "hi! Structure"       .s:fg_blue        .s:bg_none        .s:fmt_none
"   Typedef"

exe "hi! Special"         .s:fg_orange      .s:bg_none        .s:fmt_none
"   SpecialChar"
"   Tag"
"   Delimiter"
"   SpecialComment"
"   Debug"
"
exe "hi! Underlined"      .s:fg_blue        .s:bg_none        .s:fmt_none

exe "hi! Ignore"          .s:fg_none        .s:bg_none        .s:fmt_none

exe "hi! Error"           .s:fg_red         .s:bg_darkred     .s:fmt_undr

exe "hi! Todo"            .s:fg_addfg       .s:bg_none        .s:fmt_none

" Quickfix window highlighting
exe "hi! qfLineNr"        .s:fg_yellow      .s:bg_none        .s:fmt_none
"   qfFileName"
"   qfLineNr"
"   qfError"

" Diff
"   diffOldFile
"   diffNewFile
"   diffFile
"   diffOnly
"   diffIdentical
"   diffDiffer
"   diffBDiffer
"   diffIsA
"   diffNoEOL
"   diffCommon
hi! link diffRemoved Constant
"   diffChanged
hi! link diffAdded Special
"   diffLine
"   diffSubname
"   diffComment

"// Must be at the end, because of ctermbg=234 bug.
"// https://groups.google.com/forum/#!msg/vim_dev/afPqwAFNdrU/nqh6tOM87QUJ
"set background=dark
let &background = s:style
