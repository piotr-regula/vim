"fold paragraphs in vim files excluding ascii headers
:silent %g/^\s*$\n^[a-zA-Z"][^=]\+/normal vapzf
