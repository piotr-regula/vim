fun SubtitlesConvert()
   silent %s/¹/a/g
   silent %s//s/g
   silent %s//z/g
   silent %s/³/l/g
   silent %s/ê/e/g
   silent %s/¿/z/g
   silent %s/æ/c/g
endfun

command! -nargs=0 SubtitlesConvert call SubtitlesConvert()
