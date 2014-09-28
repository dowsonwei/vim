set nocompatible
source $VIMRUNTIME/vimrc_example.vim
source $VIMRUNTIME/mswin.vim
behave mswin
set diffexpr=MyDiff()
function MyDiff()
  let opt = '-a --binary '
  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
  let arg1 = v:fname_in
  if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
  let arg2 = v:fname_new
  if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
  let arg3 = v:fname_out
  if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
  let eq = ''
  if $VIMRUNTIME =~ ' '
    if &sh =~ '\<cmd'
      let cmd = '""' . $VIMRUNTIME . '\diff"'
      let eq = '"'
    else
      let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
    endif
  else
    let cmd = $VIMRUNTIME . '\diff'
  endif
  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3 . eq
endfunction

set rtp+=$VIM/vimfiles/bundle/vundle/
call vundle#rc('$VIM/vimfiles/bundle/')
Bundle 'gmarik/vundle'
Bundle 'FixCSS.vim'
Bundle 'Yggdroot/indentLine'        
Bundle 'Lokaltog/vim-powerline'
filetype plugin indent on       " automatically detect file types.
"�ֵ��·��
au FileType html call AddhtmlFuncList()
au FileType javascript call AddJSFuncList()
au FileType css call AddcssFuncList()
function AddhtmlFuncList()
    set dictionary-=$VIM/ExtraVim/html.txt dictionary+=$VIM/ExtraVim/html.txt
    set complete-=k complete+=k
endfunction
function AddJSFuncList()
    set dictionary-=$VIM/ExtraVim/javascript.txt dictionary+=$VIM/ExtraVim/javascript.txt
    set complete-=k complete+=k
endfunction
function AddcssFuncList()
    set dictionary-=$VIM/ExtraVim/css.txt dictionary+=$VIM/ExtraVim/css.txt
    set complete-=k complete+=k
endfunction

"�������
" ������ʾ�����ߣ��� indent_guides ����ʾ��ʽ�ϲ�ͬ�������Լ�ϲ��ѡ����
" ���ն��ϻ�����Ļˢ�µ����⣬��������ܽ���и�����
" ����/�رն�����
nmap <leader>il :IndentLinesToggle<CR>
" ����Gvim�Ķ�������ʽ
" �����ն˶�������ɫ�������ϲ�����Խ���ע�͵�����Ĭ����ɫ
let g:indentLine_color_term = 239
" ���� GUI ��������ɫ�������ϲ�����Խ���ע�͵�����Ĭ����ɫ
" let g:indentLine_color_gui = '#A4E57E'

winpos 220 10 " ���ó�ʼ���ڵ�����λ�ã���������Ͻǵ�����{x} {y}
set clipboard+=unnamed   "��windows����������
"set lines=29 columns=140 "������������
au GUIEnter * simalt ~x         "��������ʱ�Զ����
"set textwidth=135
set wrapmargin=2   
set formatoptions+=mM   "�����˳���������Զ�����
set wrap  "nowrap�ǲ��Զ�����  
set guifont=Consolas:h13:cANSI "����Ӣ������
set autowrite   "һ���޸��Զ�����
set linespace=0 "�ַ����
set ruler " ��״̬�����
set magic " ��ħ��
"set scrolloff=3 " ����ƶ�������/�ײ�ʱ����3�о���
"set cursorline  "�������������
set nu
color desert
set ls=2
set showcmd
set autoindent
set paste
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab		"expandtabѡ����������Ƿ�Tabת��Ϊ�ո�
set encoding=utf-8
set langmenu=zh_CN.utf-8
set fileencodings=utf-8,ucs-bom,gb18030,gbk,gb2312,cp936
set termencoding=utf-8
set encoding=utf-8              "ʶ���������
language messages zh_CN.utf-8       "����consle�������
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim          "�����˵����Ҽ��˵�����      
let Tlist_Ctags_Cmd = 'E:\software\vim\vim\ctags58\ctags.exe'
let g:winManagerWindowLayout = "TagList|FileExplorer"
nmap wm :WMToggle<cr>
nmap <silent> <F8> :WMToggle<cr>	"��ߵ�Ŀ¼�ĵ�
" ������list���ܣ���ʾ���ɼ��ַ�
"set list
" ����Ϊ>-��ʽ,��$��β
"set listchars=tab:\|\
"�����л�
nnoremap <C-h> <C-W>h
nnoremap <C-j> <C-W>j
nnoremap <C-k> <C-W>k
nnoremap <C-l> <C-W>l
"�ڱ༭ģʽ�������ƶ�
noremap <c-j> <c-e> 	"ʹctrl j���ctrl e���������»���
noremap <c-k> <c-y>	"ʹctrl k���ctrl y���������ϻ���
noremap <Down> <c-e> 	"ʹctrl j���ctrl e���������»���
noremap <Up> <c-y>	"ʹctrl k���ctrl y���������ϻ���
"set cmdheight=2         "���������еĸ߶�Ϊ2��Ĭ��Ϊ1
set shortmess=atI       "ȥ����ӭ����
"set foldenable     	"�����۵�
"set foldmethod=indent     "indent �۵���ʽ
" �ÿո���������۵�
"nnoremap <space> @=((foldclosed(line('.')) < 0) ? 'zc' : 'zo')<CR>
"�任����������ʾ���
set guioptions-=m
set guioptions-=T
map <silent> <F2> :if &guioptions =~# 'T' <Bar>
\set guioptions-=T <Bar>
        \set guioptions-=m <bar>
    \else <Bar>
        \set guioptions+=T <Bar>
        \set guioptions+=m <Bar>
    \endif<CR>
" ����ģʽ�Ĺ�����������ƶ�
imap <c-k> <Up>
imap <c-j> <Down>
imap <c-h> <Left>
imap <c-l> <Right>
"����ƥ��
inoremap ( ()<ESC>i
inoremap [ []<ESC>i
inoremap { {}<ESC>i
inoremap < <><ESC>i
inoremap " ""<ESC>i
" F9 һ�����沢����
nmap <F9> :w<CR>
imap <F9> <ESC>:w<CR>
"alt + l����h�л���ͬtab���������tab����
nmap <a-h> :tabp<CR>
nmap <a-l> :tabn<CR>
nmap <a-n> :tabnew<CR>
"�鿴���еı��
nmap <a-m> :marks<CR>
imap <a-m> <ESC>:marks<CR>
"�۵�����
nmap <a-j> $zf%
"nmap <a-j> 0%$zf%
"������ѡ��ģʽ
nmap <a-r> <s-v><c-q>
"�滻���ʣ�ѡ��Ҫ�滻�Ĵʣ�Ȼ���a�Ĵ�����ճ�����ʳ���
nmap <a-y> "ayw
nmap <a-p> ve"ap
"�رյ�ǰ��ǩ
nmap <a-q> :q<CR>