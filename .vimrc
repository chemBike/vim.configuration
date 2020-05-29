"""""""""""""""""""""""""
"配置vim使之成为python编程IDE
"组成部分：自动加文件头、基础配置、pep8 style、一键执行、插件管理、代码补全、语法检查、
"          配色方案、代码折叠、分割窗口等
"""""""""""""""""""""""""


""""""""""""""""""""""""""
"Add A Title automatically
""""""""""""""""""""""""""
map <F7> :call AddFileHead()<CR>
"autocmd BufNewFile *.py,*.txt,*.memo exec":call AddFileHead()"
func! AddFileHead()
	call append(0,"#====================================================================")
	call append(1,"#")
	call append(2,"#       Filename: ".expand("%:t"))
	call append(3,"#")
	call append(4,"#         Author: Yong Liu - yongliucsu@gmail.com")	
	call append(5,"#     Creat time: ".strftime("%Y-%m-%d  %H:%M"))
	call append(6,"#  Last Modified: ".strftime("%Y-%m-%d  %H:%M"))
	call append(7,"#    Description: ")
	call append(8,"#")
	call append(9,"#====================================================================")
	call append(10,"")
	
	if &filetype == "python"
		call append(11,"#!/usr/bin/env python")
	elseif &filetype == "txt"
		call append(11,"")
	elseif &filetype == "memo"
		call append(11,"")
	endif
	
	call append(12,"")
	call append(13,"")
endfunc

function SetLastModifiedTime()
	let line = getline(7)
	let newtime = "#  Last Modified: ".strftime("%Y-%m-%d  %H:%M")
	let repl = substitute(line, ".*$",newtime,"g")
	let res = search("#  Last Modified","w")
	if res
		call setline(7,repl)
	endif
endfunction
autocmd BufWrite *.py,*.txt,*memo call SetLastModifiedTime()

"""""""""""""""""""""""""""""""""""""""""
"Basic configuration
"""""""""""""""""""""""""""""""""""""""""
set nocompatible	"关闭与vi的兼容模式
set number			"显示行号
"set nowrap			"不自动折行
set showmatch		"显示匹配的括号
set scrolloff=3 	"距离顶部和底部3行
set encoding=utf-8	"编码
set fenc=utf-8		"编码
set mouse=a			"启用鼠标
set hlsearch		"搜索高亮
"set t_ti= t_te=	"退出vim后内容显示在终端屏幕
syntax on			"语法高亮
set tabstop=4		"tab宽度


""""""""""""""""""""""""""
"Configure PEP8 Style
""""""""""""""""""""""""""
au BufNewFile,BufRead *.py
\ set tabstop=4	"Width of tab
\ set softtabstop=4
\ set shiftwidth=4
\ set tw=79	"Max width of single line
\ set expandtab	"Replace Tab with Space
\ set autoindent
\ set fileformat=unix	"Format for saving files


"""""""""""""""""""""""""""""
"Code folding
"""""""""""""""""""""""""""""
"set foldmethod=indent
"set foldlevel=99
"nnoremap <space> za	"Replace 'za' with Space


"""""""""""""""""""""""""""""
"Run Quickly
"""""""""""""""""""""""""""""
map <F5> :call CompileRunGcc()<CR>
func! CompileRunGcc()
	exec "w"
	if &filetype == "python"
		exec "!time python %"
	endif
endfunc
	
""""""""""""""""""""""""""""""
" Disable the direction table
""""""""""""""""""""""""""""""
"map <Left> <Nop>	"“左”键失效
"map <Right> <Nop>	"“右”键失效
"map <Up> <Nop>		"“上”键失效
"map <Down> <Nop>	"“下”键失效

""""""""""""""""""""""""""""""
"Change the colorscheme
"Location(in local host):
"	/usr/share/vim/vim80/colors/
"Command(in vim):
"	:colorsheme name
"My favorite:murphy,ron
"To find more colorscheme:
"	http://vimcolors.com/
""""""""""""""""""""""""""""""
