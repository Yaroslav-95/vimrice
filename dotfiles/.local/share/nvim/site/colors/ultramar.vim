" -----------------------------------------------------------------------------
" File: ultramar.vim
" Description: Ultramar color scheme for vim
" Author: Yaroslav de la Peña Smirnov <contact@yaroslavps.com>
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

if exists('g:ultramar_contrast')
  echo 'g:ultramar_contrast is deprecated; use g:ultramar_contrast_light and g:ultramar_contrast_dark instead'
endif

if !exists('g:ultramar_contrast_dark')
  let g:ultramar_contrast_dark='medium'
endif

if !exists('g:ultramar_contrast_light')
  let g:ultramar_contrast_light='medium'
endif

let s:is_dark=(&background == 'dark')

" }}}
" Palette: {{{

" setup palette dictionary
let s:palette = {}

" fill it with absolute colors
let s:palette.dark0_hard  = ['#1d2021', 234]     " 29-32-33
let s:palette.dark0       = ['#1b1e25', 235]     " 40-40-40
let s:palette.dark0_soft  = ['#252832', 236]     " 50-48-47
let s:palette.dark1       = ['#252832', 237]     " 60-56-54
let s:palette.dark2       = ['#3b4252', 239]     " 80-73-69
let s:palette.dark3       = ['#434c5e', 241]     " 102-92-84
let s:palette.dark4       = ['#697792', 243]     " 124-111-100
let s:palette.dark4_256   = ['#697792', 243]     " 124-111-100

let s:palette.gray_245    = ['#9197a5', 245]     " 146-131-116
let s:palette.gray_244    = ['#9197a5', 244]     " 146-131-116

let s:palette.light0_hard = ['#fbf1c7', 230]     " 249-245-215
let s:palette.light0      = ['#fbf1c7', 229]     " 253-244-193
let s:palette.light0_soft = ['#f9f5d7', 228]     " 242-229-188
let s:palette.light1      = ['#e5e9f0', 223]     " 235-219-178
let s:palette.light2      = ['#e5e9f0', 250]     " 213-196-161
let s:palette.light3      = ['#d8dee9', 248]     " 189-174-147
let s:palette.light4      = ['#d8dee9', 246]     " 168-153-132
let s:palette.light4_256  = ['#d8dee9', 246]     " 168-153-132

let s:palette.bright_red     = ['#c45c5c', 167]     " 251-73-52
let s:palette.bright_green   = ['#9eba86', 142]     " 184-187-38
let s:palette.bright_yellow  = ['#e2b55a', 214]     " 250-189-47
let s:palette.bright_blue    = ['#81acc1', 109]     " 131-165-152
let s:palette.bright_purple  = ['#b48ead', 175]     " 211-134-155
let s:palette.bright_aqua    = ['#89b6a0', 108]     " 142-192-124
let s:palette.bright_orange  = ['#d08770', 208]     " 254-128-25

let s:palette.neutral_red    = ['#b73030', 124]     " 204-36-29
let s:palette.neutral_green  = ['#7ea95a', 106]     " 152-151-26
let s:palette.neutral_yellow = ['#b2872f', 172]     " 215-153-33
let s:palette.neutral_blue   = ['#3f6e90', 66]      " 69-133-136
let s:palette.neutral_purple = ['#9c6992', 132]     " 177-98-134
let s:palette.neutral_aqua   = ['#5b8277', 72]      " 104-157-106
let s:palette.neutral_orange = ['#af5539', 166]     " 214-93-14

let s:palette.faded_red      = ['#b73030', 88]      " 157-0-6
let s:palette.faded_green    = ['#7ea95a', 100]     " 121-116-14
let s:palette.faded_yellow   = ['#b2872f', 136]     " 181-118-20
let s:palette.faded_blue     = ['#3f6e90', 24]      " 7-102-120
let s:palette.faded_purple   = ['#9c6992', 96]      " 143-63-113
let s:palette.faded_aqua     = ['#5b8277', 66]      " 66-123-88
let s:palette.faded_orange   = ['#af5539', 130]     " 175-58-3

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

let s:vim_bg = ['bg', 'bg']
let s:vim_fg = ['fg', 'fg']
let s:none = ['NONE', 'NONE']

" determine relative colors
if s:is_dark
  let s:bg0  = s:palette.dark0
  if g:ultramar_contrast_dark == 'soft'
    let s:bg0  = s:palette.dark0_soft
  elseif g:ultramar_contrast_dark == 'hard'
    let s:bg0  = s:palette.dark0_hard
  endif

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

  let s:fg4_256 = s:palette.light4_256

  let s:red    = s:palette.bright_red
  let s:green  = s:palette.bright_green
  let s:yellow = s:palette.bright_yellow
  let s:blue   = s:palette.bright_blue
  let s:purple = s:palette.bright_purple
  let s:aqua   = s:palette.bright_aqua
  let s:orange = s:palette.bright_orange
else
  let s:bg0  = s:palette.light0
  if g:ultramar_contrast_light == 'soft'
    let s:bg0  = s:palette.light0_soft
  elseif g:ultramar_contrast_light == 'hard'
    let s:bg0  = s:palette.light0_hard
  endif

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

  let s:fg4_256 = s:palette.dark4_256

  let s:red    = s:palette.faded_red
  let s:green  = s:palette.faded_green
  let s:yellow = s:palette.faded_yellow
  let s:blue   = s:palette.faded_blue
  let s:purple = s:palette.faded_purple
  let s:aqua   = s:palette.faded_aqua
  let s:orange = s:palette.faded_orange
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
call s:HL('Normal', s:fg1, s:bg0)

" Correct background (see issue #7):
" --- Problem with changing between dark and light on 256 color terminal
" --- https://github.com/morhetz/ultramar/issues/7
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
  call s:HL('TabLineFill', s:bg4, s:bg1, s:invert_tabline)
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
call s:HL('Todo', s:vim_fg, s:vim_bg, s:bold . s:italic)
call s:HL('Error', s:red, s:vim_bg, s:bold . s:inverse)

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

" Plugin specific -------------------------------------------------------------
" EasyMotion: {{{

hi! link EasyMotionTarget Search
hi! link EasyMotionShade Comment

" }}}
" Sneak: {{{

hi! link Sneak Search
hi! link SneakLabel Search

" }}}
" Indent Guides: {{{

if !exists('g:indent_guides_auto_colors')
  let g:indent_guides_auto_colors = 0
endif

if g:indent_guides_auto_colors == 0
  if g:ultramar_invert_indent_guides == 0
    call s:HL('IndentGuidesOdd', s:vim_bg, s:bg2)
    call s:HL('IndentGuidesEven', s:vim_bg, s:bg1)
  else
    call s:HL('IndentGuidesOdd', s:vim_bg, s:bg2, s:inverse)
    call s:HL('IndentGuidesEven', s:vim_bg, s:bg3, s:inverse)
  endif
endif

" }}}
" IndentLine: {{{

if !exists('g:indentLine_color_term')
  let g:indentLine_color_term = s:bg2[1]
endif
if !exists('g:indentLine_color_gui')
  let g:indentLine_color_gui = s:bg2[0]
endif

" }}}
" Rainbow Parentheses: {{{

if !exists('g:rbpt_colorpairs')
  let g:rbpt_colorpairs =
    \ [
      \ ['blue', '#458588'], ['magenta', '#b16286'],
      \ ['red',  '#cc241d'], ['166',     '#d65d0e']
    \ ]
endif

let g:rainbow_guifgs = [ '#d65d0e', '#cc241d', '#b16286', '#458588' ]
let g:rainbow_ctermfgs = [ '166', 'red', 'magenta', 'blue' ]

if !exists('g:rainbow_conf')
   let g:rainbow_conf = {}
endif
if !has_key(g:rainbow_conf, 'guifgs')
   let g:rainbow_conf['guifgs'] = g:rainbow_guifgs
endif
if !has_key(g:rainbow_conf, 'ctermfgs')
   let g:rainbow_conf['ctermfgs'] = g:rainbow_ctermfgs
endif

let g:niji_dark_colours = g:rbpt_colorpairs
let g:niji_light_colours = g:rbpt_colorpairs

"}}}
" GitGutter: {{{

hi! link GitGutterAdd UltramarGreenSign
hi! link GitGutterChange UltramarAquaSign
hi! link GitGutterDelete UltramarRedSign
hi! link GitGutterChangeDelete UltramarAquaSign

" }}}
" GitCommit: "{{{

hi! link gitcommitSelectedFile UltramarGreen
hi! link gitcommitDiscardedFile UltramarRed

" }}}
" Signify: {{{

hi! link SignifySignAdd UltramarGreenSign
hi! link SignifySignChange UltramarAquaSign
hi! link SignifySignDelete UltramarRedSign

" }}}
" Syntastic: {{{

call s:HL('SyntasticError', s:none, s:none, s:undercurl, s:red)
call s:HL('SyntasticWarning', s:none, s:none, s:undercurl, s:yellow)

hi! link SyntasticErrorSign UltramarRedSign
hi! link SyntasticWarningSign UltramarYellowSign

" }}}
" Signature: {{{
hi! link SignatureMarkText   UltramarBlueSign
hi! link SignatureMarkerText UltramarPurpleSign

" }}}
" ShowMarks: {{{

hi! link ShowMarksHLl UltramarBlueSign
hi! link ShowMarksHLu UltramarBlueSign
hi! link ShowMarksHLo UltramarBlueSign
hi! link ShowMarksHLm UltramarBlueSign

" }}}
" CtrlP: {{{

hi! link CtrlPMatch UltramarYellow
hi! link CtrlPNoEntries UltramarRed
hi! link CtrlPPrtBase UltramarBg2
hi! link CtrlPPrtCursor UltramarBlue
hi! link CtrlPLinePre UltramarBg2

call s:HL('CtrlPMode1', s:blue, s:bg2, s:bold)
call s:HL('CtrlPMode2', s:bg0, s:blue, s:bold)
call s:HL('CtrlPStats', s:fg4, s:bg2, s:bold)

" }}}
" Startify: {{{

hi! link StartifyBracket UltramarFg3
hi! link StartifyFile UltramarFg1
hi! link StartifyNumber UltramarBlue
hi! link StartifyPath UltramarGray
hi! link StartifySlash UltramarGray
hi! link StartifySection UltramarYellow
hi! link StartifySpecial UltramarBg2
hi! link StartifyHeader UltramarOrange
hi! link StartifyFooter UltramarBg2

" }}}
" Vimshell: {{{

let g:vimshell_escape_colors = [
  \ s:bg4[0], s:red[0], s:green[0], s:yellow[0],
  \ s:blue[0], s:purple[0], s:aqua[0], s:fg4[0],
  \ s:bg0[0], s:red[0], s:green[0], s:orange[0],
  \ s:blue[0], s:purple[0], s:aqua[0], s:fg0[0]
  \ ]

" }}}
" BufTabLine: {{{

call s:HL('BufTabLineCurrent', s:bg0, s:fg4)
call s:HL('BufTabLineActive', s:fg4, s:bg2)
call s:HL('BufTabLineHidden', s:bg4, s:bg1)
call s:HL('BufTabLineFill', s:bg0, s:bg0)

" }}}
" Asynchronous Lint Engine: {{{

call s:HL('ALEError', s:none, s:none, s:undercurl, s:red)
call s:HL('ALEWarning', s:none, s:none, s:undercurl, s:yellow)
call s:HL('ALEInfo', s:none, s:none, s:undercurl, s:blue)

hi! link ALEErrorSign UltramarRedSign
hi! link ALEWarningSign UltramarYellowSign
hi! link ALEInfoSign UltramarBlueSign

" }}}
" Dirvish: {{{

hi! link DirvishPathTail UltramarAqua
hi! link DirvishArg UltramarYellow

" }}}
" Netrw: {{{

hi! link netrwDir UltramarAqua
hi! link netrwClassify UltramarAqua
hi! link netrwLink UltramarGray
hi! link netrwSymLink UltramarFg1
hi! link netrwExe UltramarYellow
hi! link netrwComment UltramarGray
hi! link netrwList UltramarBlue
hi! link netrwHelpCmd UltramarAqua
hi! link netrwCmdSep UltramarFg3
hi! link netrwVersion UltramarGreen

" }}}
" NERDTree: {{{

hi! link NERDTreeDir UltramarAqua
hi! link NERDTreeDirSlash UltramarAqua

hi! link NERDTreeOpenable UltramarOrange
hi! link NERDTreeClosable UltramarOrange

hi! link NERDTreeFile UltramarFg1
hi! link NERDTreeExecFile UltramarYellow

hi! link NERDTreeUp UltramarGray
hi! link NERDTreeCWD UltramarGreen
hi! link NERDTreeHelp UltramarFg1

hi! link NERDTreeToggleOn UltramarGreen
hi! link NERDTreeToggleOff UltramarRed

" }}}
" Vim Multiple Cursors: {{{

call s:HL('multiple_cursors_cursor', s:none, s:none, s:inverse)
call s:HL('multiple_cursors_visual', s:none, s:bg2)

" }}}

" Filetype specific -----------------------------------------------------------
" Diff: {{{

hi! link diffAdded UltramarGreen
hi! link diffRemoved UltramarRed
hi! link diffChanged UltramarAqua

hi! link diffFile UltramarOrange
hi! link diffNewFile UltramarYellow

hi! link diffLine UltramarBlue

" }}}
" Html: {{{

hi! link htmlTag UltramarBlue
hi! link htmlEndTag UltramarBlue

hi! link htmlTagName UltramarAquaBold
hi! link htmlArg UltramarAqua

hi! link htmlScriptTag UltramarPurple
hi! link htmlTagN UltramarFg1
hi! link htmlSpecialTagName UltramarAquaBold

call s:HL('htmlLink', s:fg4, s:none, s:underline)

hi! link htmlSpecialChar UltramarOrange

call s:HL('htmlBold', s:vim_fg, s:vim_bg, s:bold)
call s:HL('htmlBoldUnderline', s:vim_fg, s:vim_bg, s:bold . s:underline)
call s:HL('htmlBoldItalic', s:vim_fg, s:vim_bg, s:bold . s:italic)
call s:HL('htmlBoldUnderlineItalic', s:vim_fg, s:vim_bg, s:bold . s:underline . s:italic)

call s:HL('htmlUnderline', s:vim_fg, s:vim_bg, s:underline)
call s:HL('htmlUnderlineItalic', s:vim_fg, s:vim_bg, s:underline . s:italic)
call s:HL('htmlItalic', s:vim_fg, s:vim_bg, s:italic)

" }}}
" Xml: {{{

hi! link xmlTag UltramarBlue
hi! link xmlEndTag UltramarBlue
hi! link xmlTagName UltramarBlue
hi! link xmlEqual UltramarBlue
hi! link docbkKeyword UltramarAquaBold

hi! link xmlDocTypeDecl UltramarGray
hi! link xmlDocTypeKeyword UltramarPurple
hi! link xmlCdataStart UltramarGray
hi! link xmlCdataCdata UltramarPurple
hi! link dtdFunction UltramarGray
hi! link dtdTagName UltramarPurple

hi! link xmlAttrib UltramarAqua
hi! link xmlProcessingDelim UltramarGray
hi! link dtdParamEntityPunct UltramarGray
hi! link dtdParamEntityDPunct UltramarGray
hi! link xmlAttribPunct UltramarGray

hi! link xmlEntity UltramarOrange
hi! link xmlEntityPunct UltramarOrange
" }}}
" Vim: {{{

call s:HL('vimCommentTitle', s:fg4_256, s:none, s:bold . s:italicize_comments)

hi! link vimNotation UltramarOrange
hi! link vimBracket UltramarOrange
hi! link vimMapModKey UltramarOrange
hi! link vimFuncSID UltramarFg3
hi! link vimSetSep UltramarFg3
hi! link vimSep UltramarFg3
hi! link vimContinue UltramarFg3

" }}}
" Clojure: {{{

hi! link clojureKeyword UltramarBlue
hi! link clojureCond UltramarOrange
hi! link clojureSpecial UltramarOrange
hi! link clojureDefine UltramarOrange

hi! link clojureFunc UltramarYellow
hi! link clojureRepeat UltramarYellow
hi! link clojureCharacter UltramarAqua
hi! link clojureStringEscape UltramarAqua
hi! link clojureException UltramarRed

hi! link clojureRegexp UltramarAqua
hi! link clojureRegexpEscape UltramarAqua
call s:HL('clojureRegexpCharClass', s:fg3, s:none, s:bold)
hi! link clojureRegexpMod clojureRegexpCharClass
hi! link clojureRegexpQuantifier clojureRegexpCharClass

hi! link clojureParen UltramarFg3
hi! link clojureAnonArg UltramarYellow
hi! link clojureVariable UltramarBlue
hi! link clojureMacro UltramarOrange

hi! link clojureMeta UltramarYellow
hi! link clojureDeref UltramarYellow
hi! link clojureQuote UltramarYellow
hi! link clojureUnquote UltramarYellow

" }}}
" C: {{{

hi! link cOperator UltramarPurple
hi! link cStructure UltramarOrange

" }}}
" Python: {{{

hi! link pythonBuiltin UltramarOrange
hi! link pythonBuiltinObj UltramarOrange
hi! link pythonBuiltinFunc UltramarOrange
hi! link pythonFunction UltramarAqua
hi! link pythonDecorator UltramarRed
hi! link pythonInclude UltramarBlue
hi! link pythonImport UltramarBlue
hi! link pythonRun UltramarBlue
hi! link pythonCoding UltramarBlue
hi! link pythonOperator UltramarRed
hi! link pythonException UltramarRed
hi! link pythonExceptions UltramarPurple
hi! link pythonBoolean UltramarPurple
hi! link pythonDot UltramarFg3
hi! link pythonConditional UltramarRed
hi! link pythonRepeat UltramarRed
hi! link pythonDottedName UltramarGreenBold

" }}}
" CSS: {{{

hi! link cssBraces UltramarBlue
hi! link cssFunctionName UltramarYellow
hi! link cssIdentifier UltramarOrange
hi! link cssClassName UltramarGreen
hi! link cssColor UltramarBlue
hi! link cssSelectorOp UltramarBlue
hi! link cssSelectorOp2 UltramarBlue
hi! link cssImportant UltramarGreen
hi! link cssVendor UltramarFg1

hi! link cssTextProp UltramarAqua
hi! link cssAnimationProp UltramarAqua
hi! link cssUIProp UltramarYellow
hi! link cssTransformProp UltramarAqua
hi! link cssTransitionProp UltramarAqua
hi! link cssPrintProp UltramarAqua
hi! link cssPositioningProp UltramarYellow
hi! link cssBoxProp UltramarAqua
hi! link cssFontDescriptorProp UltramarAqua
hi! link cssFlexibleBoxProp UltramarAqua
hi! link cssBorderOutlineProp UltramarAqua
hi! link cssBackgroundProp UltramarAqua
hi! link cssMarginProp UltramarAqua
hi! link cssListProp UltramarAqua
hi! link cssTableProp UltramarAqua
hi! link cssFontProp UltramarAqua
hi! link cssPaddingProp UltramarAqua
hi! link cssDimensionProp UltramarAqua
hi! link cssRenderProp UltramarAqua
hi! link cssColorProp UltramarAqua
hi! link cssGeneratedContentProp UltramarAqua

" }}}
" JavaScript: {{{

hi! link javaScriptBraces UltramarFg1
hi! link javaScriptFunction UltramarAqua
hi! link javaScriptIdentifier UltramarRed
hi! link javaScriptMember UltramarBlue
hi! link javaScriptNumber UltramarPurple
hi! link javaScriptNull UltramarPurple
hi! link javaScriptParens UltramarFg3

" }}}
" YAJS: {{{

hi! link javascriptImport UltramarAqua
hi! link javascriptExport UltramarAqua
hi! link javascriptClassKeyword UltramarAqua
hi! link javascriptClassExtends UltramarAqua
hi! link javascriptDefault UltramarAqua

hi! link javascriptClassName UltramarYellow
hi! link javascriptClassSuperName UltramarYellow
hi! link javascriptGlobal UltramarYellow

hi! link javascriptEndColons UltramarFg1
hi! link javascriptFuncArg UltramarFg1
hi! link javascriptGlobalMethod UltramarFg1
hi! link javascriptNodeGlobal UltramarFg1
hi! link javascriptBOMWindowProp UltramarFg1
hi! link javascriptArrayMethod UltramarFg1
hi! link javascriptArrayStaticMethod UltramarFg1
hi! link javascriptCacheMethod UltramarFg1
hi! link javascriptDateMethod UltramarFg1
hi! link javascriptMathStaticMethod UltramarFg1

" hi! link javascriptProp UltramarFg1
hi! link javascriptURLUtilsProp UltramarFg1
hi! link javascriptBOMNavigatorProp UltramarFg1
hi! link javascriptDOMDocMethod UltramarFg1
hi! link javascriptDOMDocProp UltramarFg1
hi! link javascriptBOMLocationMethod UltramarFg1
hi! link javascriptBOMWindowMethod UltramarFg1
hi! link javascriptStringMethod UltramarFg1

hi! link javascriptVariable UltramarOrange
" hi! link javascriptVariable UltramarRed
" hi! link javascriptIdentifier UltramarOrange
" hi! link javascriptClassSuper UltramarOrange
hi! link javascriptIdentifier UltramarOrange
hi! link javascriptClassSuper UltramarOrange

" hi! link javascriptFuncKeyword UltramarOrange
" hi! link javascriptAsyncFunc UltramarOrange
hi! link javascriptFuncKeyword UltramarAqua
hi! link javascriptAsyncFunc UltramarAqua
hi! link javascriptClassStatic UltramarOrange

hi! link javascriptOperator UltramarRed
hi! link javascriptForOperator UltramarRed
hi! link javascriptYield UltramarRed
hi! link javascriptExceptions UltramarRed
hi! link javascriptMessage UltramarRed

hi! link javascriptTemplateSB UltramarAqua
hi! link javascriptTemplateSubstitution UltramarFg1

" hi! link javascriptLabel UltramarBlue
" hi! link javascriptObjectLabel UltramarBlue
" hi! link javascriptPropertyName UltramarBlue
hi! link javascriptLabel UltramarFg1
hi! link javascriptObjectLabel UltramarFg1
hi! link javascriptPropertyName UltramarFg1

hi! link javascriptLogicSymbols UltramarFg1
hi! link javascriptArrowFunc UltramarYellow

hi! link javascriptDocParamName UltramarFg4
hi! link javascriptDocTags UltramarFg4
hi! link javascriptDocNotation UltramarFg4
hi! link javascriptDocParamType UltramarFg4
hi! link javascriptDocNamedParamType UltramarFg4

hi! link javascriptBrackets UltramarFg1
hi! link javascriptDOMElemAttrs UltramarFg1
hi! link javascriptDOMEventMethod UltramarFg1
hi! link javascriptDOMNodeMethod UltramarFg1
hi! link javascriptDOMStorageMethod UltramarFg1
hi! link javascriptHeadersMethod UltramarFg1

hi! link javascriptAsyncFuncKeyword UltramarRed
hi! link javascriptAwaitFuncKeyword UltramarRed

" }}}
" PanglossJS: {{{

hi! link jsClassKeyword UltramarAqua
hi! link jsExtendsKeyword UltramarAqua
hi! link jsExportDefault UltramarAqua
hi! link jsTemplateBraces UltramarAqua
hi! link jsGlobalNodeObjects UltramarFg1
hi! link jsGlobalObjects UltramarFg1
hi! link jsFunction UltramarAqua
hi! link jsFuncParens UltramarFg3
hi! link jsParens UltramarFg3
hi! link jsNull UltramarPurple
hi! link jsUndefined UltramarPurple
hi! link jsClassDefinition UltramarYellow

" }}}
" TypeScript: {{{

hi! link typeScriptReserved UltramarAqua
hi! link typeScriptLabel UltramarAqua
hi! link typeScriptFuncKeyword UltramarAqua
hi! link typeScriptIdentifier UltramarOrange
hi! link typeScriptBraces UltramarFg1
hi! link typeScriptEndColons UltramarFg1
hi! link typeScriptDOMObjects UltramarFg1
hi! link typeScriptAjaxMethods UltramarFg1
hi! link typeScriptLogicSymbols UltramarFg1
hi! link typeScriptDocSeeTag Comment
hi! link typeScriptDocParam Comment
hi! link typeScriptDocTags vimCommentTitle
hi! link typeScriptGlobalObjects UltramarFg1
hi! link typeScriptParens UltramarFg3
hi! link typeScriptOpSymbols UltramarFg3
hi! link typeScriptHtmlElemProperties UltramarFg1
hi! link typeScriptNull UltramarPurple
hi! link typeScriptInterpolationDelimiter UltramarAqua

" }}}
" PureScript: {{{

hi! link purescriptModuleKeyword UltramarAqua
hi! link purescriptModuleName UltramarFg1
hi! link purescriptWhere UltramarAqua
hi! link purescriptDelimiter UltramarFg4
hi! link purescriptType UltramarFg1
hi! link purescriptImportKeyword UltramarAqua
hi! link purescriptHidingKeyword UltramarAqua
hi! link purescriptAsKeyword UltramarAqua
hi! link purescriptStructure UltramarAqua
hi! link purescriptOperator UltramarBlue

hi! link purescriptTypeVar UltramarFg1
hi! link purescriptConstructor UltramarFg1
hi! link purescriptFunction UltramarFg1
hi! link purescriptConditional UltramarOrange
hi! link purescriptBacktick UltramarOrange

" }}}
" CoffeeScript: {{{

hi! link coffeeExtendedOp UltramarFg3
hi! link coffeeSpecialOp UltramarFg3
hi! link coffeeCurly UltramarOrange
hi! link coffeeParen UltramarFg3
hi! link coffeeBracket UltramarOrange

" }}}
" Ruby: {{{

hi! link rubyStringDelimiter UltramarGreen
hi! link rubyInterpolationDelimiter UltramarAqua

" }}}
" ObjectiveC: {{{

hi! link objcTypeModifier UltramarRed
hi! link objcDirective UltramarBlue

" }}}
" Go: {{{

hi! link goDirective UltramarAqua
hi! link goConstants UltramarPurple
hi! link goDeclaration UltramarRed
hi! link goDeclType UltramarBlue
hi! link goBuiltins UltramarOrange

" }}}
" Lua: {{{

hi! link luaIn UltramarRed
hi! link luaFunction UltramarAqua
hi! link luaTable UltramarOrange

" }}}
" MoonScript: {{{

hi! link moonSpecialOp UltramarFg3
hi! link moonExtendedOp UltramarFg3
hi! link moonFunction UltramarFg3
hi! link moonObject UltramarYellow

" }}}
" Java: {{{

hi! link javaAnnotation UltramarBlue
hi! link javaDocTags UltramarAqua
hi! link javaCommentTitle vimCommentTitle
hi! link javaParen UltramarFg3
hi! link javaParen1 UltramarFg3
hi! link javaParen2 UltramarFg3
hi! link javaParen3 UltramarFg3
hi! link javaParen4 UltramarFg3
hi! link javaParen5 UltramarFg3
hi! link javaOperator UltramarOrange

hi! link javaVarArg UltramarGreen

" }}}
" Elixir: {{{

hi! link elixirDocString Comment

hi! link elixirStringDelimiter UltramarGreen
hi! link elixirInterpolationDelimiter UltramarAqua

hi! link elixirModuleDeclaration UltramarYellow

" }}}
" Scala: {{{

" NB: scala vim syntax file is kinda horrible
hi! link scalaNameDefinition UltramarFg1
hi! link scalaCaseFollowing UltramarFg1
hi! link scalaCapitalWord UltramarFg1
hi! link scalaTypeExtension UltramarFg1

hi! link scalaKeyword UltramarRed
hi! link scalaKeywordModifier UltramarRed

hi! link scalaSpecial UltramarAqua
hi! link scalaOperator UltramarFg1

hi! link scalaTypeDeclaration UltramarYellow
hi! link scalaTypeTypePostDeclaration UltramarYellow

hi! link scalaInstanceDeclaration UltramarFg1
hi! link scalaInterpolation UltramarAqua

" }}}
" Markdown: {{{

call s:HL('markdownItalic', s:fg3, s:none, s:italic)

hi! link markdownH1 UltramarGreenBold
hi! link markdownH2 UltramarGreenBold
hi! link markdownH3 UltramarYellowBold
hi! link markdownH4 UltramarYellowBold
hi! link markdownH5 UltramarYellow
hi! link markdownH6 UltramarYellow

hi! link markdownCode UltramarAqua
hi! link markdownCodeBlock UltramarAqua
hi! link markdownCodeDelimiter UltramarAqua

hi! link markdownBlockquote UltramarGray
hi! link markdownListMarker UltramarGray
hi! link markdownOrderedListMarker UltramarGray
hi! link markdownRule UltramarGray
hi! link markdownHeadingRule UltramarGray

hi! link markdownUrlDelimiter UltramarFg3
hi! link markdownLinkDelimiter UltramarFg3
hi! link markdownLinkTextDelimiter UltramarFg3

hi! link markdownHeadingDelimiter UltramarOrange
hi! link markdownUrl UltramarPurple
hi! link markdownUrlTitleDelimiter UltramarGreen

call s:HL('markdownLinkText', s:gray, s:none, s:underline)
hi! link markdownIdDeclaration markdownLinkText

" }}}
" Haskell: {{{

" hi! link haskellType UltramarYellow
" hi! link haskellOperators UltramarOrange
" hi! link haskellConditional UltramarAqua
" hi! link haskellLet UltramarOrange
"
hi! link haskellType UltramarFg1
hi! link haskellIdentifier UltramarFg1
hi! link haskellSeparator UltramarFg1
hi! link haskellDelimiter UltramarFg4
hi! link haskellOperators UltramarBlue
"
hi! link haskellBacktick UltramarOrange
hi! link haskellStatement UltramarOrange
hi! link haskellConditional UltramarOrange

hi! link haskellLet UltramarAqua
hi! link haskellDefault UltramarAqua
hi! link haskellWhere UltramarAqua
hi! link haskellBottom UltramarAqua
hi! link haskellBlockKeywords UltramarAqua
hi! link haskellImportKeywords UltramarAqua
hi! link haskellDeclKeyword UltramarAqua
hi! link haskellDeriving UltramarAqua
hi! link haskellAssocType UltramarAqua

hi! link haskellNumber UltramarPurple
hi! link haskellPragma UltramarPurple

hi! link haskellString UltramarGreen
hi! link haskellChar UltramarGreen

" }}}
" Json: {{{

hi! link jsonKeyword UltramarGreen
hi! link jsonQuote UltramarGreen
hi! link jsonBraces UltramarFg1
hi! link jsonString UltramarFg1

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
