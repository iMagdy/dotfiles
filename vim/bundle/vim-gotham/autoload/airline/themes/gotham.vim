" Bootstrap ===================================================================

" Let's store all the colors in a dictionary.
let s:c = {}

" Base colors.
let s:c.base0 = { 'gui': '#0c1014', 'cterm': 0 }
let s:c.base1 = { 'gui': '#11151c', 'cterm': 8 }
let s:c.base2 = { 'gui': '#091f2e', 'cterm': 10 }
let s:c.base3 = { 'gui': '#0a3749', 'cterm': 12 }
let s:c.base4 = { 'gui': '#245361', 'cterm': 11 }
let s:c.base5 = { 'gui': '#599cab', 'cterm': 14 }
let s:c.base6 = { 'gui': '#99d1ce', 'cterm': 7 }
let s:c.base7 = { 'gui': '#d3ebe9', 'cterm': 15 }

" Other colors.
let s:c.red     = { 'gui': '#c23127', 'cterm': 1  }
let s:c.orange  = { 'gui': '#d26937', 'cterm': 9  }
let s:c.yellow  = { 'gui': '#edb443', 'cterm': 3  }
let s:c.magenta = { 'gui': '#888ca6', 'cterm': 13 }
let s:c.violet  = { 'gui': '#4e5166', 'cterm': 5  }
let s:c.blue    = { 'gui': '#195466', 'cterm': 4  }
let s:c.cyan    = { 'gui': '#33859E', 'cterm': 6  }
let s:c.green   = { 'gui': '#2aa889', 'cterm': 2  }

let g:airline#themes#gotham#palette = {}

" Just remember:
" [guifg, guibg, ctermfg, ctermbg, opts]
function! s:Array(fg, bg, ...)
  let result = [s:c[a:fg].gui, s:c[a:bg].gui, s:c[a:fg].cterm, s:c[a:bg].cterm]

  for opt in a:000
    call add(result, opt)
  endfor

  return result
endfunction



" Normal mode =================================================================

" Colors.
let s:N1 = s:Array('base7', 'base4')
let s:N2 = s:Array('base5', 'base2')
let s:N3 = s:Array('base4', 'base1')

let g:airline#themes#gotham#palette.normal =
      \ airline#themes#generate_color_map(s:N1, s:N2, s:N3)

" Overrides for when the buffer is modified in normal mode.
let g:airline#themes#gotham#palette.normal_modified = {
      \ 'airline_c': s:Array('magenta', 'base1', '')
      \ }


" Insert mode ==================================================================

" Colors.
let s:I1 = s:Array('base7', 'yellow')
let s:I2 = s:Array('base6', 'base3')
let s:I3 = s:Array('base4', 'base1')

let g:airline#themes#gotham#palette.insert =
      \ airline#themes#generate_color_map(s:I1, s:I2, s:I3)

" Overrides for when the buffer is modified in insert mode.
let g:airline#themes#gotham#palette.insert_modified = {
      \ 'airline_c': s:Array('magenta', 'base1', '')
      \ }

" Overrides for when the paste is toggled in insert mode.
let g:airline#themes#gotham#palette.insert_paste = {
      \ 'airline_a': [s:I1[0], s:c.orange.gui, s:I1[2], s:c.orange.cterm, ''] ,
      \ }



" Replace mode ================================================================

" Let's start with the same palette as insert mode...
let g:airline#themes#gotham#palette.replace =
      \ copy(g:airline#themes#gotham#palette.insert)
let g:airline#themes#gotham#palette.replace_modified =
      \ g:airline#themes#gotham#palette.insert_modified
" ...and tweak it slightly.
let g:airline#themes#gotham#palette.replace.airline_a =
      \ [s:I2[0], s:c.red.gui, s:I2[2], 124, '']



" Visual mode =================================================================

" Colors.
let s:V1 = s:Array('base7', 'green')
let s:V2 = s:Array('base6', 'base3')
let s:V3 = s:N3

let g:airline#themes#gotham#palette.visual =
      \ airline#themes#generate_color_map(s:V1, s:V2, s:V3)

" Overrides for when the buffer is modified.
let g:airline#themes#gotham#palette.visual_modified =
      \ g:airline#themes#gotham#palette.normal_modified



" Inactive mode (when the focus is not on the window) =========================

let s:IA1 = s:Array('base4', 'base2')
let s:IA2 = s:Array('base4', 'base1')
let s:IA3 = s:Array('base4', 'base0')

let g:airline#themes#gotham#palette.inactive =
      \ airline#themes#generate_color_map(s:IA1, s:IA2, s:IA3)

let g:airline#themes#gotham#palette.inactive_modified = {
      \ 'airline_c': [s:c.magenta.gui, '' , s:c.magenta.cterm, '', ''],
      \ }



" Accents =====================================================================

" Accents are used to give parts within a section a slightly different look or
" color. Here we are defining a 'red' accent, which is used by the 'readonly'
" part by default. Only the foreground colors are specified, so the background
" colors are automatically extracted from the underlying section colors. What
" this means is that regardless of which section the part is defined in, it
" will be red instead of the section's foreground color. You can also have
" multiple parts with accents within a section.
let g:airline#themes#gotham#palette.accents = {
      \ 'red': [s:c.red.gui, '', s:c.red.cterm, '']
      \ }



" CtrlP =======================================================================

" Finish here if CtrlP isn't installed.
if !get(g:, 'loaded_ctrlp', 0)
  finish
endif

let s:CP1 = s:Array('base6', 'base2', '')
let s:CP2 = s:Array('base6', 'base4', '')
let s:CP3 = s:Array('base7', 'green', 'bold')

let g:airline#themes#gotham#palette.ctrlp =
      \ airline#extensions#ctrlp#generate_color_map(s:CP1, s:CP2, s:CP3)