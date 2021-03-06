if exists('g:loaded_kite') || &cp || v:version < 700
  finish
endif
let g:loaded_kite = 1


filetype on


if !exists('g:kite_auto_complete')
  let g:kite_auto_complete = 1
endif

if !exists('g:kite_snippets')
  let g:kite_snippets = 1
endif

if !exists('g:kite_previous_placeholder')
  let g:kite_previous_placeholder = '<C-K>'
endif

if !exists('g:kite_next_placeholder')
  let g:kite_next_placeholder = '<C-J>'
endif

if !exists('g:kite_documentation_continual')
  let g:kite_documentation_continual = 0
endif

if !exists('g:kite_log')
  let g:kite_log = 0
endif

if !exists('g:kite_short_timeout')
  let g:kite_short_timeout = 120  " ms
endif

if !exists('g:kite_long_timeout')
  let g:kite_long_timeout = 400  " ms
endif

if !(has('nvim') || has('job'))
  call kite#utils#warn('disabled - requires nvim or vim with the +job feature')
  finish
endif

if !(has('nvim') || has('timers'))
  call kite#utils#warn('disabled - requires nvim or vim with the +timers feature')
  finish
endif

" Nvim-QT
if exists('g:GuiLoaded')
  GuiPopupmenu 0
endif

augroup Kite
  autocmd!
  autocmd BufEnter * call kite#bufenter()
  autocmd VimEnter * nested if &filetype !~# '^git' | call kite#onboarding#call() | endif
augroup END


nnoremap <silent> <Plug>(kite-docs) :call kite#docs#docs()<CR>

command! KiteDocsAtCursor         call kite#docs#docs()
command! KiteOpenCopilot          call kite#client#copilot()
command! KiteGeneralSettings      call kite#client#settings()
command! KitePermissions          call kite#client#permissions()
command! KiteHelp                 call kite#utils#generate_help() | help kite
command! KiteDisableAutoStart     call kite#disable_auto_start()
command! KiteEnableAutoStart      call kite#enable_auto_start()
command! KiteShowPopularPatterns  call kite#signature#show_popular_patterns()
command! KiteHidePopularPatterns  call kite#signature#hide_popular_patterns()

