" additional cpp file type
au BufNewFile,BufRead *.ipp,*.cpp*.tmp setf cpp

" High Level Shader Language
au BufNewFile,BufRead *.hlsl,*.fx,*.fxh,*.cg,*.vsh,*.psh,*.shd,*.glsl,*.shader setf hlsl

" Max Script
au BufNewFile,BufRead *.ms,*.mse,*.mcr,*.mzp,*.ds setf maxscript

" Doxygen Comment
au BufNewFile,BufRead *.dox,*.doxygen setf cpp.doxygen

" gmsh
au BufNewFile,BufRead *.geo setf gmsh

" as (actionscript/flash) I use java analyasis it
au BufNewFile,BufRead *.as setf javascript

" nsis
au BufNewFile,BufRead *.nsh setf nsis

" swig
au BufNewFile,BufRead *.i,*.swg setf swig

" cs
au BufNewFile,BufRead *.tt setf cs

" treat gitignore file as config file
au BufNewFile,BufRead *.gitignore setf cfg

au BufNewFile,BufRead *.notes  setf notes

au BufNewFile,BufRead *.pu,*.plantuml,*.puml  setf plantuml

