function! myspacevim#before() abort
    nmap <SPACE>' :sh<CR>
    nmap <SPACE>d "zyiw:stag<Space><C-r>z<CR>"
endfunction
