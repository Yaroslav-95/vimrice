" -----------------------------------------------------------------------------
" File: ultramar.vim
" Description: Ultramar color scheme for vim
" Author: Yaroslav de la Peña Smirnov <yps@yaroslavps.com>
" Source: https://github.com/Yaroslav-95/vimrice
" Last Modified: 11 Aug 2020
" -----------------------------------------------------------------------------
" Based on the gruvbox colorscheme

" Supporting code -------------------------------------------------------------
" Initialisation: {{{

if version > 580
  hi clear
  if exists("syntax_on")
    syntax reset
  endif
endif

let g:colors_name='ultramar'

if !(has('termguicolors') && &termguicolors) && !has('gui_running') && &t_Co != 256
  finish
endif

" }}}
" Global Settings: {{{

if !exists('g:ultramar_bold')
  let g:ultramar_bold=1
endif

if !exists('g:ultramar_italic')
  if has('gui_running') || $TERM_ITALICS == 'true'
    let g:ultramar_italic=1
  else
    let g:ultramar_italic=0
  endif
endif

if !exists('g:ultramar_undercurl')
  let g:ultramar_undercurl=1
endif

if !exists('g:ultramar_underline')
  let g:ultramar_underline=1
endif

if !exists('g:ultramar_inverse')
  let g:ultramar_inverse=1
endif

if !exists('g:ultramar_guisp_fallback') || index(['fg', 'bg'], g:ultramar_guisp_fallback) == -1
  let g:ultramar_guisp_fallback='NONE'
endif

if !exists('g:ultramar_improved_strings')
  let g:ultramar_improved_strings=0
endif

if !exists('g:ultramar_improved_warnings')
  let g:ultramar_improved_warnings=0
endif

if !exists('g:ultramar_termcolors')
  let g:ultramar_termcolors=256
endif

if !exists('g:ultramar_invert_indent_guides')
  let g:ultramar_invert_indent_guides=0
endif
if !exists('g:ultramar_opaque_bg')
  let g:ultramar_opaque_bg=1
endif

let s:is_dark=(&background == 'dark')

" }}}
" Palette: {{{

" setup palette dictionary
let s:palette = {}

" fill it with absolute colors
let s:palette.dark0       = ['#151517', 235]
let s:palette.dark1       = ['#232328', 237]
let s:palette.dark2       = ['#33333a', 239]
let s:palette.dark3       = ['#404049', 241]
let s:palette.dark4       = ['#676775', 243]

let s:palette.gray_245    = ['#9499a5', 245]
let s:palette.gray_244    = ['#6c6e72', 244]

let s:palette.light0      = ['#faf6e5', 229]
let s:palette.light1      = ['#e6e3d6', 223]
let s:palette.light2      = ['#d2d0c8', 250]
let s:palette.light3      = ['#b0afa8', 248]
let s:palette.light4      = ['#91908d', 246]

let s:palette.neutral_red    = ['#b73030', 124]
let s:palette.neutral_green  = ['#6d974b', 106]
let s:palette.neutral_yellow = ['#b2872f', 172]
let s:palette.neutral_blue   = ['#3f6e90', 66]
let s:palette.neutral_purple = ['#9c6992', 132]
let s:palette.neutral_aqua   = ['#5b8277', 72]
let s:palette.neutral_orange = ['#af5539', 166]

let s:palette.bright_red     = ['#c45c5c', 167]
let s:palette.bright_green   = ['#9eba86', 142]
let s:palette.bright_yellow  = ['#e2b55a', 214]
let s:palette.bright_blue    = ['#81acc1', 109]
let s:palette.bright_purple  = ['#b48ead', 175]
let s:palette.bright_aqua    = ['#89b6a0', 108]
let s:palette.bright_orange  = ['#d08770', 208]

" }}}
" Setup Emphasis: {{{

let s:bold = 'bold,'
if g:ultramar_bold == 0
  let s:bold = ''
endif

let s:italic = 'italic,'
if g:ultramar_italic == 0
  let s:italic = ''
endif

let s:underline = 'underline,'
if g:ultramar_underline == 0
  let s:underline = ''
endif

let s:undercurl = 'undercurl,'
if g:ultramar_undercurl == 0
  let s:undercurl = ''
endif

let s:inverse = 'inverse,'
if g:ultramar_inverse == 0
  let s:inverse = ''
endif

" }}}
" Setup Colors: {{{

let s:none = ['NONE', 'NONE']

" determine relative colors
if s:is_dark
  let s:bg0  = s:palette.dark0
  let s:bg1  = s:palette.dark1
  let s:bg2  = s:palette.dark2
  let s:bg3  = s:palette.dark3
  let s:bg4  = s:palette.dark4

  let s:gray = s:palette.gray_245

  let s:fg0 = s:palette.light0
  let s:fg1 = s:palette.light1
  let s:fg2 = s:palette.light2
  let s:fg3 = s:palette.light3
  let s:fg4 = s:palette.light4

  let s:fg4_256 = s:palette.light4

  let s:red    = s:palette.bright_red
  let s:green  = s:palette.bright_green
  let s:yellow = s:palette.bright_yellow
  let s:blue   = s:palette.bright_blue
  let s:purple = s:palette.bright_purple
  let s:aqua   = s:palette.bright_aqua
  let s:orange = s:palette.bright_orange
else
  let s:bg0  = s:palette.light0
  let s:bg1  = s:palette.light1
  let s:bg2  = s:palette.light2
  let s:bg3  = s:palette.light3
  let s:bg4  = s:palette.light4

  let s:gray = s:palette.gray_244

  let s:fg0 = s:palette.dark0
  let s:fg1 = s:palette.dark1
  let s:fg2 = s:palette.dark2
  let s:fg3 = s:palette.dark3
  let s:fg4 = s:palette.dark4

  let s:fg4_256 = s:palette.dark4

  let s:red    = s:palette.neutral_red
  let s:green  = s:palette.neutral_green
  let s:yellow = s:palette.neutral_yellow
  let s:blue   = s:palette.neutral_blue
  let s:purple = s:palette.neutral_purple
  let s:aqua   = s:palette.neutral_aqua
  let s:orange = s:palette.neutral_orange
endif

" reset to 16 colors fallback
if g:ultramar_termcolors == 16
  let s:bg0[1]    = 0
  let s:fg4[1]    = 7
  let s:gray[1]   = 8
  let s:red[1]    = 9
  let s:green[1]  = 10
  let s:yellow[1] = 11
  let s:blue[1]   = 12
  let s:purple[1] = 13
  let s:aqua[1]   = 14
  let s:fg1[1]    = 15
endif

" save current relative colors back to palette dictionary
let s:palette.bg0 = s:bg0
let s:palette.bg1 = s:bg1
let s:palette.bg2 = s:bg2
let s:palette.bg3 = s:bg3
let s:palette.bg4 = s:bg4

let s:palette.gray = s:gray

let s:palette.fg0 = s:fg0
let s:palette.fg1 = s:fg1
let s:palette.fg2 = s:fg2
let s:palette.fg3 = s:fg3
let s:palette.fg4 = s:fg4

let s:palette.fg4_256 = s:fg4_256

let s:palette.red    = s:red
let s:palette.green  = s:green
let s:palette.yellow = s:yellow
let s:palette.blue   = s:blue
let s:palette.purple = s:purple
let s:palette.aqua   = s:aqua
let s:palette.orange = s:orange

" }}}
" Setup Terminal Colors For Neovim: {{{

if has('nvim')
  let g:terminal_color_0 = s:bg0[0]
  let g:terminal_color_8 = s:gray[0]

  let g:terminal_color_1 = s:palette.neutral_red[0]
  let g:terminal_color_9 = s:red[0]

  let g:terminal_color_2 = s:palette.neutral_green[0]
  let g:terminal_color_10 = s:green[0]

  let g:terminal_color_3 = s:palette.neutral_yellow[0]
  let g:terminal_color_11 = s:yellow[0]

  let g:terminal_color_4 = s:palette.neutral_blue[0]
  let g:terminal_color_12 = s:blue[0]

  let g:terminal_color_5 = s:palette.neutral_purple[0]
  let g:terminal_color_13 = s:purple[0]

  let g:terminal_color_6 = s:palette.neutral_aqua[0]
  let g:terminal_color_14 = s:aqua[0]

  let g:terminal_color_7 = s:fg4[0]
  let g:terminal_color_15 = s:fg1[0]
endif

" }}}
" Overload Setting: {{{

let s:hls_cursor = s:orange
if exists('g:ultramar_hls_cursor')
  let s:hls_cursor = get(s:palette, g:ultramar_hls_cursor)
endif

let s:number_column = s:none
if exists('g:ultramar_number_column')
  let s:number_column = get(s:palette, g:ultramar_number_column)
endif

let s:sign_column = s:bg1

if exists('g:gitgutter_override_sign_column_highlight') &&
      \ g:gitgutter_override_sign_column_highlight == 1
  let s:sign_column = s:number_column
else
  let g:gitgutter_override_sign_column_highlight = 0

  if exists('g:ultramar_sign_column')
    let s:sign_column = get(s:palette, g:ultramar_sign_column)
  endif
endif

let s:color_column = s:bg1
if exists('g:ultramar_color_column')
  let s:color_column = get(s:palette, g:ultramar_color_column)
endif

let s:vert_split = s:bg0
if exists('g:ultramar_vert_split')
  let s:vert_split = get(s:palette, g:ultramar_vert_split)
endif

let s:invert_signs = ''
if exists('g:ultramar_invert_signs')
  if g:ultramar_invert_signs == 1
    let s:invert_signs = s:inverse
  endif
endif

let s:invert_selection = s:inverse
if exists('g:ultramar_invert_selection')
  if g:ultramar_invert_selection == 0
    let s:invert_selection = ''
  endif
endif

let s:invert_tabline = ''
if exists('g:ultramar_invert_tabline')
  if g:ultramar_invert_tabline == 1
    let s:invert_tabline = s:inverse
  endif
endif

let s:italicize_comments = s:italic
if exists('g:ultramar_italicize_comments')
  if g:ultramar_italicize_comments == 0
    let s:italicize_comments = ''
  endif
endif

let s:italicize_strings = ''
if exists('g:ultramar_italicize_strings')
  if g:ultramar_italicize_strings == 1
    let s:italicize_strings = s:italic
  endif
endif

" }}}
" Highlighting Function: {{{

function! s:HL(group, fg, ...)
  " Arguments: group, guifg, guibg, gui, guisp

  " foreground
  let fg = a:fg

  " background
  if a:0 >= 1
    let bg = a:1
  else
    let bg = s:none
  endif

  " emphasis
  if a:0 >= 2 && strlen(a:2)
    let emstr = a:2
  else
    let emstr = 'NONE,'
  endif

  " special fallback
  if a:0 >= 3
    if g:ultramar_guisp_fallback != 'NONE'
      let fg = a:3
    endif

    " bg fallback mode should invert higlighting
    if g:ultramar_guisp_fallback == 'bg'
      let emstr .= 'inverse,'
    endif
  endif

  let histring = [ 'hi', a:group,
        \ 'guifg=' . fg[0], 'ctermfg=' . fg[1],
        \ 'guibg=' . bg[0], 'ctermbg=' . bg[1],
        \ 'gui=' . emstr[:-2], 'cterm=' . emstr[:-2]
        \ ]

  " special
  if a:0 >= 3
    call add(histring, 'guisp=' . a:3[0])
  endif

  execute join(histring, ' ')
endfunction

" }}}
" Ultramar Hi Groups: {{{

" memoize common hi groups
call s:HL('UltramarFg0', s:fg0)
call s:HL('UltramarFg1', s:fg1)
call s:HL('UltramarFg2', s:fg2)
call s:HL('UltramarFg3', s:fg3)
call s:HL('UltramarFg4', s:fg4)
call s:HL('UltramarGray', s:gray)
call s:HL('UltramarBg0', s:bg0)
call s:HL('UltramarBg1', s:bg1)
call s:HL('UltramarBg2', s:bg2)
call s:HL('UltramarBg3', s:bg3)
call s:HL('UltramarBg4', s:bg4)

call s:HL('UltramarRed', s:red)
call s:HL('UltramarRedBold', s:red, s:none, s:bold)
call s:HL('UltramarGreen', s:green)
call s:HL('UltramarGreenBold', s:green, s:none, s:bold)
call s:HL('UltramarYellow', s:yellow)
call s:HL('UltramarYellowBold', s:yellow, s:none, s:bold)
call s:HL('UltramarBlue', s:blue)
call s:HL('UltramarBlueBold', s:blue, s:none, s:bold)
call s:HL('UltramarPurple', s:purple)
call s:HL('UltramarPurpleBold', s:purple, s:none, s:bold)
call s:HL('UltramarAqua', s:aqua)
call s:HL('UltramarAquaBold', s:aqua, s:none, s:bold)
call s:HL('UltramarOrange', s:orange)
call s:HL('UltramarOrangeBold', s:orange, s:none, s:bold)

call s:HL('UltramarRedSign', s:red, s:sign_column, s:invert_signs)
call s:HL('UltramarGreenSign', s:green, s:sign_column, s:invert_signs)
call s:HL('UltramarYellowSign', s:yellow, s:sign_column, s:invert_signs)
call s:HL('UltramarBlueSign', s:blue, s:sign_column, s:invert_signs)
call s:HL('UltramarPurpleSign', s:purple, s:sign_column, s:invert_signs)
call s:HL('UltramarAquaSign', s:aqua, s:sign_column, s:invert_signs)

" }}}

" Vanilla colorscheme ---------------------------------------------------------
" General UI: {{{

" Normal text
if g:ultramar_opaque_bg == 1
  call s:HL('Normal', s:fg1, s:bg0)
else
  call s:HL('Normal', s:fg1)
endif

" Correct background (see issue #7):
" --- Problem with changing between dark and light on 256 color terminal
" --- https://github.com/morhetz/gruvbox/issues/7
if s:is_dark
  set background=dark
else
  set background=light
endif

if version >= 700
  " Screen line that the cursor is
  call s:HL('CursorLine',   s:none, s:bg1)
  " Screen column that the cursor is
  hi! link CursorColumn CursorLine

  " Tab pages line filler
  call s:HL('TabLineFill', s:fg4, s:bg2, s:invert_tabline)
  " Active tab page label
  call s:HL('TabLineSel', s:green, s:bg1, s:invert_tabline)
  " Not active tab page label
  hi! link TabLine TabLineFill

  " Match paired bracket under the cursor
  call s:HL('MatchParen', s:none, s:bg3, s:bold)
endif

if version >= 703
  " Highlighted screen columns
  call s:HL('ColorColumn',  s:none, s:color_column)

  " Concealed element: \lambda → λ
  call s:HL('Conceal', s:blue, s:none)

  " Line number of CursorLine
  call s:HL('CursorLineNr', s:yellow, s:bg1)
endif

hi! link NonText UltramarBg2
hi! link SpecialKey UltramarBg2

call s:HL('Visual',    s:none,  s:bg3, s:invert_selection)
hi! link VisualNOS Visual

call s:HL('Search',    s:yellow, s:bg0, s:inverse)
call s:HL('IncSearch', s:hls_cursor, s:bg0, s:inverse)

call s:HL('Underlined', s:blue, s:none, s:underline)

call s:HL('StatusLine',   s:bg2, s:fg1, s:inverse)
call s:HL('StatusLineNC', s:bg1, s:fg4, s:inverse)

if version >= 700
  au InsertEnter * call s:HL('StatusLine',   s:green, s:bg1, s:inverse)
  au InsertLeave * call s:HL('StatusLine',   s:bg2, s:fg1, s:inverse)
endif

" The column separating vertically split windows
call s:HL('VertSplit', s:bg3, s:vert_split)

" Current match in wildmenu completion
call s:HL('WildMenu', s:blue, s:bg2, s:bold)

" Directory names, special names in listing
hi! link Directory UltramarGreenBold

" Titles for output from :set all, :autocmd, etc.
hi! link Title UltramarGreenBold

" Error messages on the command line
call s:HL('ErrorMsg',   s:red, s:bg0, s:bold)
" More prompt: -- More --
hi! link MoreMsg UltramarYellowBold
" Current mode message: -- INSERT --
hi! link ModeMsg UltramarYellowBold
" 'Press enter' prompt and yes/no questions
hi! link Question UltramarOrangeBold
" Warning messages
hi! link WarningMsg UltramarRedBold

" }}}
" Gutter: {{{

" Line number for :number and :# commands
call s:HL('LineNr', s:bg4, s:number_column)

" Column where signs are displayed
call s:HL('SignColumn', s:none, s:sign_column)

" Line used for closed folds
call s:HL('Folded', s:gray, s:bg1, s:italic)
" Column where folds are displayed
call s:HL('FoldColumn', s:gray, s:bg1)

" }}}
" Cursor: {{{

" Character under cursor
call s:HL('Cursor', s:none, s:none, s:inverse)
" Visual mode cursor, selection
hi! link vCursor Cursor
" Input moder cursor
hi! link iCursor Cursor
" Language mapping cursor
hi! link lCursor Cursor

" }}}
" Syntax Highlighting: {{{

if g:ultramar_improved_strings == 0
  hi! link Special UltramarOrange
else
  call s:HL('Special', s:orange, s:bg1, s:italicize_strings)
endif

call s:HL('Comment', s:gray, s:none, s:italicize_comments)
call s:HL('Todo', s:fg0, s:bg0, s:bold . s:italic)
call s:HL('Error', s:red, s:bg0, s:bold . s:inverse)

" Generic statement
hi! link Statement UltramarRed
" if, then, else, endif, swicth, etc.
hi! link Conditional UltramarRed
" for, do, while, etc.
hi! link Repeat UltramarRed
" case, default, etc.
hi! link Label UltramarRed
" try, catch, throw
hi! link Exception UltramarRed
" sizeof, "+", "*", etc.
hi! link Operator Normal
" Any other keyword
hi! link Keyword UltramarRed

" Variable name
hi! link Identifier UltramarBlue
" Function name
hi! link Function UltramarGreenBold

" Generic preprocessor
hi! link PreProc UltramarAqua
" Preprocessor #include
hi! link Include UltramarAqua
" Preprocessor #define
hi! link Define UltramarAqua
" Same as Define
hi! link Macro UltramarAqua
" Preprocessor #if, #else, #endif, etc.
hi! link PreCondit UltramarAqua

" Generic constant
hi! link Constant UltramarPurple
" Character constant: 'c', '/n'
hi! link Character UltramarPurple
" String constant: "this is a string"
if g:ultramar_improved_strings == 0
  call s:HL('String',  s:green, s:none, s:italicize_strings)
else
  call s:HL('String',  s:fg1, s:bg1, s:italicize_strings)
endif
" Boolean constant: TRUE, false
hi! link Boolean UltramarPurple
" Number constant: 234, 0xff
hi! link Number UltramarPurple
" Floating point constant: 2.3e10
hi! link Float UltramarPurple

" Generic type
hi! link Type UltramarYellow
" static, register, volatile, etc
hi! link StorageClass UltramarOrange
" struct, union, enum, etc.
hi! link Structure UltramarAqua
" typedef
hi! link Typedef UltramarYellow

" }}}
" Completion Menu: {{{

if version >= 700
  " Popup menu: normal item
  call s:HL('Pmenu', s:fg1, s:bg2)
  " Popup menu: selected item
  call s:HL('PmenuSel', s:bg2, s:blue, s:bold)
  " Popup menu: scrollbar
  call s:HL('PmenuSbar', s:none, s:bg2)
  " Popup menu: scrollbar thumb
  call s:HL('PmenuThumb', s:none, s:bg4)
endif

" }}}
" Diffs: {{{

call s:HL('DiffDelete', s:red, s:bg0, s:inverse)
call s:HL('DiffAdd',    s:green, s:bg0, s:inverse)
"call s:HL('DiffChange', s:bg0, s:blue)
"call s:HL('DiffText',   s:bg0, s:yellow)

" Alternative setting
call s:HL('DiffChange', s:aqua, s:bg0, s:inverse)
call s:HL('DiffText',   s:yellow, s:bg0, s:inverse)

" }}}
" Spelling: {{{

if has("spell")
  " Not capitalised word, or compile warnings
  if g:ultramar_improved_warnings == 0
    call s:HL('SpellCap',   s:none, s:none, s:undercurl, s:red)
  else
    call s:HL('SpellCap',   s:green, s:none, s:bold . s:italic)
  endif
  " Not recognized word
  call s:HL('SpellBad',   s:none, s:none, s:undercurl, s:blue)
  " Wrong spelling for selected region
  call s:HL('SpellLocal', s:none, s:none, s:undercurl, s:aqua)
  " Rare word
  call s:HL('SpellRare',  s:none, s:none, s:undercurl, s:purple)
endif

" }}}

" Functions -------------------------------------------------------------------
" Search Highlighting Cursor {{{

function! UltramarHlsShowCursor()
  call s:HL('Cursor', s:bg0, s:hls_cursor)
endfunction

function! UltramarHlsHideCursor()
  call s:HL('Cursor', s:none, s:none, s:inverse)
endfunction

" }}}

" vim: set sw=2 ts=2 sts=2 et tw=80 ft=vim fdm=marker:
