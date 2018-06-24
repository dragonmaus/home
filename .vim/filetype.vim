augroup filetypedetect
  autocmd BufNewFile,BufRead *.cabal,.ghci setfiletype haskell
  autocmd BufNewFile,BufRead *.shar,.profile,.shrc,profile,shrc setfiletype sh
augroup END
