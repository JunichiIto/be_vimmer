# encoding: UTF-8
namespace :seed do
  desc "Insert Chinese Descriptions"
  task :insert_cn => :environment do
    @lines = <<-EOF.split "\n"
###插入模式
CTRL-@          插入最近插入的文本并停止插入
CTRL-A          插入最近插入的文本
CTRL-B          不用 |i_CTRL-B-gone|
CTRL-C          退出插入模式，不检查缩写，除非置位了'insertmode'。
CTRL-D          在当前行删除一个 shiftwidth 的缩进
CTRL-E          插入光标下方的字符
CTRL-F          不用 (但缺省是 'cinkeys' 中的一项，用以重新缩进本行)
CTRL-G CTRL-J   往下一行，到插入开始的列
CTRL-G j        往下一行，到插入开始的列
CTRL-G <Down>   往下一行，到插入开始的列
CTRL-G CTRL-K   往上一行，到插入开始的列
CTRL-G k        往上一行，到插入开始的列
CTRL-G <Up>     往上一行，到插入开始的列
CTRL-G u        开始新的不可撤消的编辑
<BS>            删除光标前的字符
{char1}<BS>{char2}输入二合字母 (只有打开了 'digraph' 选项才有效)
CTRL-H          等同于 <BS>
<Tab>           插入 <Tab> 字符
CTRL-I          等同于 <Tab>
<NL>            等同于 <CR>
CTRL-J          等同于 <CR>
CTRL-K {char1} {char2}输入二合字母
CTRL-L          'insertmode' 打开时: 离开插入模式
<CR>            开始新行
CTRL-M          等同于 <CR>
CTRL-N          查找光标前面的关键字的下一个匹配
CTRL-O          执行单个命令然后回到插入模式
CTRL-P          查找光标前面的关键字的前一个匹配
CTRL-Q          等同于 CTRL-V，除非它用于终端控制流
CTRL-R {0-9a-z"%#*:=}插入寄存器内容
CTRL-R CTRL-R {0-9a-z"%#*:=}按本义插入寄存器内容
CTRL-R CTRL-O {0-9a-z"%#*:=}按本义插入寄存器内容，而且不自动缩进
CTRL-R CTRL-P {0-9a-z"%#*:=}按本义插入寄存器内容，而且修正缩进
CTRL-S          (用于终端控制流)
CTRL-T          在当前行插入一个 shiftwidth 的缩进
CTRL-U          删除当前行的所有输入字符
CTRL-V {char}   按本义插入下一个非数字字符
CTRL-V {number} 插入三位十进制数字代表的单个字节。
CTRL-W          删除光标前的单词
CTRL-X {mode}   进入 CTRL-X 子模式，见 |i_CTRL-X_index|
CTRL-Y          插入光标上方的字符
CTRL-Z          'insertmode' 打开时: 暂停 Vim
<Esc>           结束插入模式 (除非打开了 'insertmode')
CTRL-[          等同于 <Esc>
CTRL-\ CTRL-N  进入普通模式
CTRL-\ CTRL-G  进入 'insertmode' 指定的模式
CTRL-\ a - z    保留给扩展用
CTRL-\ others   不用
CTRL-]          切换缩写
CTRL-^          切换 |:lmap| 映射的使用
CTRL-_          'allowrevins' 打开时: 改变语言(希伯来语，波斯语等) {仅当编译时加入|+rightleft| 特性才有效}
0 CTRL-D        删除当前行的所有缩进
^ CTRL-D        删除当前行的所有缩进，在下一行恢复删除的缩进
<Del>           删除光标所在的字符
<Left>          光标左移一个字符
<S-Left>        光标左移一个单词
<C-Left>        光标左移一个单词
<Right>         光标右移一个字符
<S-Right>       光标右移一个单词
<C-Right>       光标右移一个单词
<Up>            光标上移一行
<S-Up>          等同于 <PageUp>
<Down>          光标下移一行
<S-Down>        等同于 <PageDown>
<Home>          光标移到行首
<C-Home>        光标移到文件首
<End>           光标移到行尾后面
<C-End>         光标移到文件尾后面
<PageUp>        满屏上滚
<PageDown>      满屏下滚
<F1>            等同于 <Help>
<Help>          停止插入模式显示帮助窗口
<Insert>        切换插入/替换模式
<LeftMouse>     光标移到鼠标点击处
<ScrollWheelDown>       窗口向下滚动三行
<S-ScrollWheelDown>     窗口向下滚动完整一页
<ScrollWheelUp>         窗口向上滚动三行
<S-ScrollWheelUp>       窗口向上滚动完整一页
<ScrollWheelLeft>       窗口向左滚动六列
<S-ScrollWheelLeft>     窗口向左滚动完整一页
<ScrollWheelRight>      窗口向右滚动六列
<S-ScrollWheelRight>   窗口向右滚动完整一页
###子模式的命令
CTRL-X CTRL-D   补全定义过的标识符
CTRL-X CTRL-E   上滚
CTRL-X CTRL-F   补全文件名
CTRL-X CTRL-I   补全标识符
CTRL-X CTRL-K   从字典补全标识符
CTRL-X CTRL-L   补全完整的行
CTRL-X CTRL-N   下一个补全
CTRL-X CTRL-O   全能 (omni) 补全
CTRL-X CTRL-P   上一个补全
CTRL-X CTRL-S   拼写建议
CTRL-X CTRL-T   从同义词词典补全标识符
CTRL-X CTRL-U   用 'completefunc' 补全
CTRL-X CTRL-V   如同 : 命令行那样补全
CTRL-X CTRL-Y   下滚
CTRL-X CTRL-]   补全标签
CTRL-X s        拼写建议
###普通模式
CTRL-@             不用
CTRL-A          2  把 N 加到光标所在/之后的数值上
CTRL-B          1  反向 (Back) 滚动 N 屏
CTRL-C             终止当前的 (搜索) 命令
CTRL-D             向下 (Down) 滚动 N 行 (缺省: 半屏)
CTRL-E             向上滚动 N 行 (附加 (Extra) N 行)
CTRL-F          1  向前 (Forward) 滚动 N 屏
CTRL-G             显示当前文件名和位置
<BS>            1  等同于 "h"
CTRL-H          1  等同于 "h"
<Tab>           1  跳转到跳转表里第 N 个较新的项目
CTRL-I          1  等同于 <Tab>
<NL>            1  等同于 "j"
CTRL-J          1  等同于 "j"
CTRL-K             不用
CTRL-L             重画屏幕
<CR>            1  光标移到 N 行下面的第一个 CHAR
CTRL-M          1  等同于 <CR>
CTRL-N          1  等同于 "j"
CTRL-O          1  跳转到跳转表里第 N 个较旧的项目
CTRL-P          1  等同于 "k"
CTRL-Q             (用于终端控制流)
CTRL-R          2  重做 'u' 撤消的改变
CTRL-S             (用于终端控制流)
CTRL-T             跳转到标签列表的第 N 个较老的标签 (Tag)
CTRL-U             上滚 (Upwards) N 行 (缺省: 半屏)
CTRL-V             开始面向列块的可视 (Visual) 模式
CTRL-W {char}      窗口命令，见 |CTRL-W|
CTRL-X          2  从光标所在/之后的数值上减去 N
CTRL-Y             下滚 N 行
CTRL-Z             暂停程序 (或者启动新的外壳)
CTRL-[ <Esc>       不用
CTRL-\ CTRL-N      进入普通 (Normal) 模式 (空动作)
CTRL-\ CTRL-G      进入 'insertmode' 指定的模式
CTRL-\ a - z       保留作扩展用
CTRL-\ 其它        不用
CTRL-]             :ta 到光标所在的标识符
CTRL-^             编辑第 N 个轮换文件 (等价于 ":e #N")
CTRL-_             不用
<Space>         1  等同于 "l"
!{motion}{filter}2  通过 {filter} 命令过滤 Nmove 文本
!!{filter}      2  通过 {filter} 命令过滤 N 行
"{a-zA-Z0-9.%#:-"}  指定下次删除、抽出或放置使用的寄存器{a-zA-Z0-9.%#:-"} (大写用于添加)({.%#:} 只能用于放置)
#               1  反向搜索第 N 次出现的光标所在的标识符
$               1  光标移动到往下第 N 行的行尾之后
%               1  查找本行下一个 (花/方) 括号，并转到其匹配的括号上，或者转到匹配的注释配对上，或者转到匹配的预处理命令上。
{count}%        1  转到文件的百分之 N 的位置上
&               2  重复上次 :s
'{a-zA-Z0-9}    1  光标移动到位置标记 {a-zA-Z0-9} 所在行的第一个 CHAR 上
''              1  光标移动到最近一次跳转之前所在行的第一个CHAR 上
'(              1  光标移动到当前句子的首部所在行的第一个 CHAR上
')              1  光标移动到当前句子的尾部所在行的第一个 CHAR上
'<              1  光标移动到当前缓冲区高亮区开始/曾经开始的行的第一个 CHAR 上。
'>              1  光标移动到当前缓冲区高亮区结束/曾经结束的行的第一个 CHAR 上。
'[              1  光标移动到当前缓冲区最近操作/放置的文本的首部所在行的第一个 CHAR 上
']              1  光标移动到当前缓冲区最近操作/放置的文本的尾部所在行的第一个 CHAR 上
'{              1  光标移动到当前段落的首部所在行的第一个 CHAR上
'}              1  光标移动到当前段落的尾部所在行的第一个 CHAR上
(               1  光标回退 N 个句子
)               1  光标前进 N 个句子
*               1  正向搜索第 N 次出现的光标所在的标识符
+               1  等同于 <CR>
,               1  反方向重复最近的 f、t、F 或 T N 次
-               1  光标移动到上方 N 行的第一个 CHAR 上
.               2  重复最近的改变，其计数被 N 取代
/{pattern}<CR>  1  正向搜索第 N 次出现的 {pattern}
/<CR>           1  正向搜索最近一次搜索使用的 {pattern}
0               1  光标移动到本行的第一个字符上
1,2,3,4,5,6,7,8,9                  附加于命令前，给出计数
:               1  开始进入 Ex 命令
{count}:           开始进入 Ex 命令，给出从当前行开始到下方N-1 行为止的行范围
;               1  重复最近的 f、t、F 或 T N 次
<{motion}       2  左移 Nmove 文本行一个 'shiftwidth'
<<              2  左移 N 行一个 'shiftwidth'
={motion}       2  通过 "indent" 过滤 Nmove 文本行
==              2  通过 "indent" 过滤 N 行
>{motion}       2  右移 Nmove 文本行一个 'shiftwidth'
>>              2  右移 N 行一个 'shiftwidth'
?{pattern}<CR>  1  反向搜索第 N 次出现的 {pattern}
?<CR>           1  反向搜索最近一次搜索使用的 {pattern}
@{a-z}          2  执行 {a-z} 寄存器的内容 N 次
@:                 重复上次的 ":" 命令 N 次
@@              2  重复上次的 @{a-z} N 次
A               2  在行尾附加文本 N 次
B               1  光标反向移动 N 个 WORD (字串)
["x]C           2  从光标位置到行尾部分，再加上 N-1 行进行修改[到缓冲区 (译者注: 应为寄存器，下同) x]；等价于 "c$"
["x]D           2  删除位置到行尾部分，再加上 N-1 行的字符 [到缓冲区 (见上) x]；等价于 "d$"
E               1  光标正向移动到第 N 个 WORD 的结束处
F{char}         1  光标左移到第 N 次出现的 {char} 上
G               1  光标移动到第 N 行，缺省是最后一行
H               1  光标移动到屏幕顶部开始算的第 N 行
I               2  在本行第一个 CHAR 之前插入文本 N 次
J               2  连接 (Join) N 行；缺省为 2
K                  查找光标所在的关键字 (Keyword)，使用'keywordprg' 的定义
L               1  光标移动到屏幕底部开始算的第 N 行
M               1  光标移动到屏幕的中间一行
N               1  反方向重复最近的 '/' 或 '?' N 次
O               2  在光标上方开始一个新行，并插入文本，重复 N次
["x]P           2  在光标放置文本 [到缓冲区 (见上) x] N 次
Q                  切换到 "Ex" 模式
R               2  进入替换模式: 覆盖存在的字符，重复输入文本N-1 次
["x]S           2  删除 N 行 [到缓冲区 (见上) x]] 并开始输入；等价于 "cc"
T{char}         1  光标移动到左侧第 N 次出现的 {char} 之前
U               2  撤消一行内所有最近的改变
V                  进入面向行的可视 (Visual) 模式
W               1  光标前移 N 个 WORD
["x]X           2  删除光标前的 N 个字符 [到缓冲区 (见上) x]
["x]Y              抽出 N 行 [到缓冲区 (见上) x]；等价于 "yy"
ZZ                 如果修改过，保存当前文件，然后退出
ZQ                 无论如何退出当前文件
[{char}            方括号命令 (见下 |[|)
\                  不用
]{char}            方括号命令 (见下 |]|)
^               1  光标移动到本行的第一个 CHAR 上
_               1  光标移动到下方第 N - 1 行的第一个 CHAR 上
`{a-zA-Z0-9}    1  光标移动到位置标记 {a-zA-Z0-9}
`(              1  光标移动当前句子的开始处
`)              1  光标移动当前句子的结束处
`<              1  光标移动高亮区域的开始处
`>              1  光标移动高亮区域的结束处
`[              1  光标移动最近一次操作/放置的文本的开始处
`]              1  光标移动最近一次操作/放置的文本的结束处
``              1  光标移动最近一次跳转的位置
`{              1  光标移动当前段落的开始处
`}              1  光标移动当前段落的结束处
a               2  在光标处附加文本 N 次
b               1  光标反向移动 N 个单词
["x]c{motion}   2  删除 Nmove 文本 [到缓冲区 (见上) x] 并开始编辑
["x]cc          2  删除 N 行 [到缓冲区 (见上) x] 并开始编辑
["x]d{motion}   2  删除 Nmove 文本 [到缓冲区 (见上) x]
["x]dd          2  删除 N 行 [到缓冲区 (见上) x]]
do              2  等同于 ":diffget"
dp              2  等同于 ":diffput"
e               1  光标正向移动到第 N 个单词的结束处
f{char}         1  光标右移到第 N 次出现的 {char} 上
g{char}            扩展命令，见下 |g|
h               1  光标左移 N 个字符
i               2  在光标前插入文本 N 次
j               1  光标下移 N 行
k               1  光标上移 N 行
l               1  光标右移 N 个字符
m{A-Za-z}          在光标位置处设置位置标记 {A-Za-z}
n               1  重复最近的 '/' 或 '?' N 次
o               2  在光标下方开始一个新行，并插入文本，重复 N次
["x]p           2  在光标后放置文本 [从寄存器 x] N 次
q{0-9a-zA-Z"}      记录输入的字符到命令寄存器 {0-9a-zA-Z"}(大写用于添加)
q                  (在记录时) 停止记录
q:                 在命令行窗口里编辑 : 命令行
q/                 在命令行窗口里编辑 / 命令行
q?                 在命令行窗口里编辑 ? 命令行
r{char}         2  用 {char} 替换 N 个字符
["x]s           2  (替换) 删除 N 个字符 [到缓冲区 (见上) x] 并开始输入
t{char}         1  光标移动到右侧第 N 次出现的 {char} 之前
u               2  撤消改变
v                  开始面向字符的可视 (Visual) 模式
w               1  光标前移 N 个单词
["x]x           2  删除光标开始的 N 个字符 [到缓冲区 (见上) x]
["x]y{motion}      抽出 Nmove 文本 [到缓冲区 (见上) x]
["x]yy             抽出 N 行 [到缓冲区 (见上) x]
z{char}            'z' 开始的命令，见下 |z|
{               1  光标反向移动 N 个段落
|               1  光标移到第 N 列
}               1  光标正向移动 N 个段落
~               2  'tildeop' 关闭时: 切换光标所在处开始的 N 个字符的大小写，并右移光标 N 个字符
~{motion}          'tildeop' 打开时: 切换 Nmove 文本的大小写
<C-End>         1  等同于 "G"
<C-Home>        1  等同于 "gg"
<C-Left>        1  等同于 "b"

<C-LeftMouse>      ":ta" 到鼠标点击所在的单词上
<C-Right>       1  等同于 "w"
<C-RightMouse>    等同于 "CTRL-T"
["x]<Del>       2  等同于 "x"
{count}<Del>       删除 {count} 最后的一位数字
<Down>          1  等同于 "j"
<End>           1  等同于 "$"
<F1>               等同于 <Help>
<Help>             打开帮助窗口
<Home>          1  等同于 "0"
<Insert>        2  等同于 "i"
<Left>          1  等同于 "h"
<LeftMouse>     1  移动光标到鼠标点击处
<MiddleMouse>   2  等同于在鼠标点击处 "gP"
<PageDown>         等同于 CTRL-F
<PageUp>           等同于 CTRL-B
<Right>         1  等同于 "l"
<RightMouse>       开始可视模式，移动光标到鼠标点击处
<S-Down>        1  等同于 CTRL-F
<S-Left>        1  等同于 "b"
<S-LeftMouse>      等同于在鼠标点击处 "*"
<S-Right>       1  等同于 "w"
<S-RightMouse>    等同于在鼠标点击处 "#"
<S-Up>          1  等同于 CTRL-B
<Undo>          2  等同于 "u"
<Up>            1  等同于 "k"
<ScrollWheelDown>       窗口向下滚动三行
<S-ScrollWheelDown>     窗口向下滚动完整一页
<ScrollWheelUp>         窗口向上滚动三行
<S-ScrollWheelUp>       窗口向上滚动完整一页
<ScrollWheelLeft>       窗口向左滚动六列
<S-ScrollWheelLeft>     窗口向左滚动完整一页
<ScrollWheelRight>      窗口向右滚动六列
<S-ScrollWheelRight>    窗口向右滚动完整一页
###文本对象
a"                 双引号字符串
a'                 单引号字符串
a(                 等同于 ab
a)                 等同于 ab
a<                 "一个 <> 块" 从 '<' 到匹配的 '>'
a>                 等同于 a<
aB                 "一个大块" 从 "[{" 到 "]}" (带上括号)
aW                 "一个字串" (带上空白)
a[                 "一个 [] 块" 从 '[' 到匹配的 ']'
a]                 等同于 a[
a`                 反引号字符串
ab                 "一个块" 从 "[(" 到 "])" (带上括号)
ap                 "一个段落" (带上空白)
as                 "一个句子" (带上空白)
at                 "一个标签块" (带上空白)
aw                 "一个单词" (带上空白)
a{                 等同于 aB
a}                 等同于 aB
i"                 双引号字符串，不带引号
i'                 单引号字符串，不带引号
i(                 等同于 ib
i)                 等同于 ib
i<                 "内含 <> 块" 从 '<' 到匹配的 '>'
i>                 等同于 i<
iB                 "内含大块" 从 "[{" 到 "]}"
iW                 "内含字串"
i[                 "内含 [] 块" 从 '[' 到匹配的 ']'
i]                 等同于 i[
i`                 反引号字符串，不带反引号
ib                 "内含块" 从 "[(" 到 "])"
ip                 "内含段落"
is                 "内含句子"
it                 "内含标签块"
iw                 "内含单词"
i{                 等同于 iB
i}                 等同于 iB
###窗口命令
CTRL-W CTRL-B      等同于 "CTRL-W b"
CTRL-W CTRL-C      等同于 "CTRL-W c"
CTRL-W CTRL-D      等同于 "CTRL-W d"
CTRL-W CTRL-F      等同于 "CTRL-W f"
CTRL-W CTRL-G      等同于 "CTRL-W g .."
CTRL-W CTRL-H      等同于 "CTRL-W h"
CTRL-W CTRL-I      等同于 "CTRL-W i"
CTRL-W CTRL-J      等同于 "CTRL-W j"
CTRL-W CTRL-K      等同于 "CTRL-W k"
CTRL-W CTRL-L      等同于 "CTRL-W l"
CTRL-W CTRL-N      等同于 "CTRL-W n"
CTRL-W CTRL-O      等同于 "CTRL-W o"
CTRL-W CTRL-P      等同于 "CTRL-W p"
CTRL-W CTRL-Q      等同于 "CTRL-W q"
CTRL-W CTRL-R      等同于 "CTRL-W r"
CTRL-W CTRL-S      等同于 "CTRL-W s"
CTRL-W CTRL-T      等同于 "CTRL-W t"
CTRL-W CTRL-V      等同于 "CTRL-W v"
CTRL-W CTRL-W      等同于 "CTRL-W w"
CTRL-W CTRL-X      等同于 "CTRL-W x"
CTRL-W CTRL-Z      等同于 "CTRL-W z"
CTRL-W CTRL-]      等同于 "CTRL-W ]"
CTRL-W CTRL-^      等同于 "CTRL-W ^"
CTRL-W CTRL-_      等同于 "CTRL-W _"
CTRL-W +           增加当前窗口高度 N 行
CTRL-W -           减少当前窗口高度 N 行
CTRL-W <           减少当前窗口宽度 N 列
CTRL-W =           使得所有窗口同宽同高
CTRL-W >           增加当前窗口宽度 N 列
CTRL-W H           移动当前窗口到最左端
CTRL-W J           移动当前窗口到最底部
CTRL-W K           移动当前窗口到最顶部
CTRL-W L           移动当前窗口到最右端
CTRL-W P           跳转到预览窗口
CTRL-W R           向上旋转窗口 N 次
CTRL-W S           等同于 "CTRL-W s"
CTRL-W T           移动当前窗口到新标签页
CTRL-W W           跳转到前面第 N 个窗口 (回绕)
CTRL-W ]           分割窗口并跳转到光标所在的标签上
CTRL-W ^           分割窗口并编辑轮换文件 N
CTRL-W _           设置当前窗口高度为 N (缺省: 尽量大)
CTRL-W b           跳转到底部的窗口
CTRL-W c           关闭当前窗口 (类似于 |:close|)
CTRL-W d           分割窗口并跳转到光标所在的定义上
CTRL-W f           分割窗口并跳转到光标所在的文件名上
CTRL-W F           分割窗口并编辑光标所在的文件名，然后跳转到文件名后给出的行号上。
CTRL-W g CTRL-]  分割窗口并在光标所在的标签上执行 |:tjump|
CTRL-W g ]         分割窗口并在光标所在的标签上执行 |:tselect|
CTRL-W g }         在光标所在的标签上执行 |:ptjump|
CTRL-W g f         在新的标签页里编辑光标所在的文件名
CTRL-W g F         在新的标签页里编辑光标所在的文件名然后跳转到文件名后给出的行号上。
CTRL-W h           跳转到左面第 N 个的窗口 (在首个窗口上停止)
CTRL-W i           分割窗口并跳转到光标所在的标识符的声明上
CTRL-W j           跳转到下面第 N 个的窗口 (在最后窗口上停止)
CTRL-W k           跳转到上面第 N 个的窗口 (在首个窗口上停止)
CTRL-W l           跳转到右面第 N 个的窗口 (在最后窗口上停止)
CTRL-W n           打开新窗口，N 行高
CTRL-W o           关闭除了当前窗口以外的所有窗口 (类似于|:only|)
CTRL-W p           转到前面一个 (最近访问的) 窗口
CTRL-W q           退出当前窗口 (类似于 |:quit|)
CTRL-W r           向下旋转窗口 N 次
CTRL-W s           分割当前窗口为两部分，新的窗口 N 行高
CTRL-W t           跳转到顶部窗口
CTRL-W v           垂直分割当前窗口，新的窗口 N 列宽
CTRL-W w           转到后面第 N 个窗口 (回绕)
CTRL-W x           交换当前和第 N 个窗口 (缺省: 下一个窗口)
CTRL-W z           关闭预览窗口
CTRL-W |           设置窗口宽度为 N 列
CTRL-W }           在预览窗口里显示光标所在的标签
CTRL-W <Down>      等同于 "CTRL-W j"
CTRL-W <Up>        等同于 "CTRL-W k"
CTRL-W <Left>      等同于 "CTRL-W h"
CTRL-W <Right>    等同于 "CTRL-W l"
###方括号命令
[ CTRL-D           跳转到第一个在当前文件和它包含的头文件里匹配光标所在的单词的 #define，从当前文件的头部开始
[ CTRL-I           跳转到第一个在当前文件和它包含的头文件里匹配光标所在单词的位置，从当前文件头部开始
[#              1  光标移动到前面第 N 个未匹配的 #if、#else 或者 #ifdef
['              1  光标移动到前面的小写位置标记，定位在它所在行的第一个非空白字符上
[(              1  光标移动到前面第 N 个未匹配的 '('
[*              1  等同于 "[/"
[`              1  光标移动到前一个小写位置标记
[/              1  光标移动到前面第 N 个 C 注释的开始处
[D                 列出在当前文件和它包含的头文件里匹配光标所在的单词的所有定义，从当前文件的头部开始
[I                 列出在当前文件和它包含的头文件里匹配光标所在单词的所有位置，从当前文件的头部开始
[P              2  等同于 "[p"
[[              1  光标后退 N 个小节
[]              1  光标后退 N 个 SECTION
[c              1  光标后退 N 个更改开始的地方
[d                 显示第一个在当前文件和它包含的头文件里匹配光标所在的单词的 #define，从当前文件的头部开始
[f                 等同于 "gf"
[i                 显示第一个在当前文件和它包含的头文件里匹配光标所在单词的位置，从当前文件的头部开始
[m              1  光标后退 N 个成员函数的开始
[p              2  类似于 "P"，但调整当前行的缩进
[s              1  移动到前一个拼写错误的单词
[z              1  移动到打开的折叠的开始
[{              1  光标后退 N 个未匹配的 '{'
[<MiddleMouse>  2  等同于 "[p"
] CTRL-D           跳转到第一个在当前文件和它包含的头文件里匹配光标所在的单词的 #define，从光标位置开始
] CTRL-I           跳转到第一个在当前文件和它包含的头文件里匹配光标所在单词的位置，从光标位置开始
]#              1  光标移动到后面第 N 个未匹配的 #endif、#else
]'              1  光标移动到后面的小写位置标记，定位在它所在行的第一个非空白字符上
](              1  光标移动到后面第 N 个未匹配的 ')'
]*              1  等同于 "]/"
]`              1  光标移动到后一个小写位置标记
]/              1  光标移动到后面第 N 个 C 注释的结尾处
]D                 列出在当前文件和它包含的头文件里匹配光标所在的单词的所有定义，从光标位置开始
]I                 列出在当前文件和它包含的头文件里匹配光标所在单词的所有位置，从光标位置开始
]P              2  等同于 "[p"
]]              1  光标前进 N 个小节
]]              1  光标前进 N 个 SECTION
]c              1  光标前进 N 个更改开始的地方
]d                 显示第一个在当前文件和它包含的头文件里匹配光标所在的单词的 #define，从光标位置开始
]f                 等同于 "gf"
]i                 显示第一个在当前文件和它包含的头文件里匹配光标所在单词的位置，从光标位置开始
]m              1  光标前进 N 个成员函数的结尾
]p              2  类似于 "p"，但调整当前行的缩进
]s              1  移动到后一个拼写错误的单词
]z              1  移动到打开的折叠的结尾处
]{              1  光标前进 N 个未匹配的 '}'
]<MiddleMouse>  2  等同于 "]p"
###'g' 开始的命令
g CTRL-A           只有在编译时加入了 MEM_PROFILE 时才有定义:转储内存内容
g CTRL-G           显示当前光标位置
g CTRL-H           启动选择列块模式
g CTRL-]           |:tjump| 到光标所在的标签上
g#              1  类似于 "#"，但不使用 "\<" 和 "\>"
g$              1  'wrap' 关闭时转到当前行最右侧屏幕上可见的字符'wrap' 打开时转到当前屏幕行最右侧的字符
g&              2  在所有行上重复上次的 ":s"
g'{mark}        1  类似于 |'|，但不改变跳转表
g`{mark}        1  类似于 |`|，但不改表跳转表
g*              1  类似于 "*"，但不使用 "\<" 和 "\>"
g0              1  'wrap' 关闭时转到当前行最左侧屏幕上可见的字符'wrap' 打开时转到当前屏幕行最左侧的字符
g8                 显示光标所在的 UTF-8 字符的十六进制字节码
g<                 显示上次的命令输出
g?              2  Rot13 编码操作符
g??             2  Rot13 编码当前行
g?g?            2  Rot13 编码当前行
gD              1  转到当前文件的光标所在单词的定义
gE              1  反向转移到上一个 WORD 的结尾处
gH                 启动选择行模式
gI              2  类似于 "I"，但总是从第一列开始
gJ              2  连接行，不插入空格
["x]gP          2  在光标签放置文本 [从寄存器 x] N 次，光标留在插入文本之后
gR              2  进入虚拟替换模式
gU{motion}      2  使得 Nmove 文本全部大写
gV                 在执行选择模式下的映射或者菜单时，不要重复选择过去的可视区域
g]                 :tselect 到光标所在的标签上
g^              1  'wrap' 关闭时转到当前行最左侧屏幕上可见的非空白字符'wrap' 打开时转到当前屏幕行最左侧的非空白字符
ga                 打印光标所在处的字符的 ascii 值
gd              1  转到当前函数里当前光标所在的单词的定义
ge              1  反向转到前一个单词的结尾处
gf                 开始编辑当前光标所在的名字对应的文件
gF                 开始编辑光标所在的文件名并跳转到文件名后的行号上。
gg              1  光标移动到第 N 行，缺省是第一行
gh                 开始选择模式
gi              2  类似于 "i"，但先移动到 |'^| 位置标记
gj              1  类似于 "j"，但 'wrap' 打开时往下 N 个屏幕行
gk              1  类似于 "k"，但 'wrap' 打开时往上 N 个屏幕行
gm              1  转到屏幕行正中间的那个字符
go              1  光标移动到缓冲区的第 N 个字节
["x]gp          2  在光标后面放置文本 [从寄存器 x] N 次，光标留在后面
gq{motion}      2  排版 Nmove 文本
gr{char}        2  虚拟替换 N 个字符为 {char}
gs                 睡眠 N 秒 (缺省 1)
gu{motion}      2  使得 Nmove 文本全部小写
gv                 重新选择上次的可视区域
gw{motion}      2  排版 Nmove 文本并保持光标位置
gx                 执行光标下的文件名对应的应用程序 (仅限于|netrw| 插件)
g@{motion}         调用 'operatorfunc'
g~{motion}      2  改变 Nmove 文本的大小写
g<Down>         1  等同于 "gj"
g<End>          1  等同于 "g$"
g<Home>         1  等同于 "g0"
g<LeftMouse>       等同于 <C-LeftMouse>
g<MiddleMouse>     等同于 <C-MiddleMouse>
g<RightMouse>      等同于 <C-RightMouse>
g<Up>           1  等同于 "gk"
###'z' 开始的命令
z<CR>              重画，光标移动到窗口的顶行的第一个非空白字符
z{height}<CR>      重画，使得窗口高度为 {height} 行
z+                 光标移动到第 N 行 (缺省为窗口之后的第一行)，其它同 "z<CR>"
z-                 重画，光标移动到窗口末行的第一个非空白字符
z.                 重画，光标移动到窗口的中间行的第一个非空白字符
z=                 给出拼写建议
zA                 递归打开一个关闭的折叠或关闭一个打开的折叠
zC                 递归关闭折叠
zD                 递归删除折叠
zE                 除去所有折叠
zF                 为 N 行建立折叠
zG                 把单词标记为拼写正确 (good)
zM                 设置 'foldlevel' 为零
zN                 置位 'foldenable'
zO                 递归打开折叠
zR                 设置 'foldlevel' 为最大折叠级别
zW                 把单词标记为拼写错误 (wrong)
zX                 重新应用 'foldlevel'
z^                 光标移动到第 N 行 (缺省为窗口之前的一行)，其它同 "z-"
za                 打开关闭的折叠，或关闭打开的折叠
zb                 重画，光标在窗口底行
zc                 关闭折叠
zd                 删除折叠
ze                 'wrap' 关闭时，水平滚动使得光标定位到屏幕的尾部 (最右侧)
zf{motion}         为 Nmove 文本建立折叠
zg                 把单词标记为拼写正确 (good)
zh                 'wrap' 关闭时，水平右滚屏幕 N 个字符
zi                 切换 'foldenable'
zj              1  移动到下一个折叠的开始处
zk              1  移动到前一个折叠的结束处
zl                 'wrap' 关闭时，水平左滚屏幕 N 个字符
zm                 从 'foldlevel' 减一
zn                 复位 'foldenable'
zo                 打开折叠
zr                 给 'foldlevel' 加一
zs                 'wrap' 关闭时，水平滚动使得光标定位到屏幕的起始处 (最左侧)
zt                 重画，光标移动到窗口的顶部
zw                 把单词标记为拼写错误 (wrong)
zv                 打开足够的折叠，使得当前行可见
zx                 重新应用 'foldlevel' 然后执行 "zv"
zz                 重画，光标移动到窗口的中间行
z<Left>            等同于 "zh"
z<Right>           等同于 "zl"
###可视模式
CTRL-\ CTRL-N    结束可视模式
CTRL-\ CTRL-G    转到 'insertmode' 指定的模式
CTRL-C             结束可视模式
CTRL-G             在可视模式和选择模式间切换
<BS>            2  选择模式: 删除高亮区域
CTRL-H          2  等同于 <BS>
CTRL-O             从选择模式切换到可视模式，只限于下个命令
CTRL-V             使得可视模式面向列块，或者退出可视模式
<Esc>              结束可视模式
CTRL-]             跳转到高亮的标签上
!{filter}       2  通过外部命令 {filter} 过滤高亮行
:                  使用高亮行作为范围，开始一个命令行
<               2  左移高亮行一个 'shiftwidth'
=               2  用 {equalprg} 选项指定的外部程序过滤高亮行
>               2  右移高亮行一个 'shiftwidth'
A               2  列块模式下: 在高亮区域的所有行后附加相同的文本
C               2  删除高亮行，并开始插入
D               2  删除高亮行
I               2  列块模式: 在所有高亮行之前插入相同的文本
J               2  连接高亮行
K                  在高亮区域上运行 'keywordprg'
O                  水平移动到区域的另外一侧
Q                  不启动 Ex 模式
R               2  删除高亮行并开始插入
S               2  删除高亮行并开始插入
U               2  使得高亮区域全变大写
V                  使得可视区域面向行，或者退出可视模式
X               2  删除高亮区域
Y                  抽出高亮行
a"                 扩展高亮区域，使包含一个双引号字符串
a'                 扩展高亮区域，使包含一个单引号字符串
a(                 等同于 ab
a)                 等同于 ab
a<                 扩展高亮区域，使包含一个 <> 块
a>                 等同于 a<
aB                 扩展高亮区域，使包含一个 {} 块
aW                 扩展高亮区域，使包含 "一个 WORD"
a[                 扩展高亮区域，使包含一个 [] 块
a]                 等同于 a[
a`                 扩展高亮区域，使包含一个反引号字符串
ab                 扩展高亮区域，使包含一个 () 块
ap                 扩展高亮区域，使包含一个段落
as                 扩展高亮区域，使包含一个句子
at                 扩展高亮区域，使包含一个标签块
aw                 扩展高亮区域，使包含 "一个单词"
a{                 等同于 aB
a}                 等同于 aB
c               2  删除高亮区域，并开始插入
d               2  删除高亮区域
gJ              2  连接高亮行，不插入空格
gq              2  排版高亮行
gv                 交换现在和以前的高亮区域
i"                 扩展高亮区域，使包含一个双引号字符串 (但不含引号)
i'                 扩展高亮区域，使包含一个单引号字符串 (但不含引号)
i(                 等同于 ib
i)                 等同于 ib
i<                 扩展高亮区域，使包含内含 <> 块
i>                 等同于 i<
iB                 扩展高亮区域，使包含内含 {} 块
iW                 扩展高亮区域，使包含 "内含 WORD"
i[                 扩展高亮区域，使包含内含 [] 块
i]                 等同于 i[
i`                 扩展高亮区域，使包含一个反引号字符串 (但不含反引号)
ib                 扩展高亮区域，使包含内含 () 块
ip                 扩展高亮区域，使包含内含段落
is                 扩展高亮区域，使包含内含句子
it                 扩展高亮区域，使包含内含标签块
iw                 扩展高亮区域，使包含 "内含单词"
i{                 等同于 iB
i}                 等同于 iB
o                  移动光标到区域的另一侧
r               2  删除高亮区域，并开始插入
s               2  删除高亮区域，并开始插入
u               2  使得高亮区域全变小写
v                  使得可视模式面向字符，或者退出可视模式
x               2  删除高亮区域
y                  抽出高亮区域
~               2  改变高亮区域的大小写
###命令行编辑
CTRL-@          不用
CTRL-A          使用光标前面的模式进行补全，并插入所有的匹配
CTRL-B          光标移动到命令行开始的地方
CTRL-C          等同于 <ESC>
CTRL-D          列出光标前面模式的所有补全
CTRL-E          光标移动到命令行结束的地方
CTRL-F          'cedit' 的缺省值: 打开命令行窗口；否则不用
CTRL-G          不用
<BS>            删除光标前面的字符
{char1} <BS> {char2}   'digraph' 打开时，输入二合字母
CTRL-H          等同于 <BS>
<Tab>           如果 'wildchar' 是 <Tab>: 补全光标前面的模式
<S-Tab>         等同于 CTRL-P
'wildchar'      补全光标前面的模式 (缺省: <Tab>)
CTRL-I          等同于 <Tab>
<NL>            等同于 <CR>
CTRL-J          等同于 <CR>
CTRL-K {char1} {char2}输入二合字母
CTRL-L          补全光标前的模式，并插入最长的公共子串
<CR>            执行输入的命令
CTRL-M          等同于 <CR>
CTRL-N          使用 'wildchar' 并有多个匹配: 转到下一个匹配，不然: 等同于 <Down>
CTRL-O          不同
CTRL-P          使用 'wildchar' 并有多个匹配: 转到上一个匹配，不然: 等同于 <Up>
CTRL-Q          等同于 CTRL-V，除非用于终端控制流
CTRL-R {0-9a-z"%#*:= CTRL-F CTRL-P CTRL-W CTRL-A}插入寄存器的内容或特殊对象到光标所在的地方，如同直接输入那样
CTRL-R CTRL-R {0-9a-z"%#*:= CTRL-F CTRL-P CTRL-W CTRL-A}按本义插入寄存器的内容或特殊对象到光标所在的地方
CTRL-S          (用于终端控制流)
CTRL-T          不用
CTRL-U          删除所有字符
CTRL-V          按本义插入下一个非数字字符，或者插入其后三位数字所代表的单个字节。
CTRL-W          删除光标前面的单词
CTRL-X          不用 (保留作补全用)
CTRL-Y          复制 (抽出) 无模式的选择
CTRL-Z          不用 (保留作暂停用)
<Esc>           放弃命令行，不执行
CTRL-[          等同于 <Esc>
CTRL-\ CTRL-N  转到普通模式，放弃命令行
CTRL-\ CTRL-G  转到 'insertmode' 指定的模式，放弃命令行
CTRL-\ a - d    保留给扩展用
CTRL-\ e {expr} 以 {expr} 的结果替换命令行
CTRL-\ f - z    保留给扩展用
CTRL-\ 其它     不用
CTRL-]          激活缩写
CTRL-^          切换 |:lmap| 映射的使用
CTRL-_          'allowrevins'  打开时: 改变语言 (希伯来，波斯)
<Del>           删除光标所在的字符

<Left>          光标左移
<S-Left>        光标左移一个单词
<C-Left>        光标左移一个单词
<Right>         光标右移
<S-Right>       光标右移一个单词
<C-Right>       光标右移一个单词
<Up>            从历史中调入匹配光标前模式的前一个命令行
<S-Up>          从历史中调入前一个命令行
<Down>          从历史中调入匹配光标前模式的后一个命令行
<S-Down>        从历史中调入后一个命令行
<Home>          光标移动到命令行开始的地方
<End>           光标移动到命令行结束的地方
<PageDown>      等同于 <S-Down>
<PageUp>        等同于 <S-Up>
<Insert>        切换插入/替换模式
<LeftMouse>     光标移动到鼠标点击的地方
###EX 命令
:!              过滤行，或可通过外部命令执行之
:!!             重复上次的 ":!" 命令
:#              等同于 ":number"
:&              重复上次的 ":substitute"
:*              执行寄存器的内容
:<              将行左移一个 'shiftwidth'
:=              显示光标所在的行号
:>              将行右移一个 'shiftwidth'
:@              执行寄存器的内容
:@@             重复上次的 ":@"
:N[ext]         转到参数列表的上一个文件
:P[rint]        显示行
:X              请求加密密钥
:a[ppend]       附加文本
:ab[breviate]   输入缩写
:abc[lear]      删除所有的缩写
:abo[veleft]    使得分割的窗口出现在左侧或者上方
:al[l]          为参数列表的每个文件打开一个窗口
:am[enu]        为所有模式输入菜单项
:an[oremenu]    为所有模式输入菜单项，不会被重新映射
:ar[gs]         显示参数列表
:arga[dd]       增加项目到参数列表中
:argd[elete]    从参数列表中删除项目
:arge[dit]      增加项目到参数列表中并编辑之
:argdo          在参数列表上的所有项目上执行一个命令
:argg[lobal]    定义全局参数列表
:argl[ocal]     定义本地参数列表
:argu[ment]     转到参数列表一个指定的文件
:as[cii]        显示光标所在的字符的 ascii 值
:au[tocmd]      输入或者显示自动命令
:aug[roup]      选择要用的自动命令组
:aun[menu]      删除所有模式下的菜单
:b[uffer]       转到缓冲区列表里的特定缓冲区
:bN[ext]        转到缓冲区列表里的上一个缓冲区
:ba[ll]         为缓冲区列表里的每个缓冲区打开一个窗口
:bad[d]         增加缓冲区到缓冲区列表
:bd[elete]      从缓冲区列表删除缓冲区
:be[have]       设置鼠标和选择行为
:bel[owright]   使得分割的窗口出现在右侧或者下方
:bf[irst]       转到缓冲区列表里的第一个缓冲区
:bl[ast]        转到缓冲区列表里的最后一个缓冲区
:bm[odified]    转到缓冲区列表里的下一个修改过的缓冲区
:bn[ext]        转到缓冲区列表里的下一个缓冲区
:bo[tright]     使得分割的窗口出现在最右侧或者下方
:bp[revious]    转到缓冲区列表里的上一个缓冲区
:br[ewind]      转到缓冲区列表里的第一个缓冲区
:brea[k]        跳出 while 循环
:breaka[dd]     增加调试器断点
:breakd[el]     删除调试器断点
:breakl[ist]    列出调试器断点
:bro[wse]       使用文件选择对话框
:bufdo          为所有列表内缓冲区执行命令
:buffers        列出缓冲区列表里的所有文件
:bun[load]      卸载指定的缓冲区
:bw[ipeout]     真正删除一个缓冲区
:c[hange]       替换一行或若干行
:cN[ext]        跳转到上一个错误
:cNf[ile]       跳转到前一个文件的最后一个错误
:ca[bbrev]      类似于 ":abbreviate"，但用于命令行模式
:cabc[lear]     清除所有缩写，用于命令行模式
:caddb[uffer]   通过缓冲区补充错误
:cad[dexpr]     通过表达式补充错误
:caddf[ile]     加入错误信息到当前 quickfix 列表
:cal[l]         调用函数
:cat[ch]        :try 命令的一部分
:cb[uffer]      分析错误信息并跳转到第一个
:cc             跳转到特定的错误
:ccl[ose]       关闭 quickfix 窗口
:cd             改变目录
:ce[nter]       排版行，使其居中对齐
:cex[pr]        从表达式里读取错误并跳转到第一个
:cf[ile]        读入含有错误信息的文件，并跳转到第一个
:cfir[st]       跳转到指定的错误上，缺省为第一个
:cgetb[uffer]   从缓冲区里得到错误
:cgete[xpr]     从表达实里得到错误
:cg[etfile]     读入含有错误信息的文件
:cha[nges]      显示修改的列表
:chd[ir]        改变当前目录
:che[ckpath]    列出包含的头文件
:checkt[ime]    检查载入缓冲区的时间标签
:cl[ist]        列出所有错误
:cla[st]        跳转到指定的错误上，缺省为最后一个
:clo[se]        改变当前窗口
:cm[ap]         类似于 ":map"，但用于命令行模式
:cmapc[lear]    清除所有映射，用于命令行模式
:cme[nu]        为命令行模式增加菜单
:cn[ext]        跳转到下一个错误
:cnew[er]       跳转到下一个较新的错误列表
:cnf[ile]       跳转到下一个文件的第一个错误
:cno[remap]     类似于 ":noremap"，但用于命令行模式
:cnorea[bbrev]  类似于 ":noreabbrev"，但用于命令行模式
:cnoreme[nu]    类似于 ":noremenu"，但用于命令行模式
:co[py]         复制行
:col[der]       跳转到上一个较老的错误列表
:colo[rscheme]  载入特定的色彩方案
:com[mand]      建立用户自定的命令
:comc[lear]     清除所有用户自定的命令
:comp[iler]     为特定编译器设定选项
:con[tinue]     回到 :while 开始处
:conf[irm]      需要确认时，提示用户
:cope[n]        打开 quickfix 窗口
:cp[revious]    跳转到上一个错误
:cpf[ile]       跳转到上一个文件的最后一个错误
:cq[uit]        退出 Vim，带错误码
:cr[ewind]      跳到指定的错误，缺省为第一个
:cs[cope]       执行 cscope 命令
:cst[ag]        使用 cscope 来跳转到标签上
:cu[nmap]       类似于 ":unmap"，但用于命令行模式
:cuna[bbrev]    类似于 ":unabbrev"，但用于命令行模式
:cunme[nu]      删除命令行的菜单
:cw[indow]      打开或者关闭 quickfix 窗口
:d[elete]       删除行
:delm[arks]     删除位置标记
:deb[ug]        在调试模式执行命令
:debugg[reedy]  从正常的输入那里读取调试模式命令
:delc[ommand]   删除用户自定的命令
:delf[unction]  删除用户函数
:dif[fupdate]   更新 'diff' 缓冲区
:diffg[et]      删除当前缓冲区的所有差异
:diffo[ff]      关闭 diff 模式
:diffp[atch]    应用补丁然后显示差异
:diffpu[t]      删除另外一个缓冲区的差异
:diffs[plit]    显示和另外一个文件的差异
:diffthis       使得当前窗口成为 diff 窗口
:dig[raphs]     显示或者输入二合字母
:di[splay]      显示寄存器
:dj[ump]        跳转到 #define
:dl[ist]        列出所有的 #define
:do[autocmd]    在当前缓冲区应用自动命令
:doautoa[ll]    在所有载入的缓冲区上应用自动命令
:dr[op]         跳到编辑某文件的窗口，不成功则在当前窗口编辑之
:ds[earch]      列出一个 #define
:dsp[lit]       分割窗口并跳转到 #define
:e[dit]         编辑文件
:ea[rlier]      回到旧的改变，撤销
:ec[ho]         回显表达式结果
:echoe[rr]      类似于 :echo，如同错误一样显示和使用历史
:echoh[l]       为 echo 等命令设置高亮
:echom[sg]      等同于 :echo，在历史里放置消息
:echon          等同于 :echo，但不留 <EOL>
:el[se]         :if 命令的一部分
:elsei[f]       :if 命令的一部分
:em[enu]        按名字执行菜单
:en[dif]        结束最近的 :if
:endfo[r]       结束最近的 :for
:endf[unction]  结束用户函数
:endt[ry]       结束最近的 :try
:endw[hile]     结束最近的 :while
:ene[w]         编辑新的无名缓冲区
:ex             等同于 ":edit"
:exe[cute]      执行表达式的结果产生的字符串
:exi[t]         等同于 ":xit"
:exu[sage]      Ex 命令总览
:f[ile]         显示或者设置当前文件名
:files          列出缓冲区列表的所有文件
:filet[ype]     切换文件类型检测的打开/关闭
:fin[d]         在 'path' 里找寻文件并编辑之
:fina[lly]      :try 命令的一部分
:fini[sh]       退出 Vim 脚本的执行
:fir[st]        转到参数列表的第一个文件
:fix[del]       设置 <Del> 的键码
:fo[ld]         创建折叠
:foldc[lose]    关闭折叠
:foldd[oopen]   对所有不在关闭折叠的行执行命令
:folddoc[losed] 对所有在关闭折叠的行执行命令
:foldo[pen]     打开折叠
:for            for 循环
:fu[nction]     定义用户函数
:g[lobal]       对匹配的行执行命令
:go[to]         转到缓冲区某字节处
:gr[ep]         执行 'grepprg' 并转到第一个匹配处
:grepa[dd]      类似 :grep，但附加到当前列表后
:gu[i]          启动 GUI
:gv[im]         启动 GUI
:ha[rdcopy]     发送文本到打印机
:h[elp]         打开帮助窗口
:helpf[ind]     打开显示帮助窗口的对话框
:helpg[rep]     类似于 ":grep"，但搜索帮助文件
:helpt[ags]     为一个目录产生帮助标签
:hi[ghlight]    指定高亮方法
:hid[e]         为一个命令隐藏当前缓冲区
:his[tory]      显示历史列表
:i[nsert]       插入文本
:ia[bbrev]      类似于 ":abbrev"，但用于插入模式
:iabc[lear]     类似于 ":abclear"，但用于插入模式
:if             条件满足时执行命令
:ij[ump]        跳转到标识符的定义
:il[ist]        列出匹配标识符的行
:im[ap]         类似于 ":map"，但用于插入模式
:imapc[lear]    类似于 ":map"，但用于插入模式
:ime[nu]        为插入模式增加菜单
:ino[remap]     类似于 ":noremap"，但用于插入模式
:inorea[bbrev]  类似于 ":noreabbrev"，但用于插入模式
:inoreme[nu]    类似于 ":noremenu"，但用于插入模式
:int[ro]        显示介绍文字
:is[earch]      列出匹配标识符的一行
:isp[lit]       分割窗口，并跳转到标识符的定义
:iu[nmap]       类似于 ":unmap"，但用于插入模式
:iuna[bbrev]    类似于 ":unabbrev"，但用于插入模式
:iunme[nu]      删除插入模式的菜单
:j[oin]         连接行
:ju[mps]        显示跳转表
:k              设置位置标记
:keepa[lt]      跟随的命令保持轮换文件不变
:kee[pmarks]    跟随的命令保持位置标记不变
:keepj[jumps]   跟随的命令保持跳转表和位置标记不变
:lN[ext]        转到位置列表的上一个位置
:lNf[ile]       转到上个文件的最近一个位置
:l[ist]         显示行
:lad[dexpr]     通过表达式补充位置
:laddb[uffer]   通过缓冲区补充位置
:laddf[ile]     把位置加到当前位置列表里
:la[st]         转到参数列表的最后一个文件
:lan[guage]     设置语言 (locale)
:lat[er]        转到新的改变，重做
:lb[uffer]      分析位置并跳转到第一个位置
:lc[d]          改变本地的目录
:lch[dir]       改变本地的目录
:lcl[ose]       关闭位置窗口
:lcs[cope]      类似于 ":cscope"，但使用位置列表
:le[ft]         左对齐行
:lefta[bove]    使得分割的窗口出现在左侧或者上方
:let            给变量或选项赋值
:lex[pr]        从表达式里读取位置并跳转到第一个
:lf[ile]        从文件里读取位置并跳转到第一个
:lfir[st]       转到指定的位置上，缺省第一个
:lgetb[uffer]   从缓冲区里读取位置
:lgete[xpr]     从表达式里读取位置
:lg[etfile]     从文件里读取位置
:lgr[ep]        运行 'grepprg' 并跳转到第一个匹配
:lgrepa[dd]     类似于 :grep，但附加到当前列表上
:lh[elpgrep]    类似于 ":helpgrep"，但使用位置列表
:ll             转到指定位置
:lla[st]        转到指定位置，缺省最后一个
:lli[st]        列出所有的位置
:lmak[e]        执行外部命令 'makeprg' 并分析错误信息
:lm[ap]         类似于 ":map!"，但包括 Lang-Arg 模式
:lmapc[lear]    类似于 ":mapclear!"，但包括 Lang-Arg 模式
:lne[xt]        跳到下一个位置
:lnew[er]       跳到较新的位置列表
:lnf[ile]       跳到下一个文件的第一个位置
:ln[oremap]     类似于 ":noremap!"，但包括 Lang-Arg 模式
:loadk[eymap]   载入后面的键盘映射表，直到 EOF 为止
:lo[adview]     从文件里为当前窗口载入视图
:loc[kmarks]    跟随的命令保持位置标记不变
:lockv[ar]      给变量加锁
:lol[der]       转到较旧的位置列表
:lope[n]        打开位置窗口
:lp[revious]    转到前一个位置
:lpf[ile]       转到上一个文件的最近的位置
:lr[ewind]      转到指定的位置，缺省第一个
:ls             列出所有的缓冲区
:lt[ag]         跳转到标签，并把匹配的标签加到位置列表上
:lu[nmap]       类似于 ":unmap!"，但包括 Lang-Arg 模式
:lua            执行 |Lua| 命令
:luad[o]        对每行都执行 Lua 命令
:luaf[ile]      执行 |Lua| 脚本文件
:lv[imgrep]     在若干文件里搜索模式
:lvimgrepa[dd]  类似于 :vimgrep，但附加到当前列表
:lw[indow]      打开或关闭位置窗口
:m[ove]         移动行
:ma[rk]         设置位置标记
:mak[e]         执行外部命令 'makeprg' 并分析其错误信息
:map            显示或者输入映射
:mapc[lear]     清除所有普通和可视模式的映射
:marks          列出所有的位置标记
:mat[ch]        定义要高亮显示的匹配的模式
:me[nu]         输入新的菜单项
:menut[ranslate] 增加菜单翻译项目
:mes[sages]     显示以前显示的消息
:mk[exrc]       写入当前映射和设置到文件
:mks[ession]    写入会话信息到文件
:mksp[ell]      生成 .spl 拼写文件
:mkv[imrc]      写入当前映射和设置到文件
:mkvie[w]       写入当前窗口的视图到文件
:mod[e]         显示或者改变屏幕模式
:mz[scheme]     执行 MzScheme 命令
:mzf[ile]       执行 MzScheme 脚本文件
:nbc[lose]      关闭当前 Netbeans 会话
:nb[key]        传递一个键给 Netbeans
:nbs[art]       打开一个新的 Netbeans 会话
:n[ext]         跳转到参数列表的下一个文件
:new            创建一个新的空白窗口
:nm[ap]         类似于 ":map"，但使用普通模式
:nmapc[lear]    清除普通模式的所有映射
:nme[nu]        为普通模式增加菜单
:nn[oremap]     类似于 ":noremap"，但使用普通模式
:nnoreme[nu]    类似于 ":noremenu"，但使用普通模式
:noa[utocmd]    跟随的命令不激活自动命令
:no[remap]      输入不会被重新映射的映射
:noh[lsearch]   暂停 'hlsearch' 高亮
:norea[bbrev]   输入不会被重新映射的缩写
:noreme[nu]     输入不会被重新映射的菜单
:norm[al]       执行普通模式的命令
:nu[mber]       显示文本行时给出行号
:nun[map]       类似于 ":unmap"，但使用普通模式
:nunme[nu]      删除普通模式的菜单
:ol[dfiles]     列出 viminfo 文件中包含位置标记的文件
:o[pen]         启动打开模式 (没有实现)
:om[ap]         类似于 ":map"，但使用操作符等待模式
:omapc[lear]    删除操作符等待模式的所有映射
:ome[nu]        为操作符等待模式增加菜单
:on[ly]         关闭当前窗口，除了当前的窗口以外
:ono[remap]     类似于 ":noremap"，但使用操作符等待模式
:onoreme[nu]    类似于 ":noremenu"，但使用操作符等待模式
:opt[ions]      打开选项窗口
:ou[nmap]       类似于 ":unmap"，但使用操作符等待模式
:ounme[nu]      删除操作符等待模式的菜单
:ow[nsyntax]    为本窗口设置新的局部语法高亮
:p[rint]        显示行
:profd[el]      停止剖视 (profile) 函数或脚本
:prof[ile]      剖视 (profile) 函数或脚本
:pro[mptfind]   打开 GUI 对话框进行搜索
:promptr[epl]   打开 GUI 对话框进行搜索/替代
:pc[lose]       关闭预览窗口
:ped[it]        在预览窗口编辑文件
:pe[rl]         执行 Perl 命令
:perld[o]       对每行都执行 Perl 命令
:po[p]          跳转到标签栈较旧的项目上
:pop[up]        根据名字弹出菜单
:pp[op]         在预览窗口 ":pop"
:pre[serve]     写入所有文本到交换文件
:prev[ious]     跳转到参数列表里的上一个文件
:ps[earch]      类似于 ":ijump"，但在预览窗口显示匹配
:pt[ag]         在预览窗口显示标签
:ptN[ext]       在预览窗口 |:tNext|
:ptf[irst]      在预览窗口 |:trewind|
:ptj[ump]       在预览窗口 |:tjump| 和显示标签
:ptl[ast]       在预览窗口 |:tlast|
:ptn[ext]       在预览窗口 |:tnext|
:ptp[revious]   在预览窗口 |:tprevious|
:ptr[ewind]     在预览窗口 |:trewind|
:pts[elect]     在预览窗口 |:tselect| 和显示标签
:pu[t]          插入寄存器的内容到文本
:pw[d]          显示当前目录
:py3            执行 Python 3 命令
:python3        同 :py3
:py3f[ile]      执行 Python 3 脚本文件
:py[thon]       执行 Python 命令
:pyf[ile]       执行 Python 脚本文件
:q[uit]         退出当前窗口 (如果只有一窗口，则退出 Vim)
:quita[ll]      退出 Vim
:qa[ll]         退出 Vim
:r[ead]         读入文件到文本
:rec[over]      从交换文件里恢复文件
:red[o]         重做一次撤销的改变
:redi[r]        重定向消息到文件或者寄存器
:redr[aw]       强迫显示的重画
:redraws[tatus] 强迫状态行的重画
:reg[isters]    显示寄存器的内容
:res[ize]       改变当前窗口的高度
:ret[ab]        改变制表大小
:retu[rn]       从用户函数返回
:rew[ind]       转到参数列表的第一个文件
:ri[ght]        右对齐文本
:rightb[elow]   使得分割窗口出现在右侧或者下方
:rub[y]         执行 Ruby 命令
:rubyd[o]       对每行执行 Ruby 命令
:rubyf[ile]     执行 Ruby 脚本文件
:rund[o]        从文件里读入撤销信息
:ru[ntime]      执行 'runtimepath' 里的 vim 脚本
:rv[iminfo]     读取 viminfo 文件
:s[ubstitute]   查找和替代文本
:sN[ext]        分割窗口并转到参数列表的前一个文件
:san[dbox]      在沙盘里执行命令
:sa[rgument]    分割窗口并转到参数列表的某一个文件
:sal[l]         为参数列表的每个文件打开窗口
:sav[eas]       用别的名字保存文件。
:sb[uffer]      分割窗口并转到缓冲区列表的某一个文件
:sbN[ext]       分割窗口并转到缓冲区列表的前一个文件
:sba[ll]        为缓冲区列表的每个文件打开窗口
:sbf[irst]      分割窗口并转到缓冲区列表的第一个文件
:sbl[ast]       分割窗口并转到缓冲区列表的最后一个文件
:sbm[odified]   分割窗口并转到缓冲区列表的修改过的文件
:sbn[ext]       分割窗口并转到缓冲区列表的后一个文件
:sbp[revious]   分割窗口并转到缓冲区列表的前一个文件
:sbr[ewind]     分割窗口并转到缓冲区列表的第一个文件
:scrip[tnames]  列出所有执行过的 Vim 脚本的名字
:scripte[ncoding]     执行过的 Vim 脚本使用的编码
:scs[cope]      分割窗口并执行 cscope 命令
:se[t]          显示或设置选项
:setf[iletype]  设置 'filetype'，除非已经设置过
:setg[lobal]    显示或者设置全局选项值
:setl[ocal]     显示或者设置本地选项值
:sf[ind]        分割当前窗口并编辑 'path' 的文件
:sfir[st]       分割窗口并转到参数列表的第一个文件
:sh[ell]        退到外壳程序
:sim[alt]       Win32 GUI: 模拟 Windows ALT 键
:sig[n]         操作标号
:sil[ent]       安静地运行命令
:sl[eep]        几秒内不作任何事
:sla[st]        分割窗口并转到参数列表的最后一个文件
:sm[agic]       带 'magic' 的 :substitute
:sma[p]         类似于 ":map"，但用于选择模式
:smapc[lear]    删除选择模式所有的映射
:sme[nu]        增加选择模式菜单
:sn[ext]        分割窗口并转到参数列表的下一个文件
:sni[ff]        发送请求到 sniff
:sno[magic]     带 'nomagic' 的 :substitute
:snor[emap]     类似于 ":noremap"，但用于选择模式
:snoreme[nu]    类似于 ":noremenu"，但用于选择模式
:sor[t]         给行排序
:so[urce]       从文件里读取 Vim 或 Ex 命令
:spelld[ump]    分割窗口并用正确的单词填充
:spe[llgood]    增加拼写的好词
:spelli[nfo]    显示载入的拼写文件的信息
:spellr[epall]  像上次 |z=| 那样，但替换所有的坏词
:spellu[ndo]    删除好词或坏词
:spellw[rong]   增加拼写错误
:sp[lit]        分割当前窗口
:spr[evious]    分割窗口并转到参数列表的前一个文件
:sre[wind]      分割窗口并转到参数列表的第一个文件
:st[op]         暂停编辑器并退回外壳
:sta[g]         分割窗口并跳转到标签上
:startg[replace] 开始虚拟替换模式
:startr[eplace] 开始替换模式
:star[tinsert]  开始插入模式
:stopi[nsert]   退出插入模式
:stj[ump]       执行 ":tjump" 并分割窗口
:sts[elect]     执行 ":tselect" 并分割窗口
:sun[hide]      等同于 ":unhide"
:sunm[ap]       类似于 ":unmap"，但用于选择模式
:sunme[nu]      删除选择模式的菜单
:sus[pend]      等同于 ":stop"
:sv[iew]        分割窗口并以只读模式编辑文件
:sw[apname]     显示当前交换文件的名字
:sy[ntax]       语法高亮
:sync[bind]     同步滚动绑定
:t              等同于 ":copy"
:tN[ext]        跳转到上一个匹配的标签
:tabN[ext]      跳到上一个标签页
:tabc[lose]     关闭当前标签页
:tabdo          为每个标签页执行命令
:tabe[dit]      在新标签页里编辑文件
:tabf[ind]      寻找 'path' 里的文件，在新标签页里编辑之
:tabfir[st]     转到第一个标签页
:tabl[ast]      转到最后一个标签页
:tabm[ove]      把标签页移到别的位置
:tabnew         在新标签页里编辑文件
:tabn[ext]      转到下一个标签页
:tabo[nly]      关闭所有除了当前标签页以外的所有标签页
:tabp[revious]  转到前一个标签页
:tabr[ewind]    转到第一个标签页
:tabs           列出标签页以及里面包含的内容
:tab            打开新窗口时建立新的标签页
:ta[g]          跳转到标签上
:tags           显示标签栈的内容
:tc[l]          执行 Tcl 命令
:tcld[o]        为每行执行 Tcl 命令
:tclf[ile]      执行 Tcl 脚本文件
:te[aroff]      撕下一个菜单
:tf[irst]       转到第一个匹配的标签
:th[row]        抛出例外
:tj[ump]        类似于 ":tselect"，只有一个匹配时直接跳转之
:tl[ast]        跳转到最后一个匹配的标签
:tm[enu]        定义菜单的工具提示
:tn[ext]        跳转到下一个匹配的标签
:to[pleft]      使得分割的窗口出现在顶部或者最左端
:tp[revious]    跳转到上一个匹配的标签
:tr[ewind]      跳转到第一个匹配的标签
:try            执行命令，错误或者例外时终止
:ts[elect]      列出匹配的标签并从中选择一个
:tu[nmenu]      删除菜单的工具提示
:u[ndo]         撤销最近的改变
:undoj[oin]     将下一个改变和上一个撤销块合并
:undol[ist]     列出撤销树的叶结点
:una[bbreviate] 删除缩写
:unh[ide]       为缓冲区列表里每个载入的文件打开窗口
:unl[et]        删除变量
:unlo[ckvar]    给变量解锁
:unm[ap]        删除映射
:unme[nu]       删除菜单
:uns[ilent]     非安静模式执行命令
:up[date]       如果有修改，写回缓冲区
:v[global]      对不匹配的行，执行命令
:ve[rsion]      显示版本号和其它信息
:verb[ose]      执行命令，过程中设置 'verbose'
:vert[ical]     使得跟随的命令垂直分割
:vim[grep]      在若干文件里查找模式
:vimgrepa[dd]   类似于 :vimgrep，但附加到当前列表
:vi[sual]       等同于 ":edit"，但关掉 "Ex" 模式
:viu[sage]      普通模式命令的总览
:vie[w]         以只读方式编辑文件
:vm[ap]         类似于 ":map"，但使用可视+选择模式
:vmapc[lear]    删除可视+选择模式所有的映射
:vme[nu]        为可视+选择模式增加菜单
:vne[w]         建立新的空白窗口，垂直分割
:vn[oremap]     类似于 ":noremap"，但使用可视+选择模式
:vnoreme[nu]    类似于 ":noremenu"，但使用可视+选择模式
:vs[plit]       垂直分割当前窗口
:vu[nmap]       类似于 ":unmap"，但使用可视+选择模式
:vunme[nu]      删除可视+选择模式的菜单
:windo          为每个窗口执行命令
:w[rite]        写回文件
:wN[ext]        写回文件，然后跳转到参数列表的前一个文件
:wa[ll]         写回所有 (改变的) 缓冲区
:wh[ile]        只要条件满足，执行循环体
:wi[nsize]      取得或者设置窗口大小 (已废弃)
:winc[md]       执行窗口 (CTRL-W) 命令
:winp[os]       取得或者设置窗口位置
:wn[ext]        写回文件，然后跳转到参数列表的下一个文件
:wp[revious]    写回文件，然后跳转到参数列表的前一个文件
:wq             写回文件，然后退出窗口或者 Vim
:wqa[ll]        写回所有 (改变的) 缓冲区然后退出 Vim
:ws[verb]       把动词通过 IPC 发送给 workshop
:wu[ndo]        把撤销信息写入文件
:wv[iminfo]     写入 viminfo 文件
:x[it]          如果缓冲区被改动，写入之。然后退出窗口或者 Vim
:xa[ll]         等同于 ":wqall"
:xmapc[lear]    删除可视模式的所有映射
:xm[ap]         类似于 ":map"，但使用可视模式
:xme[nu]        增加可视模式的菜单
:xn[oremap]     类似于 ":noremap"，但使用可视模式
:xnoreme[nu]    类似于 ":noremenu"，但使用可视模式
:xu[nmap]       类似于 ":unmap"，但使用可视模式
:xunme[nu]      删除可视模式的菜单
:y[ank]         抽出行到寄存器
:z              显示一些行
EOF

    @lines.each do |line|
      if /^###/ =~ line
        label = line.sub /###/, ""
        @mode = Mode.where(label: label).first_or_create!
      elsif m = /^(?<command>([\x21-\x7e]+ ?)+)(?<desc>.+)/.match(line)
        command = m["command"].strip
        desc = m["desc"].strip
        desc = desc.sub(/^\d +/, "")
        if desc.strip.empty? || /^未使用/ =~ desc
          next
        end
        puts "Mode: #{@mode.label} Create Command:#{command} - #{desc}"
        @mode.vim_commands.create! command: command, description: desc, language: 'en'
      end
    end
  end
end
