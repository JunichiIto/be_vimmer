# encoding: UTF-8
namespace :seed do
  desc "Insert Traditional Chinese Descriptions"
  task :insert_tw => :environment do
    ActiveRecord::Base.transaction do
      language = 'tw'
      VimCommand.where(language: language).destroy_all
      mode = nil
      lines.each do |line|
        if /^###/ =~ line
          label = line.sub /###/, ""
          mode = Mode.where(label: label).first_or_create!
        elsif m = /^(?<command>([\x21-\x7e]+ ?)+)(?<desc>.+)/.match(line)
          command = m["command"].strip
          desc = m["desc"].strip
          desc = desc.sub(/^\d +/, "")
          if desc.strip.empty? || /^無作用/ =~ desc
            next
          end
          puts "Mode: #{mode.label} Create Command:#{command} - #{desc}"
          mode.vim_commands.create! command: command, description: desc, language: language
        end
      end
    end
  end
  
  def lines
    <<-EOF.split "\n"
###插入模式
CTRL-@          插入最近插入的文字並停止插入。
CTRL-A          插入最近插入的文字。
CTRL-B          無作用 |i_CTRL-B-gone|。
CTRL-C          退出插入模式，不檢查縮寫，除非置位了'insertmode'。
CTRL-D          在該行刪除一個 shiftwidth 的縮排。
CTRL-E          插入游標下方的字元。
CTRL-F          無作用 (但預設是 'cinkeys' 中的一項，用以重新縮排本行)。
CTRL-G CTRL-J   將游標往下移動一行 (等同於在編輯模式中按下 <Down> 鍵)。
CTRL-G j        將游標往下移動一行 (等同於在編輯模式中按下 <Down> 鍵)。
CTRL-G <Down>   將游標往下移動一行 (等同於在編輯模式中按下 <Down> 鍵)。
CTRL-G CTRL-K   將游標往上移動一行 (等同於在編輯模式中按下 <Up> 鍵)。
CTRL-G k        將游標往上移動一行 (等同於在編輯模式中按下 <Up> 鍵)。
CTRL-G <Up>     將游標往上移動一行 (等同於在編輯模式中按下 <Up> 鍵)。
CTRL-G u        開始新的不可還原的編輯。
<BS>            刪除游標前的字元。
{char1}<BS>{char2} 輸入二合字母 (只有開啟了 'digraph' 選項才有效)。
CTRL-H          等同於 <BS>。
<Tab>           插入 <Tab> 字元。
CTRL-I          等同於 <Tab>
<NL>            等同於 <CR>。
CTRL-J          等同於 <CR>。
CTRL-K {char1} {char2} 輸入二合字母。
CTRL-L          'insertmode' 開啟時: 離開插入模式。
<CR>            開始新的一行。
CTRL-M          等同於 <CR>。
CTRL-N          尋找符合游標前面的下一個關鍵字。
CTRL-O          執行單個指令然後回到插入模式。
CTRL-P          尋找符合游標前面的上一個關鍵字。
CTRL-Q          等同於 CTRL-V，除非用於終端控制流程。
CTRL-R {0-9a-z"%#*:=} 插入暫存器內容。
CTRL-R CTRL-R {0-9a-z"%#*:=} 按本義插入暫存器內容。
CTRL-R CTRL-O {0-9a-z"%#*:=} 按本義插入暫存器內容，而且不自動縮排。
CTRL-R CTRL-P {0-9a-z"%#*:=} 按本義插入暫存器內容，而且修正縮排。
CTRL-S          (用於終端控制流程)。
CTRL-T          在該行插入一個 shiftwidth 的縮排。
CTRL-U          刪除該行的所有輸入字元。
CTRL-V {char}   按本義插入下一個非數字字元。
CTRL-V {number} 插入三位十進制數字代表的單個字節。
CTRL-W          刪除游標前的單字。
CTRL-X {mode}   進入 CTRL-X 子模式，見 |i_CTRL-X_index|。
CTRL-Y          插入游標上方的字元。
CTRL-Z          'insertmode' 開啟時: 暫停 Vim。
<Esc>           結束插入模式 (除非開啟了 'insertmode')。
CTRL-[          等同於 <Esc>。
CTRL-\ CTRL-N  進入一般模式。
CTRL-\ CTRL-G  進入 'insertmode' 指定的模式。
CTRL-\ a - z    保留給外掛程式用。
CTRL-\ others   無作用。
CTRL-]          切換縮寫。
CTRL-^          切換 |:lmap| 映射的使用。
CTRL-_          'allowrevins' 開啟時: 變更語言 (希伯來語，波斯語等) {僅當編譯時加入|+rightleft| 特性才有效}。
0 CTRL-D        刪除該行的所有縮排。
^ CTRL-D        刪除該行的所有縮排，在下一行恢復刪除的縮排。
<Del>           刪除游標所在的字元。
<Left>          游標左移一個字元。
<S-Left>        游標左移一個單字。
<C-Left>        游標左移一個單字。
<Right>         游標右移一個字元。
<S-Right>       游標右移一個單字。
<C-Right>       游標右移一個單字。
<Up>            游標上移一行。
<S-Up>          等同於 <PageUp>。
<Down>          游標下移一行。
<S-Down>        等同於 <PageDown>。
<Home>          游標移到行首。
<C-Home>        游標移到檔案開頭。
<End>           游標移到行尾後面。
<C-End>         游標移到檔案結尾。
<PageUp>        上一個畫面。
<PageDown>      下一個畫面。
<F1>            等同於 <Help>。
<Help>          停止插入模式顯示說明視窗。
<Insert>        切換插入/替換模式。
<LeftMouse>     游標移到滑鼠點擊處。
<ScrollWheelDown>       視窗向下捲動三行。
<S-ScrollWheelDown>     視窗向下捲動一頁。
<ScrollWheelUp>         視窗向上捲動三行。
<S-ScrollWheelUp>       視窗向上捲動一頁。
<ScrollWheelLeft>       視窗向左捲動六列。
<S-ScrollWheelLeft>     視窗向左捲動一頁。
<ScrollWheelRight>      視窗向右捲動六列。
<S-ScrollWheelRight>    視窗向右捲動一頁。
###submode
CTRL-X CTRL-D   補齊定義過的標識符號。
CTRL-X CTRL-E   上捲。
CTRL-X CTRL-F   補齊檔案名稱。
CTRL-X CTRL-I   補齊標識符號。
CTRL-X CTRL-K   從字典補齊標識符號。
CTRL-X CTRL-L   補齊完整的行。
CTRL-X CTRL-N   下一個補齊。
CTRL-X CTRL-O   全能 (omni) 補齊。
CTRL-X CTRL-P   上一個補齊。
CTRL-X CTRL-S   拼寫建議。
CTRL-X CTRL-T   從同義詞詞典補齊標識符號。
CTRL-X CTRL-U   用 'completefunc' 補齊。
CTRL-X CTRL-V   如同 : 命令列那樣補齊。
CTRL-X CTRL-Y   向下捲動。
CTRL-X CTRL-]   補齊標籤。
CTRL-X s        拼寫建議。
###一般模式
CTRL-@             無作用。
CTRL-A          2  增加當前游標上的數值或者字母 [count]。
CTRL-B          1  反向 (Back) 滾動 N 個畫面。
CTRL-C             終止目前的 (搜尋) 指令。
CTRL-D             向下 (Down) 滾動 N 行 (預設: 半個畫面)。
CTRL-E             向上捲動 N 行 (附加 (Extra) N 行)。
CTRL-F          1  向前 (Forward) 滾動 N 個畫面。
CTRL-G             顯示目前的檔名、檔案狀態 (唯讀、已修改 ...) 和游標位置。
<BS>            1  等同於 "h"。
CTRL-H          1  等同於 "h"。
<Tab>           1  跳轉到跳轉表裡第 N 個較新的項目。
CTRL-I          1  等同於 <Tab>。
<NL>            1  等同於 "j"。
CTRL-J          1  等同於 "j"。
CTRL-K             無作用。
CTRL-L             重繪畫面。
<CR>            1  游標移到 N 行下面的第一個字完。
CTRL-M          1  等同於 <CR>。
CTRL-N          1  等同於 "j"。
CTRL-O          1  跳轉到跳轉表裡第 N 個較舊的項目。
CTRL-P          1  等同於 "k"。
CTRL-Q             (用於終端控制流程)。
CTRL-R          2  重做 'u' 還原的變更。
CTRL-S             (用於終端控制流程)。
CTRL-T             跳轉到標籤清單的第 N 個較舊的標籤 (Tag)。
CTRL-U             上捲 (Upwards) N 行 (預設: 半個畫面)。
CTRL-V             開始面向列塊的可視 (Visual) 模式。
CTRL-W {char}      視窗指令，見 |CTRL-W|。
CTRL-X          2  減少當前游標上的數值或者字母 [count]。
CTRL-Y             向下捲動 N 行。
CTRL-Z             暫停程式 (或者啟動新的 shell)。
CTRL-[ <Esc>       無作用。
CTRL-\ CTRL-N      進入一般模式 (Normal) 模式 (空動作)。
CTRL-\ CTRL-G      進入 'insertmode' 指定的模式。
CTRL-\ a - z       保留作外掛程式用。
CTRL-\ others      無作用。
CTRL-]             :ta 到游標所在的標識符號。
CTRL-^             編輯第 N 個備用檔 (等同於 ":e #N")。
CTRL-_             無作用。
<Space>         1  等同於 "l"。
!{motion}{filter}2  通過 {filter} 指令過濾 Nmove 文字。
!!{filter}      2  通過 {filter} 指令過濾 N 行。
"{a-zA-Z0-9.%#:-"}  指定下次刪除、抽出或放置使用的暫存器{a-zA-Z0-9.%#:-"} (大寫用於添加)({.%#:} 只能用於放置)。
#               1  反向搜尋第 N 次出現的游標所在的標識符號。
$               1  游標移動到往下第 N 行的行尾之後。
%               1  尋找本行下一個括號 ({}/[])，並轉到其符合的括號上，或者轉到符合的註釋配對上，或者轉到符合的預處理指令上。。
{count}%        1  轉到檔案百分之 N 的位置上。
&               2  重複上次 :s。
'{a-zA-Z0-9}    1  游標移動到位置標記 {a-zA-Z0-9} 所在行的第一個字元上。
''              1  游標移動到最近一次跳轉之前所在行的第一個字元上。
'(              1  游標移動到該句的首部所在行的第一個字元上。
')              1  游標移動到該句的尾部所在行的第一個字元上。
'<              1  游標移動到該緩衝區高亮 (highlight) 區開始/曾經開始的行的第一個字元上。
'>              1  游標移動到該緩衝區高亮 (highlight) 區結束/曾經結束的行的第一個字元上。
'[              1  到上次改變或者抽出的文字的第一個字元。
']              1  到上次改變或者抽出文字的最後一個字元。
'{              1  游標移動到該段的首部所在行的第一個字元上。
'}              1  游標移動到該段的尾部所在行的第一個字元上。
(               1  游標回退 N 個句子。
)               1  游標前進 N 個句子。
*               1  正向搜尋第 N 次出現的游標所在的標識符號。
+               1  等同於 <CR>。
,               1  反方向重複最近的 f、t、F 或 T N 次。
-               1  游標移動到上方 N 行的第一個字元上。
.               2  重複最近的變更，其計數被 N 取代。
/{pattern}<CR>  1  正向搜尋第 N 次出現的 {pattern}。
/<CR>           1  正向搜尋最近一次搜尋使用的 {pattern}。
0               1  將游標移動到本行的第一個字元上。
1,2,3,4,5,6,7,8,9  附加於指令前，給出計數。
:               1  開始進入 Ex 指令。
{count}:           開始進入 Ex 指令，給出從該行開始到下方 N-1 行為止的行範圍。
;               1  重複最近的 f、t、F 或 T N 次。
<{motion}       2  左移 Nmove text 行一個 'shiftwidth'。
<<              2  左移 N 行一個 'shiftwidth'。
={motion}       2  通過 "indent" 過濾 Nmove text 行。
==              2  通過 "indent" 過濾 N 行。
>{motion}       2  右移 Nmove text 一個 'shiftwidth'。
>>              2  右移 N 行一個 'shiftwidth'。
?{pattern}<CR>  1  反向搜尋第 N 次出現的 {pattern}。
?<CR>           1  反向搜尋最近一次搜尋使用的 {pattern}。
@{a-z}          2  執行 {a-z} 暫存器的內容 N 次。
@:                 重複上次的 ":" 指令 N 次。
@@              2  重複上次的 @{a-z} N 次。
A               2  在行尾附加 text N 次。
B               1  游標反向移動 N 個 word (字串)。
["x]C           2  從游標位置到行尾部分，再加上 N-1 行進行修改 [到暫存器 x]；等同於 "c$"。
["x]D           2  刪除位置到行尾部分，再加上 N-1 行的字元 [到暫存器 x]；等同於 "d$"。
E               1  將游標正向移動到第 N 個 word 的結尾處。
F{char}         1  游標左移到第 N 次出現的 {char} 上。
G               1  游標移動到第 N 行，預設是最後一行。
H               1  游標移動到畫面頂部開始算的第 N 行。
I               2  在本行第一個字元之前插入 text N 次。
J               2  連接 (Join) N 行；預設為 2。
K                  尋找游標所在的關鍵字 (Keyword)，使用 'keywordprg' 的定義。
L               1  游標移動到畫面底部開始算的第 N 行。
M               1  游標移動到畫面的中間一行。
N               1  反方向重複最近的 '/'  或 '?' 搜尋 N 次。
O               2  在游標上方開始一個新行，並插入 text，重複 N 次。
["x]P           2  在游標放置 text [到暫存器 x] N 次。
Q                  切換到 "Ex" 模式。
R               2  進入替換模式: 覆蓋存在的字元，重複輸入 text N-1 次。
["x]S           2  刪除 N 行 [到暫存器 x] 並開始輸入；等同於 "cc"。
T{char}         1  游標移動到左側第 N 次出現的 {char} 之前。
U               2  還原一行內最近所有的變更。
V                  進入面向行的可視 (Visual) 模式。
W               1  游標前移 N 個 word。
["x]X           2  刪除游標前的 N 個字元 [到暫存器 x]。
["x]Y              抽出 N 行 [到暫存區 x]；等同於 "yy"。
ZZ                 如果修改過，保存目前檔案，然後離開。
ZQ                 無論如何退出目前檔案。
[{char}            方括號指令 (見下 |[|)。
\                  無作用。
]{char}            方括號指令 (見下 |]|)。
^               1  將游標移動到本行的第一個字元上。
_               1  游標移動到下方第 N - 1 行的第一個字元上。
`{a-zA-Z0-9}    1  游標移動到位置標記 {a-zA-Z0-9}。
`(              1  游標移動該句的開始處。
`)              1  游標移動該句的結束處。
`<              1  游標移動高亮 (highlight) 區域的開始處。
`>              1  游標移動高亮 (highlight) 區域的結束處。
`[              1  到上次改變或者抽出的文字的第一個字元。
`]              1  到上次改變或者抽出文字的最後一個字元。
``              1  游標移動最近一次跳轉的位置。
`{              1  游標移動到該段的開始處。
`}              1  游標移動到該段的結束處。
a               2  在游標處附加 text N 次。
b               1  游標反向移動 N 個單字。
["x]c{motion}   2  刪除 Nmove text [到暫存區 x] 並開始編輯。
["x]cc          2  刪除 N 行 [到暫存區 x] 並開始編輯。
["x]d{motion}   2  刪除 Nmove text [到暫存區 x]。
["x]dd          2  刪除 N 行 [到暫存區 x]]。
do              2  等同於 ":diffget"。
dp              2  等同於 ":diffput"。
e               1  將游標正向移動到第 N 個 word 的結尾處。
f{char}         1  游標右移到第 N 次出現的 {char} 上。
g{char}            外掛程式指令，見下 |g|。
h               1  游標左移 N 個字元。
i               2  在游標前插入text N 次。
j               1  游標下移 N 行。
k               1  游標上移 N 行。
l               1  游標右移 N 個字元。
m{A-Za-z}          在游標位置處設定位置標記 {A-Za-z}。
n               1  重複最近的 '/' 或 '?' 搜尋 N 次。
o               2  在游標下方開始一個新行，並插入 text，重複 N次。
["x]p           2  在游標後 [從暫存器 x] 放置 text N 次。
q{0-9a-zA-Z"}      記錄輸入的字元到指令暫存器 {0-9a-zA-Z"}(大寫用於添加)。
q                  (在記錄時) 停止記錄。
q:                 在命令列視窗裡編輯 : 命令列。
q/                 在命令列視窗裡編輯 / 命令列。
q?                 在命令列視窗裡編輯 ? 命令列。
r{char}         2  用 {char} 替換 N 個字元。
["x]s           2  (替換) 刪除 N 個字元 [到暫存區 x] 並開始輸入。
t{char}         1  游標移動到右側第 N 次出現的 {char} 之前。
u               2  還原變更。
v                  開始面向字元的可視 (Visual) 模式。
w               1  游標前移 N 個單字。
["x]x           2  刪除游標開始的 N 個字元 [到暫存區 x]。
["x]y{motion}      抽出 Nmove text [到暫存區 x]。
["x]yy             抽出 N 行 [到暫存區 x]。
z{char}            'z' 開始的指令，見下 |z|。
{               1  游標反向移動 N 個段落。
|               1  游標移到第 N 列。
}               1  游標正向移動 N 個段落。
~               2  'tildeop' 關閉時: 切換游標所在處開始的 N 個字元的大小寫，並右移游標 N 個字元。
~{motion}          'tildeop' 開啟時: 切換 Nmove text 的大小寫。
<C-End>         1  等同於 "G"。
<C-Home>        1  等同於 "gg"。
<C-Left>        1  等同於 "b"。
<C-LeftMouse>      ":ta" 到滑鼠點擊所在的單字上。
<C-Right>       1  等同於 "w"。
<C-RightMouse>    等同於 "CTRL-T"。
["x]<Del>       2  等同於 "x"。
{count}<Del>       刪除 {count} 最後的一位數字。
<Down>          1  等同於 "j"。
<End>           1  等同於 "$"。
<F1>               等同於 <Help>。
<Help>             開啟說明視窗。
<Home>          1  等同於 "0"。
<Insert>        2  等同於 "i"。
<Left>          1  等同於 "h"。
<LeftMouse>     1  移動游標到滑鼠點擊處。
<MiddleMouse>   2  等同於在滑鼠點擊處 "gP"。
<PageDown>         等同於 CTRL-F。
<PageUp>           等同於 CTRL-B。
<Right>         1  等同於 "l"。
<RightMouse>       開始可視模式，移動游標到滑鼠點擊處。
<S-Down>        1  等同於 CTRL-F。
<S-Left>        1  等同於 "b"。
<S-LeftMouse>      等同於在滑鼠點擊處 "*"。
<S-Right>       1  等同於 "w"。
<S-RightMouse>    等同於在滑鼠點擊處 "#"。
<S-Up>          1  等同於 CTRL-B。
<Undo>          2  等同於 "u"。
<Up>            1  等同於 "k"。
<ScrollWheelDown>       視窗向下捲動三行。
<S-ScrollWheelDown>     視窗向下捲動一頁。
<ScrollWheelUp>         視窗向上捲動三行。
<S-ScrollWheelUp>       視窗向上捲動一頁。
<ScrollWheelLeft>       視窗向左捲動六列。
<S-ScrollWheelLeft>     視窗向左捲動一頁。
<ScrollWheelRight>      視窗向右捲動六列。
<S-ScrollWheelRight>    視窗向右捲動一頁。
###Text objects
a"                 雙引號字元串。
a'                 單引號字元串。
a(                 等同於 ab。
a)                 等同於 ab。
a<                 "一個 <> 塊" 從 '<' 到符合的 '>'。
a>                 等同於 a<。
aB                 "一個大塊" 從 "[{" 到 "]}" (帶上括號)。
aW                 "一個字串" (帶上空白)。
a[                 "一個 [] 塊" 從 '[' 到符合的 ']'。
a]                 等同於 a[。
a`                 反引號字元串。
ab                 "一個塊" 從 "[(" 到 "])" (帶上括號)。
ap                 "一個段落" (帶上空白)。
as                 "一個句子" (帶上空白)。
at                 "一個標籤塊" (帶上空白)。
aw                 "一個單字" (帶上空白)。
a{                 等同於 aB。
a}                 等同於 aB。
i"                 雙引號字元串，不帶引號。
i'                 單引號字元串，不帶引號。
i(                 等同於 ib。
i)                 等同於 ib。
i<                 "內含 <> 塊" 從 '<' 到符合的 '>'。
i>                 等同於 i<。
iB                 "內含大塊" 從 "[{" 到 "]}"。
iW                 "內含字串"。
i[                 "內含 [] 塊" 從 '[' 到符合的 ']'。
i]                 等同於 i[。
i`                 反引號字元串，不帶反引號。
ib                 "內含塊" 從 "[(" 到 "])"。
ip                 "內含段落"。
is                 "內含句子"。
it                 "內含標籤塊"。
iw                 "內含單字"。
i{                 等同於 iB。
i}                 等同於 iB。
###視窗指令
CTRL-W CTRL-B      等同於 "CTRL-W b"。
CTRL-W CTRL-C      等同於 "CTRL-W c"。
CTRL-W CTRL-D      等同於 "CTRL-W d"。
CTRL-W CTRL-F      等同於 "CTRL-W f"。
CTRL-W CTRL-G      等同於 "CTRL-W g .."。
CTRL-W CTRL-H      等同於 "CTRL-W h"。
CTRL-W CTRL-I      等同於 "CTRL-W i"。
CTRL-W CTRL-J      等同於 "CTRL-W j"。
CTRL-W CTRL-K      等同於 "CTRL-W k"。
CTRL-W CTRL-L      等同於 "CTRL-W l"。
CTRL-W CTRL-N      等同於 "CTRL-W n"。
CTRL-W CTRL-O      等同於 "CTRL-W o"。
CTRL-W CTRL-P      等同於 "CTRL-W p"。
CTRL-W CTRL-Q      等同於 "CTRL-W q"。
CTRL-W CTRL-R      等同於 "CTRL-W r"。
CTRL-W CTRL-S      等同於 "CTRL-W s"。
CTRL-W CTRL-T      等同於 "CTRL-W t"。
CTRL-W CTRL-V      等同於 "CTRL-W v"。
CTRL-W CTRL-W      等同於 "CTRL-W w"。
CTRL-W CTRL-X      等同於 "CTRL-W x"。
CTRL-W CTRL-Z      等同於 "CTRL-W z"。
CTRL-W CTRL-]      等同於 "CTRL-W ]"。
CTRL-W CTRL-^      等同於 "CTRL-W ^"。
CTRL-W CTRL-_      等同於 "CTRL-W _"。
CTRL-W +           增加目前視窗高度 N 行。
CTRL-W -           減少目前視窗高度 N 行。
CTRL-W <           減少目前視窗寬度 N 列。
CTRL-W =           使得所有視窗同寬同高。
CTRL-W >           增加目前視窗寬度 N 列。
CTRL-W H           移動目前視窗到最左端。
CTRL-W J           移動目前視窗到最底部。
CTRL-W K           移動目前視窗到最頂部。
CTRL-W L           移動目前視窗到最右端。
CTRL-W P           跳轉到預覽視窗。
CTRL-W R           向上旋轉視窗 N 次。
CTRL-W S           等同於 "CTRL-W s"。
CTRL-W T           移動目前視窗到新標籤頁。
CTRL-W W           跳轉到前面第 N 個視窗 (迴繞)。
CTRL-W ]           分割視窗並跳轉到游標所在的標籤上。
CTRL-W ^           分割視窗並編輯備用檔 N。
CTRL-W _           設定目前視窗高度為 N (預設: 儘量大)。
CTRL-W b           跳轉到底部的視窗。
CTRL-W c           關閉目前視窗 (類似於 |:close|)。
CTRL-W d           分割視窗並跳轉到游標所在的定義上。
CTRL-W f           分割視窗並跳轉到游標所在的檔名上。
CTRL-W F           分割視窗並編輯游標所在的檔名，然後跳轉到檔名後給出的行號上。
CTRL-W g CTRL-]  分割視窗並在游標所在的標籤上執行 |:tjump|。
CTRL-W g ]         分割視窗並在游標所在的標籤上執行 |:tselect|。
CTRL-W g }         在游標所在的標籤上執行 |:ptjump|。
CTRL-W g f         在新分頁裡編輯游標所在的檔名。
CTRL-W g F         在新分頁裡編輯游標所在的檔名然後跳轉到檔名後給出的行號上。
CTRL-W h           跳轉到左面第 N 個的視窗 (在首個視窗上停止)。
CTRL-W i           分割視窗並跳轉到游標所在的標識符號的聲明上。
CTRL-W j           跳轉到下面第 N 個的視窗 (在最後視窗上停止)。
CTRL-W k           跳轉到上面第 N 個的視窗 (在首個視窗上停止)。
CTRL-W l           跳轉到右面第 N 個的視窗 (在最後視窗上停止)。
CTRL-W n           開啟新視窗，N 行高。
CTRL-W o           關閉除了目前視窗以外的所有視窗 (類似於|:only|)。
CTRL-W p           轉到前面一個 (最近訪問的) 視窗。
CTRL-W q           退出目前視窗 (類似於 |:quit|)。
CTRL-W r           向下旋轉視窗 N 次。
CTRL-W s           分割目前視窗為兩部分，新的視窗 N 行高。
CTRL-W t           跳轉到頂部視窗。
CTRL-W v           垂直分割目前視窗，新的視窗 N 列寬。
CTRL-W w           轉到後面第 N 個視窗 (迴繞)。
CTRL-W x           交換目前和第 N 個視窗 (預設: 下一個視窗)。
CTRL-W z           關閉預覽視窗。
CTRL-W |           設定視窗寬度為 N 列。
CTRL-W }           在預覽視窗裡顯示游標所在的標籤。
CTRL-W <Down>      等同於 "CTRL-W j"。
CTRL-W <Up>        等同於 "CTRL-W k"。
CTRL-W <Left>      等同於 "CTRL-W h"。
CTRL-W <Right>    等同於 "CTRL-W l"。
###方括號指令
[ CTRL-D           跳轉到第一個在目前檔案和它包含的標頭檔裡符合游標所在的單字的 #define，從目前檔案的頭部開始。
[ CTRL-I           跳轉到第一個在目前檔案和它包含的標頭檔裡符合游標所在單字的位置，從目前檔案頭部開始。
[#              1  游標移動到前面第 N 個未符合的 #if、#else 或者 #ifdef。
['              1  游標移動到前面的小寫位置標記，定位在它所在行的第一個非空白字元上。
[(              1  游標移動到前面第 N 個未符合的 '('。
[*              1  等同於 "[/"。
[`              1  游標移動到前一個小寫位置標記。
[/              1  游標移動到前面第 N 個 C 註釋的開始處。
[D                 列出在目前檔案和它包含的標頭檔裡符合游標所在的單字的所有定義，從目前檔案的頭部開始。
[I                 列出在目前檔案和它包含的標頭檔裡符合游標所在單字的所有位置，從目前檔案的頭部開始。
[P              2  等同於 "[p"。
[[              1  游標後退 N 個小節。
[]              1  游標後退 N 個 SECTION。
[c              1  游標後退 N 個更改開始的地方。
[d                 顯示第一個在目前檔案和它包含的標頭檔裡符合游標所在的單字的 #define，從目前檔案的頭部開始。
[f                 等同於 "gf"。
[i                 顯示第一個在目前檔案和它包含的標頭檔裡符合游標所在單字的位置，從目前檔案的頭部開始。
[m              1  游標後退 N 個成員函數的開始。
[p              2  類似於 "P"，但調整該行的縮排。
[s              1  移動到前一個拼字錯誤的單字。
[z              1  移動到開啟的摺疊的開始。
[{              1  游標後退 N 個未符合的 '{'。
[<MiddleMouse>  2  等同於 "[p"。
] CTRL-D           跳轉到第一個在目前檔案和它包含的標頭檔裡符合游標所在的單字的 #define，從游標位置開始。
] CTRL-I           跳轉到第一個在目前檔案和它包含的標頭檔裡符合游標所在單字的位置，從游標位置開始。
]#              1  游標移動到後面第 N 個未符合的 #endif、#else。
]'              1  游標移動到後面的小寫位置標記，定位在它所在行的第一個非空白字元上。
](              1  游標移動到後面第 N 個未符合的 ')'。
]*              1  等同於 "]/"。
]`              1  游標移動到後一個小寫位置標記。
]/              1  游標移動到後面第 N 個 C 註釋的結尾處。
]D                 列出在目前檔案和它包含的標頭檔裡符合游標所在的單字的所有定義，從游標位置開始。
]I                 列出在目前檔案和它包含的標頭檔裡符合游標所在單字的所有位置，從游標位置開始。
]P              2  等同於 "[p"。
]]              1  游標前進 N 個小節。
]c              1  游標前進 N 個更改開始的地方。
]d                 顯示第一個在目前檔案和它包含的標頭檔裡符合游標所在的單字的 #define，從游標位置開始。
]f                 等同於 "gf"。
]i                 顯示第一個在目前檔案和它包含的標頭檔裡符合游標所在單字的位置，從游標位置開始。
]m              1  游標前進 N 個成員函數的結尾。
]p              2  類似於 "p"，但調整該行的縮排。
]s              1  移動到後一個拼字錯誤的單字。
]z              1  移動到開啟的摺疊的結尾處。
]{              1  游標前進 N 個未符合的 '}'。
]<MiddleMouse>  2  等同於 "]p"。
###'g' 開始的指令
g CTRL-A           只有在編譯時加入了 MEM_PROFILE 時才有定義:轉存記憶體內容。
g CTRL-G           顯示目前游標位置。
g CTRL-H           啟動選擇列塊模式。
g CTRL-]           |:tjump| 到游標所在的標籤上。
g#              1  類似於 "#"，但不使用 "\<" 和 "\>"。
g$              1  'wrap' 關閉時轉到該行最右側畫面上可見的字元 'wrap' 開啟時轉到該畫面行最右側的字元。
g&              2  在所有行上重複上次的 ":s"。
g'{mark}        1  類似於 |'|，但不變更跳轉表。
g`{mark}        1  類似於 |`|，但不改表跳轉表。
g*              1  類似於 "*"，但不使用 "\<" 和 "\>"。
g0              1  'wrap' 關閉時轉到該行最左側畫面上可見的字元'wrap' 開啟時轉到該畫面行最左側的字元。
g8                 顯示游標所在的 UTF-8 字元的十六進制字節碼。
g<                 顯示上次的指令輸出。
g?              2  Rot13 編碼操作符。
g??             2  Rot13 編碼該行。
g?g?            2  Rot13 編碼該行。
gD              1  轉到目前檔案的游標所在單字的定義。
gE              1  反向轉移到上一個 word 的結尾處。
gH                 啟動選擇行模式。
gI              2  類似於 "I"，但總是從第一列開始。
gJ              2  連接行，不插入空格。
["x]gP          2  在游標籤放置 text [從暫存器 x] N 次，游標留在插入 text 之後。
gR              2  進入虛擬替換模式。
gU{motion}      2  使得 Nmove text 全部大寫。
gV                 在執行選擇模式下的映射或者選單時，不要重複選擇過去的可視區域。
g]                 :tselect 到游標所在的標籤上。
g^              1  'wrap' 關閉時轉到該行最左側畫面上可見的非空白字元 'wrap' 開啟時轉到該畫面行最左側的非空白字元。
ga                 印出游標所在處的字元的 ascii 值。
gd              1  轉到目前函數裡目前游標所在的單字的定義。
ge              1  反向轉到前一個單字的結尾處。
gf                 開始編輯目前游標所在的名字對應的檔案。
gF                 開始編輯游標所在的檔名並跳轉到檔名後的行號上。
gg              1  游標移動到第 N 行，預設是第一行。
gh                 開始選擇模式。
gi              2  類似於 "i"，但先移動到 |'^| 位置標記。
gj              1  類似於 "j"，但 'wrap' 開啟時往下 N 個畫面行。
gk              1  類似於 "k"，但 'wrap' 開啟時往上 N 個畫面行。
gm              1  轉到當前行正中間的那個字元。
go              1  游標移動到緩衝區的第 N 個字節。
["x]gp          2  在游標後面放置 text [從暫存器 x] N 次，游標留在後面。
gq{motion}      2  排版 Nmove text。
gr{char}        2  虛擬替換 N 個字元為 {char}。
gs                 睡眠 N 秒 (預設 1)。
gu{motion}      2  使得 Nmove text 全部小寫。
gv                 重新選擇上次的可視區域。
gw{motion}      2  排版 Nmove text 並保持游標位置。
gx                 執行游標下的檔名對應的應用程式 (僅限於 |netrw| 外掛程式)。
g@{motion}         調用 'operatorfunc'。
g~{motion}      2  變更 Nmove text 的大小寫。
g<Down>         1  等同於 "gj"。
g<End>          1  等同於 "g$"。
g<Home>         1  等同於 "g0"。
g<LeftMouse>       等同於 <C-LeftMouse>。
g<MiddleMouse>     等同於 <C-MiddleMouse>。
g<RightMouse>      等同於 <C-RightMouse>。
g<Up>           1  等同於 "gk"。
###'z' 開始的指令
z<CR>              重繪，游標移動到視窗的頂行的第一個非空白字元。
z{height}<CR>      重繪，使得視窗高度為 {height} 行。
z+                 游標移動到第 N 行 (預設為視窗之後的第一行)，其它同 "z<CR>"。
z-                 重繪，游標移動到視窗末行的第一個非空白字元。
z.                 重繪，游標移動到視窗的中間行的第一個非空白字元。
z=                 取得拼字建議 (需先啟用 spell)。
zA                 遞迴開啟一個關閉的摺疊或關閉一個開啟的摺疊。
zC                 遞迴關閉摺疊。
zD                 遞迴刪除摺疊。
zE                 除去所有摺疊。
zF                 為 N 行建立摺疊。
zG                 把單字標記為拼寫正確 (good)。
zM                 設定 'foldlevel' 為零。
zN                 置位 'foldenable'。
zO                 遞迴開啟摺疊。
zR                 設定 'foldlevel' 為最大摺疊級別。
zW                 把單字標記為拼字錯誤 (wrong)。
zX                 重新應用 'foldlevel'。
z^                 游標移動到第 N 行 (預設為視窗之前的一行)，其它同 "z-"。
za                 開啟關閉的摺疊，或關閉開啟的摺疊。
zb                 重繪，游標在視窗底行。
zc                 關閉摺疊。
zd                 刪除摺疊。
ze                 'wrap' 關閉時，水平滾動使得游標定位到畫面的尾部 (最右側)。
zf{motion}         為 Nmove text 建立摺疊。
zg                 把單字標記為拼寫正確 (good)。
zh                 'wrap' 關閉時，水平右捲畫面 N 個字元。
zi                 切換 'foldenable'。
zj              1  移動到下一個摺疊的開始處。
zk              1  移動到前一個摺疊的結束處。
zl                 'wrap' 關閉時，水平左捲畫面 N 個字元。
zm                 從 'foldlevel' 減 1。。
zn                 復位 'foldenable'，所有的摺疊被開啟。。
zo                 開啟摺疊。
zr                 給 'foldlevel' 加 1。
zs                 'wrap' 關閉時，水平滾動使得游標定位到畫面的起始處 (最左側)。
zt                 重繪，游標移動到視窗的頂部。
zw                 把單字標記為拼字錯誤 (wrong)。
zv                 開啟足夠的摺疊，使得該行可見。
zx                 重新應用 'foldlevel' 然後執行 "zv"。
zz                 重繪，游標移動到視窗的中間行。
z<Left>            等同於 "zh"。
z<Right>           等同於 "zl"。
###可視模式
CTRL-\ CTRL-N    結束可視模式。。
CTRL-\ CTRL-G    轉到 'insertmode' 指定的模式。
CTRL-C             結束可視模式。
CTRL-G             在可視模式和選擇模式間切換。
<BS>            2  選擇模式: 刪除高亮 (highlight) 區域。
CTRL-H          2  等同於 <BS>。
CTRL-O             從選擇模式切換到可視模式，只限於下個指令。
CTRL-V             使得可視模式面向列塊，或者退出可視模式。
<Esc>              結束可視模式。
CTRL-]             跳轉到高亮 (highlight) 的標籤上。
!{filter}       2  通過外部指令 {filter} 過濾高亮 (highlight) 行。
:                  使用高亮 (highlight) 行作為範圍，開始一個命令列。
<               2  左移高亮 (highlight) 行一個 'shiftwidth'。
=               2  用 {equalprg} 選項指定的外部程式過濾高亮 (highlight) 行。
>               2  右移高亮 (highlight) 行一個 'shiftwidth'。
A               2  列塊模式下: 在高亮 (highlight) 區域的所有行後附加相同的 text。
C               2  刪除高亮 (highlight) 行，並開始插入。
D               2  刪除高亮 (highlight) 行。
I               2  列塊模式: 在所有高亮 (highlight) 行之前插入相同的 text。
J               2  連接高亮 (highlight) 行。
K                  在高亮 (highlight) 區域上運行 'keywordprg'。
O                  水平移動到區域的另外一側。
Q                  不啟動 Ex 模式。
R               2  刪除高亮 (highlight) 行並開始插入。
S               2  刪除高亮 (highlight) 行並開始插入。
U               2  使得高亮 (highlight) 區域全變大寫。
V                  使得可視區域面向行，或者退出可視模式。
X               2  刪除高亮 (highlight) 區域。
Y                  抽出高亮 (highlight) 行。
a"                 延伸高亮 (highlight) 區域，使包含一個雙引號字元串。
a'                 延伸高亮 (highlight) 區域，使包含一個單引號字元串。
a(                 等同於 ab。
a)                 等同於 ab。
a<                 延伸高亮 (highlight) 區域，使包含一個 <> 塊。
a>                 等同於 a<。
aB                 延伸高亮 (highlight) 區域，使包含一個 {} 塊。
aW                 延伸高亮 (highlight) 區域，使包含 "一個 word"。
a[                 延伸高亮 (highlight) 區域，使包含一個 [] 塊。
a]                 等同於 a[。
a`                 延伸高亮 (highlight) 區域，使包含一個反引號字元串。
ab                 延伸高亮 (highlight) 區域，使包含一個 () 塊。
ap                 延伸高亮 (highlight) 區域，使包含一個段落。
as                 延伸高亮 (highlight) 區域，使包含一個句子。
at                 延伸高亮 (highlight) 區域，使包含一個標籤塊。
aw                 延伸高亮 (highlight) 區域，使包含 "一個單字"。
a{                 等同於 aB。
a}                 等同於 aB。
c               2  刪除高亮 (highlight) 區域，並開始插入。
d               2  刪除高亮 (highlight) 區域。
gJ              2  連接高亮 (highlight) 行，不插入空格。
gq              2  排版高亮 (highlight) 行。
gv                 交換現在和以前的高亮 (highlight) 區域。
i"                 延伸高亮 (highlight) 區域，使包含一個雙引號字元串 (但不含引號)。
i'                 延伸高亮 (highlight) 區域，使包含一個單引號字元串 (但不含引號)。
i(                 等同於 ib。
i)                 等同於 ib。
i<                 延伸高亮 (highlight) 區域，使包含內含 <> 塊。
i>                 等同於 i<。
iB                 延伸高亮 (highlight) 區域，使包含內含 {} 塊。
iW                 延伸高亮 (highlight) 區域，使包含 "內含 word"。
i[                 延伸高亮 (highlight) 區域，使包含內含 [] 塊。
i]                 等同於 i[。
i`                 延伸高亮 (highlight) 區域，使包含一個反引號字元串 (但不含反引號)。
ib                 延伸高亮 (highlight) 區域，使包含內含 () 塊。
ip                 延伸高亮 (highlight) 區域，使包含內含段落。
is                 延伸高亮 (highlight) 區域，使包含內含句子。
it                 延伸高亮 (highlight) 區域，使包含內含標籤塊。
iw                 延伸高亮 (highlight) 區域，使包含 "內含單字"。
i{                 等同於 iB。
i}                 等同於 iB。
o                  移動游標到區域的另一側。
r               2  刪除高亮 (highlight) 區域，並開始插入。
s               2  刪除高亮 (highlight) 區域，並開始插入。
u               2  使得高亮 (highlight) 區域全變小寫。
v                  使用可視模式，或者退出可視模式。
x               2  刪除高亮 (highlight) 區域。
y                  抽出高亮 (highlight) 區域。
~               2  變更高亮 (highlight) 區域的大小寫。
###命令列編輯
CTRL-@          無作用。
CTRL-A          使用游標前面的模式進行補齊，並插入所有符合的指令。
CTRL-B          游標移動到命令列開始的地方。
CTRL-C          等同於 <ESC>。
CTRL-D          列出游標前面模式的所有補齊。
CTRL-E          游標移動到命令列結束的地方。
CTRL-F          'cedit' 的預設值: 開啟命令列視窗；否則無作用。
CTRL-G          無作用。
<BS>            刪除游標前面的字元。
{char1} <BS> {char2}   'digraph' 開啟時，輸入二合字母。
CTRL-H          等同於 <BS>。
<Tab>           如果 'wildchar' 是 <Tab>: 補齊游標前面的模式。
<S-Tab>         等同於 CTRL-P。
'wildchar'      補齊游標前面的模式 (預設: <Tab>)。
CTRL-I          等同於 <Tab>。
<NL>            等同於 <CR>。
CTRL-J          等同於 <CR>。
CTRL-K {char1} {char2}輸入二合字母。
CTRL-L          補齊游標前的模式，並插入最長的公共子串。
<CR>            執行輸入的指令。
CTRL-M          等同於 <CR>。
CTRL-N          使用 'wildchar' 並有多個符合: 轉到下一個符合，不然: 等同於 <Down>。
CTRL-O          不同。
CTRL-P          使用 'wildchar' 並有多個符合: 轉到上一個符合，不然: 等同於 <Up>。
CTRL-Q          等同於 CTRL-V，除非用於終端控制流。
CTRL-R {0-9a-z"%#*:= CTRL-F CTRL-P CTRL-W CTRL-A}插入暫存器的內容或特殊對象到游標所在的地方，如同直接輸入那樣。
CTRL-R CTRL-R {0-9a-z"%#*:= CTRL-F CTRL-P CTRL-W CTRL-A}按本義插入暫存器的內容或特殊對象到游標所在的地方。
CTRL-S          (用於終端控制流)。
CTRL-T          無作用。
CTRL-U          刪除所有字元。
CTRL-V          按本義插入下一個非數字字元，或者插入其後三位數字所代表的單個字節。
CTRL-W          刪除游標前面的單字。
CTRL-X          無作用 (保留作補齊用)。
CTRL-Y          複製 (抽出) 無模式的選擇。
CTRL-Z          無作用 (保留作暫停用)。
<Esc>           放棄命令列，不執行。
CTRL-[          等同於 <Esc>。
CTRL-\ CTRL-N  轉到一般模式，放棄命令列。
CTRL-\ CTRL-G  轉到 'insertmode' 指定的模式，放棄命令列。
CTRL-\ a - d    保留給外掛程式用。
CTRL-\ e {expr} 以 {expr} 的結果替換命令列。
CTRL-\ f - z    保留給外掛程式用。
CTRL-\ others   無作用。
CTRL-]          啟用縮寫。
CTRL-^          切換 |:lmap| 映射的使用。
CTRL-_          'allowrevins'  開啟時: 變更語言 (希伯來，波斯)。
<Del>           刪除游標所在的字元。
<Left>          游標左移。
<S-Left>        游標左移一個單字。
<C-Left>        游標左移一個單字。
<Right>         游標右移。
<S-Right>       游標右移一個單字。
<C-Right>       游標右移一個單字。
<Up>            從歷史中調入符合游標前模式的前一個命令列。
<S-Up>          從歷史中調入前一個命令列。
<Down>          從歷史中調入符合游標前模式的後一個命令列。
<S-Down>        從歷史中調入後一個命令列。
<Home>          游標移動到命令列開始的地方。
<End>           游標移動到命令列結束的地方。
<PageDown>      等同於 <S-Down>。
<PageUp>        等同於 <S-Up>。
<Insert>        切換插入/替換模式。
<LeftMouse>     游標移動到滑鼠點擊的地方。
###EX 指令
:!              過濾行，或可通過外部指令執行之。
:!!             重複上次的 ":!" 指令。
:#              等同於 ":number"。
:&              重複上次的 ":substitute"。
:*              執行暫存器的內容。
:<              將行左移一個 'shiftwidth'。
:=              顯示游標所在的行號。
:>              將行右移一個 'shiftwidth'。
:@              執行暫存器的內容。
:@@             重複上次的 ":@"。
:N[ext]         轉到參數清單的上一個檔案。
:P[rint]        顯示行。
:X              請求加密密鑰。
:a[ppend]       附加 text。
:ab[breviate]   輸入縮寫。
:abc[lear]      刪除所有的縮寫。
:abo[veleft]    使得分割的視窗出現在左側或者上方。
:al[l]          為參數清單的每個檔案開啟一個視窗。
:am[enu]        為所有模式輸入選單項。
:an[oremenu]    為所有模式輸入選單項，不會被重新映射。
:ar[gs]         顯示參數清單。
:arga[dd]       增加項目到參數清單中。
:argd[elete]    從參數清單中刪除項目。
:arge[dit]      增加項目到參數清單中並編輯之。
:argdo          在參數清單上的所有項目上執行一個指令。
:argg[lobal]    定義全域參數清單。
:argl[ocal]     定義本地參數清單。
:argu[ment]     轉到參數清單一個指定的檔案。
:as[cii]        顯示游標所在的字元的 ascii 值。
:au[tocmd]      輸入或者顯示自動指令。
:aug[roup]      選擇要用的自動指令組。
:aun[menu]      刪除所有模式下的選單。
:b[uffer]       轉到緩衝區清單裡的特定緩衝區。
:bN[ext]        轉到緩衝區清單裡的上一個緩衝區。
:ba[ll]         為緩衝區清單裡的每個緩衝區開啟一個視窗。
:bad[d]         增加緩衝區到緩衝區清單。
:bd[elete]      從緩衝區清單刪除緩衝區。
:be[have]       設定滑鼠和選擇行為。
:bel[owright]   使得分割的視窗出現在右側或者下方。
:bf[irst]       轉到緩衝區清單裡的第一個緩衝區。
:bl[ast]        轉到緩衝區清單裡的最後一個緩衝區。
:bm[odified]    轉到緩衝區清單裡的下一個修改過的緩衝區。
:bn[ext]        轉到緩衝區清單裡的下一個緩衝區。
:bo[tright]     使得分割的視窗出現在最右側或者下方。
:bp[revious]    轉到緩衝區清單裡的上一個緩衝區。
:br[ewind]      轉到緩衝區清單裡的第一個緩衝區。
:brea[k]        跳出 while 循環。
:breaka[dd]     增加調試器斷點。
:breakd[el]     刪除調試器斷點。
:breakl[ist]    列出調試器斷點。
:bro[wse]       使用檔案選擇對話框。
:bufdo          為所有清單內緩衝區執行指令。
:buffers        列出緩衝區清單裡的所有檔案。
:bun[load]      卸載指定的緩衝區。
:bw[ipeout]     真正刪除一個緩衝區。
:c[hange]       替換一行或若干行。
:cN[ext]        跳轉到上一個錯誤。
:cNf[ile]       跳轉到前一個檔案的最後一個錯誤。
:ca[bbrev]      類似於 ":abbreviate"，但用於命令列模式。
:cabc[lear]     清除所有縮寫，用於命令列模式。
:caddb[uffer]   通過緩衝區補充錯誤。
:cad[dexpr]     通過表達式補充錯誤。
:caddf[ile]     加入錯誤訊息到目前 quickfix 清單。
:cal[l]         調用函數。
:cat[ch]        :try 指令的一部分。
:cb[uffer]      分析錯誤訊息並跳轉到第一個。
:cc             跳轉到特定的錯誤。
:ccl[ose]       關閉 quickfix 視窗。
:cd             變更目錄。
:ce[nter]       排版行，使其居中對齊。
:cex[pr]        從表達式裡讀取錯誤並跳轉到第一個。
:cf[ile]        讀入含有錯誤訊息的檔案，並跳轉到第一個。
:cfir[st]       跳轉到指定的錯誤上，預設為第一個。
:cgetb[uffer]   從緩衝區裡得到錯誤。
:cgete[xpr]     從表達實裡得到錯誤。
:cg[etfile]     讀入含有錯誤訊息的檔案。
:cha[nges]      顯示修改的清單。
:chd[ir]        變更目前目錄。
:che[ckpath]    列出包含的標頭檔。
:checkt[ime]    檢查載入緩衝區的時間標籤。
:cl[ist]        列出所有錯誤。
:cla[st]        跳轉到指定的錯誤上，預設為最後一個。
:clo[se]        變更目前視窗。
:cm[ap]         類似於 ":map"，但用於命令列模式。
:cmapc[lear]    清除所有映射，用於命令列模式。
:cme[nu]        為命令列模式增加選單。
:cn[ext]        跳轉到下一個錯誤。
:cnew[er]       跳轉到下一個較新的錯誤清單。
:cnf[ile]       跳轉到下一個檔案的第一個錯誤。
:cno[remap]     類似於 ":noremap"，但用於命令列模式。
:cnorea[bbrev]  類似於 ":noreabbrev"，但用於命令列模式。
:cnoreme[nu]    類似於 ":noremenu"，但用於命令列模式。
:co[py]         複製行。
:col[der]       跳轉到上一個較老的錯誤清單。
:colo[rscheme]  載入特定的色彩方案。
:com[mand]      建立用戶自定的指令。
:comc[lear]     清除所有用戶自定的指令。
:comp[iler]     為特定編譯器設定選項。
:con[tinue]     回到 :while 開始處。
:conf[irm]      需要確認時，提示用戶。
:cope[n]        開啟 quickfix 視窗。
:cp[revious]    跳轉到上一個錯誤。
:cpf[ile]       跳轉到上一個檔案的最後一個錯誤。
:cq[uit]        退出 Vim，帶錯誤碼。
:cr[ewind]      跳到指定的錯誤，預設為第一個。
:cs[cope]       執行 cscope 指令。
:cst[ag]        使用 cscope 來跳轉到標籤上。
:cu[nmap]       類似於 ":unmap"，但用於命令列模式。
:cuna[bbrev]    類似於 ":unabbrev"，但用於命令列模式。
:cunme[nu]      刪除命令列的選單。
:cw[indow]      開啟或者關閉 quickfix 視窗。
:d[elete]       刪除行。
:delm[arks]     刪除位置標記。
:deb[ug]        在調試模式執行指令。
:debugg[reedy]  從正常的輸入那裡讀取調試模式指令。
:delc[ommand]   刪除用戶自定的指令。
:delf[unction]  刪除用戶函數。
:dif[fupdate]   更新 'diff' 緩衝區。
:diffg[et]      刪除該緩衝區的所有差異。
:diffo[ff]      關閉 diff 模式。
:diffp[atch]    應用補丁然後顯示差異。
:diffpu[t]      刪除另外一個緩衝區的差異。
:diffs[plit]    顯示和另外一個檔案的差異。
:diffthis       使得目前視窗成為 diff 視窗。
:dig[raphs]     顯示或者輸入二合字母。
:di[splay]      顯示暫存器。
:dj[ump]        跳轉到 #define。
:dl[ist]        列出所有的 #define。
:do[autocmd]    在該緩衝區應用自動指令。
:doautoa[ll]    在所有載入的緩衝區上應用自動指令。
:dr[op]         跳到編輯某檔案的視窗，不成功則在目前視窗編輯之。
:ds[earch]      列出一個 #define。
:dsp[lit]       分割視窗並跳轉到 #define。
:e[dit]         編輯檔案。
:ea[rlier]      回到舊的變更，還原。
:ec[ho]         回顯表達式結果。
:echoe[rr]      類似於 :echo，如同錯誤一樣顯示和使用歷史。
:echoh[l]       為 echo 等指令設定高亮 (highlight) 。
:echom[sg]      等同於 :echo，在歷史裡放置消息。
:echon          等同於 :echo，但不留 <EOL>。
:el[se]         :if 指令的一部分。
:elsei[f]       :if 指令的一部分。
:em[enu]        按名字執行選單。
:en[dif]        結束最近的 :if。
:endfo[r]       結束最近的 :for。
:endf[unction]  結束用戶函數。
:endt[ry]       結束最近的 :try。
:endw[hile]     結束最近的 :while。
:ene[w]         編輯新的無名緩衝區。
:ex             等同於 ":edit"。
:exe[cute]      執行表達式的結果產生的字元串。
:exi[t]         等同於 ":xit"。
:exu[sage]      Ex 指令總覽。
:f[ile]         顯示或者設定目前檔名。
:files          列出緩衝區清單的所有檔案。
:filet[ype]     切換檔案類型檢測的開啟/關閉。
:fin[d]         在 'path' 裡找尋檔案並編輯之。
:fina[lly]      :try 指令的一部分。
:fini[sh]       退出 Vim 腳本的執行。
:fir[st]        轉到參數清單的第一個檔案。
:fix[del]       設定 <Del> 的鍵碼。
:fo[ld]         建立摺疊。
:foldc[lose]    關閉摺疊。
:foldd[oopen]   對所有不在關閉摺疊的行執行指令。
:folddoc[losed] 對所有在關閉摺疊的行執行指令。
:foldo[pen]     開啟摺疊。
:for            for 循環。
:fu[nction]     定義用戶函數。
:g[lobal]       對符合的行執行指令。
:go[to]         轉到緩衝區某字節處。
:gr[ep]         執行 'grepprg' 並轉到第一個符合處。
:grepa[dd]      類似 :grep，但附加到目前清單後。
:gu[i]          啟動 GUI。
:gv[im]         啟動 GUI。
:ha[rdcopy]     發送內容到印表機。
:h[elp]         開啟說明視窗。
:helpf[ind]     開啟顯示說明視窗的對話框。
:helpg[rep]     類似於 ":grep"，但搜尋說明檔案。
:helpt[ags]     為一個目錄產生說明標籤。
:hi[ghlight]    指定高亮 (highlight) 方法。
:hid[e]         為一個指令隱藏該緩衝區。
:his[tory]      顯示歷史清單。
:i[nsert]       插入 text。
:ia[bbrev]      類似於 ":abbrev"，但用於插入模式。
:iabc[lear]     類似於 ":abclear"，但用於插入模式。
:if             條件滿足時執行指令。
:ij[ump]        跳轉到標識符號的定義。
:il[ist]        列出符合標識符號的行。
:im[ap]         類似於 ":map"，但用於插入模式。
:imapc[lear]    類似於 ":map"，但用於插入模式。
:ime[nu]        為插入模式增加選單。
:ino[remap]     類似於 ":noremap"，但用於插入模式。
:inorea[bbrev]  類似於 ":noreabbrev"，但用於插入模式。
:inoreme[nu]    類似於 ":noremenu"，但用於插入模式。
:int[ro]        顯示介紹文字。
:is[earch]      列出符合標識符號的一行。
:isp[lit]       分割視窗，並跳轉到標識符號的定義。
:iu[nmap]       類似於 ":unmap"，但用於插入模式。
:iuna[bbrev]    類似於 ":unabbrev"，但用於插入模式。
:iunme[nu]      刪除插入模式的選單。
:j[oin]         連接行。
:ju[mps]        顯示跳轉表。
:k              設定位置標記。
:keepa[lt]      跟隨的指令保持輪換檔案不變。
:kee[pmarks]    跟隨的指令保持位置標記不變。
:keepj[jumps]   跟隨的指令保持跳轉表和位置標記不變。
:lN[ext]        轉到位置清單的上一個位置。
:lNf[ile]       轉到上個檔案的最近一個位置。
:l[ist]         顯示行。
:lad[dexpr]     通過表達式補充位置。
:laddb[uffer]   通過緩衝區補充位置。
:laddf[ile]     把位置加到目前位置清單裡。
:la[st]         轉到參數清單的最後一個檔案。
:lan[guage]     設定語言 (locale)。
:lat[er]        轉到新的變更，重做。
:lb[uffer]      分析位置並跳轉到第一個位置。
:lc[d]          變更本地的目錄。
:lch[dir]       變更本地的目錄。
:lcl[ose]       關閉位置視窗。
:lcs[cope]      類似於 ":cscope"，但使用位置清單。
:le[ft]         左對齊行。
:lefta[bove]    使得分割的視窗出現在左側或者上方。
:let            給變數或選項賦值。
:lex[pr]        從表達式裡讀取位置並跳轉到第一個。
:lf[ile]        從檔案裡讀取位置並跳轉到第一個。
:lfir[st]       轉到指定的位置上，預設第一個。
:lgetb[uffer]   從緩衝區裡讀取位置。
:lgete[xpr]     從表達式裡讀取位置。
:lg[etfile]     從檔案裡讀取位置。
:lgr[ep]        運行 'grepprg' 並跳轉到第一個符合。
:lgrepa[dd]     類似於 :grep，但附加到目前清單上。
:lh[elpgrep]    類似於 ":helpgrep"，但使用位置清單。
:ll             轉到指定位置。
:lla[st]        轉到指定位置，預設最後一個。
:lli[st]        列出所有的位置。
:lmak[e]        執行外部指令 'makeprg' 並分析錯誤訊息。
:lm[ap]         類似於 ":map!"，但包括 Lang-Arg 模式。
:lmapc[lear]    類似於 ":mapclear!"，但包括 Lang-Arg 模式。
:lne[xt]        跳到下一個位置。
:lnew[er]       跳到較新的位置清單。
:lnf[ile]       跳到下一個檔案的第一個位置。
:ln[oremap]     類似於 ":noremap!"，但包括 Lang-Arg 模式。
:loadk[eymap]   載入後面的鍵盤映射表，直到 EOF 為止。
:lo[adview]     從檔案裡為目前視窗載入視圖。
:loc[kmarks]    跟隨的指令保持位置標記不變。
:lockv[ar]      給變數加鎖。
:lol[der]       轉到較舊的位置清單。
:lope[n]        開啟位置視窗。
:lp[revious]    轉到前一個位置。
:lpf[ile]       轉到上一個檔案的最近的位置。
:lr[ewind]      轉到指定的位置，預設第一個。
:ls             列出所有的緩衝區。
:lt[ag]         跳轉到標籤，並把符合的標籤加到位置清單上。
:lu[nmap]       類似於 ":unmap!"，但包括 Lang-Arg 模式。
:lua            執行 |Lua| 指令。
:luad[o]        對每行都執行 Lua 指令。
:luaf[ile]      執行 |Lua| 指令檔。
:lv[imgrep]     在若干檔案裡搜尋模式。
:lvimgrepa[dd]  類似於 :vimgrep，但附加到目前清單。
:lw[indow]      開啟或關閉位置視窗。
:m[ove]         移動行。
:ma[rk]         設定位置標記。
:mak[e]         執行外部指令 'makeprg' 並分析其錯誤訊息。
:map            顯示或者輸入映射。
:mapc[lear]     清除所有普通和可視模式的映射。
:marks          列出所有的位置標記。
:mat[ch]        定義要高亮 (highlight) 顯示的符合的模式。
:me[nu]         輸入新的選單項。
:menut[ranslate] 增加選單翻譯項目。
:mes[sages]     顯示以前顯示的消息。
:mk[exrc]       寫入目前映射和設定到檔案。
:mks[ession]    寫入 session 資訊到檔案。
:mksp[ell]      生成 .spl 拼寫檔案。
:mkv[imrc]      寫入目前映射和設定到檔案。
:mkvie[w]       寫入目前視窗的視圖到檔案。
:mod[e]         顯示或者變更畫面模式。
:mz[scheme]     執行 MzScheme 指令。
:mzf[ile]       執行 MzScheme 指令檔。
:nbc[lose]      關閉目前 Netbeans 會話。
:nb[key]        傳遞一個鍵給 Netbeans。
:nbs[art]       開啟一個新的 Netbeans 會話。
:n[ext]         跳轉到參數清單的下一個檔案。
:new            建立一個新的空白視窗。
:nm[ap]         類似於 ":map"，但使用一般模式。
:nmapc[lear]    清除一般模式的所有映射。
:nme[nu]        為一般模式增加選單。
:nn[oremap]     類似於 ":noremap"，但使用一般模式。
:nnoreme[nu]    類似於 ":noremenu"，但使用一般模式。
:noa[utocmd]    跟隨的指令不啟用自動指令。
:no[remap]      輸入不會被重新映射的映射。
:noh[lsearch]   暫停 'hlsearch' 高亮 (highlight) 。
:norea[bbrev]   輸入不會被重新映射的縮寫。
:noreme[nu]     輸入不會被重新映射的選單。
:norm[al]       執行一般模式的指令。
:nu[mber]       顯示 text 行時給出行號。
:nun[map]       類似於 ":unmap"，但使用一般模式。
:nunme[nu]      刪除一般模式的選單。
:ol[dfiles]     列出 viminfo 檔案中包含位置標記的檔案。
:o[pen]         啟動開啟模式 (沒有實現)。
:om[ap]         類似於 ":map"，但使用操作符等待模式。
:omapc[lear]    刪除操作符等待模式的所有映射。
:ome[nu]        為操作符等待模式增加選單。
:on[ly]         關閉目前視窗，除了目前的視窗以外。
:ono[remap]     類似於 ":noremap"，但使用操作符等待模式。
:onoreme[nu]    類似於 ":noremenu"，但使用操作符等待模式。
:opt[ions]      開啟選項視窗。
:ou[nmap]       類似於 ":unmap"，但使用操作符等待模式。
:ounme[nu]      刪除操作符等待模式的選單。
:ow[nsyntax]    為本視窗設定新的局部語法高亮 (highlight) 。
:p[rint]        顯示行。
:profd[el]      停止剖視 (profile) 函數或腳本。
:prof[ile]      剖視 (profile) 函數或腳本。
:pro[mptfind]   開啟 GUI 對話框進行搜尋。
:promptr[epl]   開啟 GUI 對話框進行搜尋/替代。
:pc[lose]       關閉預覽視窗。
:ped[it]        在預覽視窗編輯檔案。
:pe[rl]         執行 Perl 指令。
:perld[o]       對每行都執行 Perl 指令。
:po[p]          跳轉到標籤棧較舊的項目上。
:pop[up]        根據名字彈出選單。
:pp[op]         在預覽視窗 ":pop"。
:pre[serve]     寫入所有 text 到交換檔案。
:prev[ious]     跳轉到參數清單裡的上一個檔案。
:ps[earch]      類似於 ":ijump"，但在預覽視窗顯示符合。
:pt[ag]         在預覽視窗顯示標籤。
:ptN[ext]       在預覽視窗 |:tNext|。
:ptf[irst]      在預覽視窗 |:trewind|。
:ptj[ump]       在預覽視窗 |:tjump| 和顯示標籤。
:ptl[ast]       在預覽視窗 |:tlast|。
:ptn[ext]       在預覽視窗 |:tnext|。
:ptp[revious]   在預覽視窗 |:tprevious|。
:ptr[ewind]     在預覽視窗 |:trewind|。
:pts[elect]     在預覽視窗 |:tselect| 和顯示標籤。
:pu[t]          插入暫存器的內容到 text。
:pw[d]          顯示目前目錄。
:py3            執行 Python 3 指令。
:python3        同 :py3。
:py3f[ile]      執行 Python 3 指令檔。
:py[thon]       執行 Python 指令。
:pyf[ile]       執行 Python 指令檔。
:q[uit]         退出目前視窗 (如果只有一視窗，則退出 Vim)。
:quita[ll]      退出 Vim。
:qa[ll]         退出 Vim。
:r[ead]         讀入檔案內容。
:rec[over]      從 swap 檔裡還原檔案。
:red[o]         重做一次還原的變更。
:redi[r]        重定向消息到檔案或者暫存器。
:redr[aw]       強迫顯示的重繪。
:redraws[tatus] 強迫狀態列的重繪。
:reg[isters]    顯示暫存器的內容。
:res[ize]       變更目前視窗的高度。
:ret[ab]        變更製表大小。
:retu[rn]       從用戶函數返回。
:rew[ind]       轉到參數清單的第一個檔案。
:ri[ght]        右對齊 text。
:rightb[elow]   使得分割視窗出現在右側或者下方。
:rub[y]         執行 Ruby 指令。
:rubyd[o]       對每行執行 Ruby 指令。
:rubyf[ile]     執行 Ruby 指令檔。
:rund[o]        從檔案裡讀入還原資訊。
:ru[ntime]      執行 'runtimepath' 裡的 vim 腳本。
:rv[iminfo]     讀取 viminfo 檔案。
:s[ubstitute]   尋找和替代 text。
:sN[ext]        分割視窗並轉到參數清單的前一個檔案。
:san[dbox]      在沙盤裡執行指令。
:sa[rgument]    分割視窗並轉到參數清單的某一個檔案。
:sal[l]         為參數清單的每個檔案開啟視窗。
:sav[eas]       用別的名字保存檔案。
:sb[uffer]      分割視窗並轉到緩衝區清單的某一個檔案。
:sbN[ext]       分割視窗並轉到緩衝區清單的前一個檔案。
:sba[ll]        為緩衝區清單的每個檔案開啟視窗。
:sbf[irst]      分割視窗並轉到緩衝區清單的第一個檔案。
:sbl[ast]       分割視窗並轉到緩衝區清單的最後一個檔案。
:sbm[odified]   分割視窗並轉到緩衝區清單的修改過的檔案。
:sbn[ext]       分割視窗並轉到緩衝區清單的後一個檔案。
:sbp[revious]   分割視窗並轉到緩衝區清單的前一個檔案。
:sbr[ewind]     分割視窗並轉到緩衝區清單的第一個檔案。
:scrip[tnames]  列出所有執行過的 Vim 腳本的名字。
:scripte[ncoding]     執行過的 Vim 腳本使用的編碼。
:scs[cope]      分割視窗並執行 cscope 指令。
:se[t]          顯示或設定選項。
:setf[iletype]  設定 'filetype'，除非已經設定過。
:setg[lobal]    顯示或者設定全域選項值。
:setl[ocal]     顯示或者設定本地選項值。
:sf[ind]        分割目前視窗並編輯 'path' 的檔案。
:sfir[st]       分割視窗並轉到參數清單的第一個檔案。
:sh[ell]        切換到 shell。
:sim[alt]       Win32 GUI: 模擬 Windows ALT 鍵。
:sig[n]         操作標號。
:sil[ent]       安靜地運行指令。
:sl[eep]        幾秒內不作任何事。
:sla[st]        分割視窗並轉到參數清單的最後一個檔案。
:sm[agic]       帶 'magic' 的 :substitute。
:sma[p]         類似於 ":map"，但用於選擇模式。
:smapc[lear]    刪除選擇模式所有的映射。
:sme[nu]        增加選擇模式選單。
:sn[ext]        分割視窗並轉到參數清單的下一個檔案。
:sni[ff]        發送請求到 sniff。
:sno[magic]     帶 'nomagic' 的 :substitute。
:snor[emap]     類似於 ":noremap"，但用於選擇模式。
:snoreme[nu]    類似於 ":noremenu"，但用於選擇模式。
:sor[t]         給行排序。
:so[urce]       從檔案裡讀取 Vim 或 Ex 指令。
:spelld[ump]    分割視窗並用正確的單字填充。
:spe[llgood]    增加拼寫的好詞。
:spelli[nfo]    顯示載入的拼寫檔案的資訊。
:spellr[epall]  像上次 |z=| 那樣，但替換所有的壞詞。
:spellu[ndo]    刪除好詞或壞詞。
:spellw[rong]   增加拼字錯誤。
:sp[lit]        分割目前視窗。
:spr[evious]    分割視窗並轉到參數清單的前一個檔案。
:sre[wind]      分割視窗並轉到參數清單的第一個檔案。
:st[op]         暫停編輯器並退回 shell。
:sta[g]         分割視窗並跳轉到標籤上。
:startg[replace] 開始虛擬替換模式。
:startr[eplace] 開始替換模式。
:star[tinsert]  開始插入模式。
:stopi[nsert]   退出插入模式。
:stj[ump]       執行 ":tjump" 並分割視窗。
:sts[elect]     執行 ":tselect" 並分割視窗。
:sun[hide]      等同於 ":unhide"。
:sunm[ap]       類似於 ":unmap"，但用於選擇模式。
:sunme[nu]      刪除選擇模式的選單。
:sus[pend]      等同於 ":stop"。
:sv[iew]        分割視窗並以唯讀模式編輯檔案。
:sw[apname]     顯示目前交換檔案的名字。
:sy[ntax]       語法高亮 (highlight) 。
:sync[bind]     同步滾動綁定。
:t              等同於 ":copy"。
:tN[ext]        跳轉到上一個符合的標籤。
:tabN[ext]      跳到上一個標籤頁。
:tabc[lose]     關閉目前標籤頁。
:tabdo          為每個標籤頁執行指令。
:tabe[dit]      在新標籤頁裡編輯檔案。
:tabf[ind]      尋找 'path' 裡的檔案，在新標籤頁裡編輯之。
:tabfir[st]     轉到第一個標籤頁。
:tabl[ast]      轉到最後一個標籤頁。
:tabm[ove]      把標籤頁移到別的位置。
:tabnew         在新標籤頁裡編輯檔案。
:tabn[ext]      轉到下一個標籤頁。
:tabo[nly]      關閉所有除了目前標籤頁以外的所有標籤頁。
:tabp[revious]  轉到前一個標籤頁。
:tabr[ewind]    轉到第一個標籤頁。
:tabs           列出標籤頁以及裡面包含的內容。
:tab            開啟新視窗時建立新分頁。
:ta[g]          跳轉到標籤上。
:tags           顯示標籤棧的內容。
:tc[l]          執行 Tcl 指令。
:tcld[o]        為每行執行 Tcl 指令。
:tclf[ile]      執行 Tcl 指令檔。
:te[aroff]      撕下一個選單。
:tf[irst]       轉到第一個符合的標籤。
:th[row]        拋出例外。
:tj[ump]        類似於 ":tselect"，只有一個符合時直接跳轉之。
:tl[ast]        跳轉到最後一個符合的標籤。
:tm[enu]        定義選單的工具提示。
:tn[ext]        跳轉到下一個符合的標籤。
:to[pleft]      使得分割的視窗出現在頂部或者最左端。
:tp[revious]    跳轉到上一個符合的標籤。
:tr[ewind]      跳轉到第一個符合的標籤。
:try            執行指令，錯誤或者例外時終止。
:ts[elect]      列出符合的標籤並從中選擇一個。
:tu[nmenu]      刪除選單的工具提示。
:u[ndo]         還原最近的變更。
:undoj[oin]     將下一個變更和上一個還原區塊合併。
:undol[ist]     列出還原樹的葉節點。
:una[bbreviate] 刪除縮寫。
:unh[ide]       為緩衝區清單裡每個載入的檔案開啟視窗。
:unl[et]        刪除變數。
:unlo[ckvar]    給變數解鎖。
:unm[ap]        刪除映射。
:unme[nu]       刪除選單。
:uns[ilent]     非安靜模式執行指令。
:up[date]       如果有修改，寫回緩衝區。
:v[global]      對不符合的行，執行指令。
:ve[rsion]      顯示版本編號和其它資訊。
:verb[ose]      執行指令，過程中設定 'verbose'。
:vert[ical]     使得跟隨的指令垂直分割。
:vim[grep]      在若干檔案裡尋找模式。
:vimgrepa[dd]   類似於 :vimgrep，但附加到目前清單。
:vi[sual]       等同於 ":edit"，但關掉 "Ex" 模式。
:viu[sage]      一般模式指令的總覽。
:vie[w]         以唯讀方式編輯檔案。
:vm[ap]         類似於 ":map"，但使用可視+選擇模式。
:vmapc[lear]    刪除可視+選擇模式所有的映射。
:vme[nu]        為可視+選擇模式增加選單。
:vne[w]         建立新的空白視窗，垂直分割。
:vn[oremap]     類似於 ":noremap"，但使用可視+選擇模式。
:vnoreme[nu]    類似於 ":noremenu"，但使用可視+選擇模式。
:vs[plit]       垂直分割目前視窗。
:vu[nmap]       類似於 ":unmap"，但使用可視+選擇模式。
:vunme[nu]      刪除可視+選擇模式的選單。
:windo          為每個視窗執行指令。
:w[rite]        寫回檔案。
:wN[ext]        寫回檔案，然後跳轉到參數清單的前一個檔案。
:wa[ll]         寫回所有 (變更的) 緩衝區。
:wh[ile]        只要條件滿足，執行循環體。
:wi[nsize]      取得或者設定視窗大小 (已廢棄)。
:winc[md]       執行視窗 (CTRL-W) 指令。
:winp[os]       取得或者設定視窗位置。
:wn[ext]        寫回檔案，然後跳轉到參數清單的下一個檔案。
:wp[revious]    寫回檔案，然後跳轉到參數清單的前一個檔案。
:wq             寫回檔案，然後退出視窗或者 Vim。
:wqa[ll]        寫回所有 (變更的) 緩衝區然後退出 Vim。
:ws[verb]       把動詞通過 IPC 發送給 workshop。
:wu[ndo]        把還原資訊寫入檔案。
:wv[iminfo]     寫入 viminfo 檔。
:x[it]          如果緩衝區被改動，寫入之後退出視窗或者 Vim。
:xa[ll]         等同於 ":wqall"。
:xmapc[lear]    刪除可視模式的所有映射。
:xm[ap]         類似於 ":map"，但使用可視模式。
:xme[nu]        增加可視模式的選單。
:xn[oremap]     類似於 ":noremap"，但使用可視模式。
:xnoreme[nu]    類似於 ":noremenu"，但使用可視模式。
:xu[nmap]       類似於 ":unmap"，但使用可視模式。
:xunme[nu]      刪除可視模式的選單。
:y[ank]         抽出行到暫存器。
:z              顯示一些行。
    EOF
  end
end
