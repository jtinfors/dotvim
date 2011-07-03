color vividchalk
if has("unix")
    let s:uname = system("uname")
    if s:uname == "Linux\n"
        set guifont=Terminus\ 8
    elseif s:uname == "Darwin\n"
        set guifont=Menlo_Regular:h12
    endif
endif
set go-=T
