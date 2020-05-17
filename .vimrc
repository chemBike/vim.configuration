"""""""""""""""""""""""""
"配置vim使之成为python编程IDE
"组成部分：基础配置、一键执行执行、插件、代码补全、语法检查、
"          配色方案、代码折叠、分割窗口等
"""""""""""""""""""""""""

"""""""""""""""""""""""""
"基础配置部分>>>
"""""""""""""""""""""""""
"关闭与vi的兼容模式
set nocompatible
"显示行号
set number
"不自动折行
"set nowrap		
set showmatch		"显示匹配的括号
set scrolloff=3 	"距离顶部和底部3行
set encoding=utf-8	"编码
set fenc=utf-8		"编码
set mouse=a		"启用鼠标
set hlsearch		"搜索高亮
"set t_ti= t_te=		"退出vim后内容显示在终端屏幕
syntax on		"语法高亮
set tabstop=4		"tab宽度

""""""""""""""
"Configure PEP8 Style
""""""""""""""
au BufNewFile,BufRead *.py
\ set tabstop=4	"Width of tab
\ set softtabstop=4
\ set shiftwidth=4
\ set textwidth=79	"Max width of single line
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
	

" Disable the direction table
"map <Left> <Nop>	"“左”键失效
"map <Right> <Nop>	"“右”键失效
"map <Up> <Nop>		"“上”键失效
"map <Down> <Nop>	"“下”键失效
