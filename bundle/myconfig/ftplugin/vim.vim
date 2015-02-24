"fold paragraphs in vim files excluding ascii headers
:%g/^\s*$\n^[a-zA-Z"][^=]\+/normal vapzf
