augroup filetypedetect
  autocmd BufNewFile,BufRead .ghci,ghci.conf setfiletype haskell
  autocmd BufNewFile,BufRead *.shar,.profile,.shrc,profile,shrc setfiletype sh
augroup END
