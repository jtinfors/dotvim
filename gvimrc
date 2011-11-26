color solarized
set background=dark
if has("unix")
    let s:uname = system("uname")
    if s:uname == "Linux\n"
        set guifont=Droid\ Sans\ Mono\ 9
    elseif s:uname == "Darwin\n"
        set guifont=Menlo_Regular:h12
    endif
endif
set go-=T
