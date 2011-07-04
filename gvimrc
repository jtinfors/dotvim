color solarized
if has("unix")
    let s:uname = system("uname")
    if s:uname == "Linux\n"
        set guifont=Terminus\ 10
    elseif s:uname == "Darwin\n"
        set guifont=Menlo_Regular:h12
    endif
endif
set go-=T
