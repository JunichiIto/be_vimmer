# encoding: UTF-8
namespace :seed do
  desc "Insert English Descriptions"
  task :insert_en => :environment do
    @lines = <<-EOF.split "\n"
###Insert mode
CTRL-@          insert previously inserted text and stopinsert
CTRL-A          insert previously inserted text
CTRL-B          not used |i_CTRL-B-gone|
CTRL-C          quit insert mode, without checking forabbreviation, unless 'insertmode' set.
CTRL-D          delete one shiftwidth of indent in the currentline
CTRL-E          insert the character which is below the cursor
CTRL-F          not used (but by default it's in 'cinkeys' tore-indent the current line)
CTRL-G CTRL-J   line down, to column where inserting started
CTRL-G j        line down, to column where inserting started
CTRL-G <Down>   line down, to column where inserting started
CTRL-G CTRL-K   line up, to column where inserting started
CTRL-G k        line up, to column where inserting started
CTRL-G <Up>     line up, to column where inserting started
CTRL-G u        start new undoable edit
<BS>            delete character before the cursor
{char1}<BS>{char2}  enter digraph (only when 'digraph' option set)
CTRL-H          same as <BS>
<Tab>           insert a <Tab> character
CTRL-I          same as <Tab>
<NL>            same as <CR>
CTRL-J          same as <CR>
CTRL-K {char1} {char2}i  enter digraph
CTRL-L          when 'insertmode' set: Leave Insert mode
<CR>            begin new line
CTRL-M          same as <CR>
CTRL-N          find next match for keyword in front of thecursor
CTRL-O          execute a single command and return to insertmode
CTRL-P          find previous match for keyword in front ofthe cursor
CTRL-Q          same as CTRL-V, unless used for terminalcontrol flow
CTRL-R {0-9a-z"%#*:=}   insert the contents of a register
CTRL-R CTRL-R {0-9a-z"%#*:=}   insert the contents of a register literally
CTRL-R CTRL-O {0-9a-z"%#*:=}   insert the contents of a register literallyand don't auto-indent
CTRL-R CTRL-P {0-9a-z"%#*:=}   insert the contents of a register literallyand fix indent.
CTRL-S          (used for terminal control flow)
CTRL-T          insert one shiftwidth of indent in currentline
CTRL-U          delete all entered characters in the currentline
CTRL-V {char}   insert next non-digit literally
CTRL-V {number}   insert three digit decimal number as a singlebyte.
CTRL-W          delete word before the cursor
CTRL-X {mode}   enter CTRL-X sub mode, see |i_CTRL-X_index|
CTRL-Y          insert the character which is above the cursor
CTRL-Z          when 'insertmode' set: suspend Vim
<Esc>           end insert mode (unless 'insertmode' set)
CTRL-[          same as <Esc>
CTRL-\ CTRL-N  go to Normal mode
CTRL-\ CTRL-G  go to mode specified with 'insertmode'
CTRL-\ a - z    reserved for extensions
CTRL-\ others   not used
CTRL-]          trigger abbreviation
CTRL-^          toggle use of |:lmap| mappings
CTRL-_          When 'allowrevins' set: change language(Hebrew, Farsi) {only when compiled withthe |+rightleft| feature}
0 CTRL-D        delete all indent in the current line
^ CTRL-D        delete all indent in the current line, restoreit in the next line
<Del>           delete character under the cursor
<Left>          cursor one character left
<S-Left>        cursor one word left
<C-Left>        cursor one word left
<Right>         cursor one character right
<S-Right>       cursor one word right
<C-Right>       cursor one word right
<Up>            cursor one line up
<S-Up>          same as <PageUp>
<Down>          cursor one line down
<S-Down>        same as <PageDown>
<Home>          cursor to start of line
<C-Home>        cursor to start of file
<End>           cursor past end of line
<C-End>         cursor past end of file
<PageUp>        one screenful backward
<PageDown>      one screenful forward
<F1>            same as <Help>
<Help>          stop insert mode and display help window
<Insert>        toggle Insert/Replace mode
<LeftMouse>     cursor at mouse click
<ScrollWheelDown>       move window three lines down
<S-ScrollWheelDown>     move window one page down
<ScrollWheelUp>         move window three lines up
<S-ScrollWheelUp>       move window one page up
<ScrollWheelLeft>       move window six columns left
<S-ScrollWheelLeft>     move window one page left
<ScrollWheelRight>      move window six columns right
<S-ScrollWheelRight>   move window one page right
###CTRL-X submode
CTRL-X CTRL-D   complete defined identifiers
CTRL-X CTRL-E   scroll up
CTRL-X CTRL-F   complete file names
CTRL-X CTRL-I   complete identifiers
CTRL-X CTRL-K   complete identifiers from dictionary
CTRL-X CTRL-L   complete whole lines
CTRL-X CTRL-N   next completion
CTRL-X CTRL-O   omni completion
CTRL-X CTRL-P   previous completion
CTRL-X CTRL-S   spelling suggestions
CTRL-X CTRL-T   complete identifiers from thesaurus
CTRL-X CTRL-Y   scroll down
CTRL-X CTRL-U   complete with 'completefunc'
CTRL-X CTRL-V   complete like in : command line
CTRL-X CTRL-]   complete tags
CTRL-X s        spelling suggestions
###Normal mode
CTRL-@             not used
CTRL-A          2  add N to number at/after cursor
CTRL-B          1  scroll N screens Backwards
CTRL-C             interrupt current (search) command
CTRL-D             scroll Down N lines (default: half a screen)
CTRL-E             scroll N lines upwards (N lines Extra)
CTRL-F          1  scroll N screens Forward
CTRL-G             display current file name and position
<BS>            1  same as "h"
CTRL-H          1  same as "h"
<Tab>           1  go to N newer entry in jump list
CTRL-I          1  same as <Tab>
<NL>            1  same as "j"
CTRL-J          1  same as "j"
CTRL-K             not used
CTRL-L             redraw screen
<CR>            1  cursor to the first CHAR N lines lower
CTRL-M          1  same as <CR>
CTRL-N          1  same as "j"
CTRL-O          1  go to N older entry in jump list
CTRL-P          1  same as "k"
CTRL-Q             (used for terminal control flow)
CTRL-R          2  redo changes which were undone with 'u'
CTRL-S             (used for terminal control flow)
CTRL-T             jump to N older Tag in tag list
CTRL-U             scroll N lines Upwards (default: half ascreen)
CTRL-V             start blockwise Visual mode
CTRL-W {char}      window commands, see |CTRL-W|
CTRL-X          2  subtract N from number at/after cursor
CTRL-Y             scroll N lines downwards
CTRL-Z             suspend program (or start new shell)
CTRL-[ <Esc>       not used
CTRL-\ CTRL-N      go to Normal mode (no-op)
CTRL-\ CTRL-G      go to mode specified with 'insertmode'
CTRL-\ a - z       reserved for extensions
CTRL-\ others      not used
CTRL-]             :ta to ident under cursor
CTRL-^             edit Nth alternate file (equivalent to":e #N")
CTRL-_             not used

<Space>         1  same as "l"
!{motion}{filter}2  filter Nmove text through the {filter}command
!!{filter}      2  filter N lines through the {filter} command
"{a-zA-Z0-9.%#:-"}  use register {a-zA-Z0-9.%#:-"} for nextdelete, yank or put (uppercase to append)({.%#:} only work with put)
#               1  search backward for the Nth occurrence ofthe ident under the cursor
$               1  cursor to the end of Nth next line
%               1  find the next (curly/square) bracket onthis line and go to its match, or go tomatching comment bracket, or go to matchingpreprocessor directive.
{count}%        1  go to N percentage in the file
&               2  repeat last :s
'{a-zA-Z0-9}    1  cursor to the first CHAR on the line withmark {a-zA-Z0-9}
''              1  cursor to the first CHAR of the line wherethe cursor was before the latest jump.
'(              1  cursor to the first CHAR on the line of thestart of the current sentence
')              1  cursor to the first CHAR on the line of theend of the current sentence
'<              1  cursor to the first CHAR of the line wherehighlighted area starts/started in thecurrent buffer.
'>              1  cursor to the first CHAR of the line wherehighlighted area ends/ended in the currentbuffer.
'[              1  cursor to the first CHAR on the line of thestart of last operated text or start of puttext
']              1  cursor to the first CHAR on the line of theend of last operated text or end of puttext
'{              1  cursor to the first CHAR on the line of thestart of the current paragraph
'}              1  cursor to the first CHAR on the line of theend of the current paragraph
(               1  cursor N sentences backward
)               1  cursor N sentences forward
*               1  search forward for the Nth occurrence ofthe ident under the cursor
+               1  same as <CR>
,               1  repeat latest f, t, F or T in oppositedirection N times
-               1  cursor to the first CHAR N lines higher
.               2  repeat last change with count replaced withN
/{pattern}<CR>  1  search forward for the Nth occurrence of{pattern}
/<CR>           1  search forward for {pattern} of last search
0               1  cursor to the first char of the line
1,2,3,4,5,6,7,8,9                  prepend to command to give a count
:               1  start entering an Ex command
{count}:           start entering an Ex command with rangefrom current line to N-1 lines down
;               1  repeat latest f, t, F or T N times
<{motion}       2  shift Nmove lines one 'shiftwidth'leftwards
<<              2  shift N lines one 'shiftwidth' leftwards
={motion}       2  filter Nmove lines through "indent"
==              2  filter N lines through "indent"
>{motion}       2  shift Nmove lines one 'shiftwidth'rightwards
>>              2  shift N lines one 'shiftwidth' rightwards
?{pattern}<CR>  1  search backward for the Nth previousoccurrence of {pattern}
?<CR>           1  search backward for {pattern} of last search
@{a-z}          2  execute the contents of register {a-z}N times
@:                 repeat the previous ":" command N times
@@              2  repeat the previous @{a-z} N times
A               2  append text after the end of the line N times
B               1  cursor N WORDS backward
["x]C           2  change from the cursor position to the endof the line, and N-1 more lines [intobuffer x]; synonym for "c$"
["x]D           2  delete the characters under the cursoruntil the end of the line and N-1 morelines [into buffer x]; synonym for "d$"
E               1  cursor forward to the end of WORD N
F{char}         1  cursor to the Nth occurrence of {char} tothe left
G               1  cursor to line N, default last line
H               1  cursor to line N from top of screen
I               2  insert text before the first CHAR on theline N times
J               2  Join N lines; default is 2
K                  lookup Keyword under the cursor with'keywordprg'
L               1  cursor to line N from bottom of screen
M               1  cursor to middle line of screen
N               1  repeat the latest '/' or '?' N times inopposite direction
O               2  begin a new line above the cursor andinsert text, repeat N times
["x]P           2  put the text [from buffer x] before thecursor N times
Q                  switch to "Ex" mode
R               2  enter replace mode: overtype existingcharacters, repeat the entered text N-1times
["x]S           2  delete N lines [into buffer x] and startinsert; synonym for "cc".
T{char}         1  cursor till after Nth occurrence of {char}to the left
U               2  undo all latest changes on one line
V                  start linewise Visual mode
W               1  cursor N WORDS forward
["x]X           2  delete N characters before the cursor [intobuffer x]
["x]Y              yank N lines [into buffer x]; synonym for"yy"
ZZ                 store current file if modified, and exit
ZQ                 exit current file always
[{char}            square bracket command (see |[| below)
\                  not used
]{char}            square bracket command (see |]| below)
^               1  cursor to the first CHAR of the line
_               1  cursor to the first CHAR N - 1 lines lower
`{a-zA-Z0-9}    1  cursor to the mark {a-zA-Z0-9}
`(              1  cursor to the start of the current sentence
`)              1  cursor to the end of the current sentence
`<              1  cursor to the start of the highlighted area
`>              1  cursor to the end of the highlighted area
`[              1  cursor to the start of last operated textor start of putted text
`]              1  cursor to the end of last operated text orend of putted text
``              1  cursor to the position before latest jump
`{              1  cursor to the start of the current paragraph
`}              1  cursor to the end of the current paragraph
a               2  append text after the cursor N times
b               1  cursor N words backward
["x]c{motion}   2  delete Nmove text [into buffer x] and startinsert
["x]cc          2  delete N lines [into buffer x] and startinsert
["x]d{motion}   2  delete Nmove text [into buffer x]
["x]dd          2  delete N lines [into buffer x]
do              2  same as ":diffget"
dp              2  same as ":diffput"
e               1  cursor forward to the end of word N
f{char}         1  cursor to Nth occurrence of {char} to theright
g{char}            extended commands, see |g| below
h               1  cursor N chars to the left
i               2  insert text before the cursor N times
j               1  cursor N lines downward
k               1  cursor N lines upward
l               1  cursor N chars to the right
m{A-Za-z}          set mark {A-Za-z} at cursor position
n               1  repeat the latest '/' or '?' N times
o               2  begin a new line below the cursor andinsert text, repeat N times
["x]p           2  put the text [from register x] after thecursor N times
q{0-9a-zA-Z"}      record typed characters into named register{0-9a-zA-Z"} (uppercase to append)
q                  (while recording) stops recording
q:                 edit : command-line in command-line window
q/                 edit / command-line in command-line window
q?                 edit ? command-line in command-line window
r{char}         2  replace N chars with {char}
["x]s           2  (substitute) delete N characters [intobuffer x] and start insert
t{char}         1  cursor till before Nth occurrence of {char}to the right
u               2  undo changes
v                  start characterwise Visual mode
w               1  cursor N words forward
["x]x           2  delete N characters under and after thecursor [into buffer x]
["x]y{motion}      yank Nmove text [into buffer x]
["x]yy             yank N lines [into buffer x]
z{char}            commands starting with 'z', see |z| below
{               1  cursor N paragraphs backward
|               1  cursor to column N
}               1  cursor N paragraphs forward
~               2  'tildeop' off: switch case of N charactersunder cursor and move the cursor Ncharacters to the right
~{motion}          'tildeop' on: switch case of Nmove text
<C-End>         1  same as "G"
<C-Home>        1  same as "gg"
<C-Left>        1  same as "b"
<C-LeftMouse>      ":ta" to the keyword at the mouse click
<C-Right>       1  same as "w"
<C-RightMouse>    same as "CTRL-T"
["x]<Del>       2  same as "x"
{count}<Del>       remove the last digit from {count}
<Down>          1  same as "j"
<End>           1  same as "$"
<F1>               same as <Help>
<Help>             open a help window
<Home>          1  same as "0"
<Insert>        2  same as "i"
<Left>          1  same as "h"
<LeftMouse>     1  move cursor to the mouse click position
<MiddleMouse>   2  same as "gP" at the mouse click position
<PageDown>         same as CTRL-F
<PageUp>           same as CTRL-B
<Right>         1  same as "l"
<RightMouse>       start Visual mode, move cursor to the mouseclick position
<S-Down>        1  same as CTRL-F
<S-Left>        1  same as "b"
<S-LeftMouse>      same as "*" at the mouse click position
<S-Right>       1  same as "w"
<S-RightMouse>    same as "#" at the mouse click position
<S-Up>          1  same as CTRL-B
<Undo>          2  same as "u"
<Up>            1  same as "k"
<ScrollWheelDown>       move window three lines down
<S-ScrollWheelDown>     move window one page down
<ScrollWheelUp>         move window three lines up
<S-ScrollWheelUp>       move window one page up
<ScrollWheelLeft>       move window six columns left
<S-ScrollWheelLeft>     move window one page left
<ScrollWheelRight>      move window six columns right
<S-ScrollWheelRight>    move window one page right
###Text objects
a"                 double quoted string
a'                 single quoted string
a(                 same as ab
a)                 same as ab
a<                 "a <>" from '<' to the matching '>'
a>                 same as a<
aB                 "a Block" from "[{" to "]}" (with brackets)
aW                 "a WORD" (with white space)
a[                 "a []" from '[' to the matching ']'
a]                 same as a[
a`                 string in backticks
ab                 "a block" from "[(" to "])" (with braces)
ap                 "a paragraph" (with white space)
as                 "a sentence" (with white space)
at                 "a tag block" (with white space)
aw                 "a word" (with white space)
a{                 same as aB
a}                 same as aB
i"                 double quoted string without the quotes
i'                 single quoted string without the quotes
i(                 same as ib
i)                 same as ib
i<                 "inner <>" from '<' to the matching '>'
i>                 same as i<
iB                 "inner Block" from "[{" and "]}"
iW                 "inner WORD"
i[                 "inner []" from '[' to the matching ']'
i]                 same as i[
i`                 string in backticks without the backticks
ib                 "inner block" from "[(" to "])"
ip                 "inner paragraph"
is                 "inner sentence"
it                 "inner tag block"
iw                 "inner word"
i{                 same as iB
i}                 same as iB
###Window commands
CTRL-W CTRL-B      same as "CTRL-W b"
CTRL-W CTRL-C      same as "CTRL-W c"
CTRL-W CTRL-D      same as "CTRL-W d"
CTRL-W CTRL-F      same as "CTRL-W f"
CTRL-W CTRL-G      same as "CTRL-W g .."
CTRL-W CTRL-H      same as "CTRL-W h"
CTRL-W CTRL-I      same as "CTRL-W i"
CTRL-W CTRL-J      same as "CTRL-W j"
CTRL-W CTRL-K      same as "CTRL-W k"
CTRL-W CTRL-L      same as "CTRL-W l"
CTRL-W CTRL-N      same as "CTRL-W n"
CTRL-W CTRL-O      same as "CTRL-W o"
CTRL-W CTRL-P      same as "CTRL-W p"
CTRL-W CTRL-Q      same as "CTRL-W q"
CTRL-W CTRL-R      same as "CTRL-W r"
CTRL-W CTRL-S      same as "CTRL-W s"
CTRL-W CTRL-T      same as "CTRL-W t"
CTRL-W CTRL-V      same as "CTRL-W v"
CTRL-W CTRL-W      same as "CTRL-W w"
CTRL-W CTRL-X      same as "CTRL-W x"
CTRL-W CTRL-Z      same as "CTRL-W z"
CTRL-W CTRL-]      same as "CTRL-W ]"
CTRL-W CTRL-^      same as "CTRL-W ^"
CTRL-W CTRL-_      same as "CTRL-W _"
CTRL-W +           increase current window height N lines
CTRL-W -           decrease current window height N lines
CTRL-W <           decrease current window width N columns
CTRL-W =           make all windows the same height & width
CTRL-W >           increase current window width N columns
CTRL-W H           move current window to the far left
CTRL-W J           move current window to the very bottom
CTRL-W K           move current window to the very top
CTRL-W L           move current window to the far right
CTRL-W P           go to preview window
CTRL-W R           rotate windows upwards N times
CTRL-W S           same as "CTRL-W s"
CTRL-W T           move current window to a new tab page
CTRL-W W           go to N previous window (wrap around)
CTRL-W ]           split window and jump to tag under cursor
CTRL-W ^           split current window and edit alternatefile N
CTRL-W _           set current window height to N (default:very high)
CTRL-W b           go to bottom window
CTRL-W c           close current window (like |:close|)
CTRL-W d           split window and jump to definition underthe cursor
CTRL-W f           split window and edit file name under thecursor
CTRL-W F           split window and edit file name under thecursor and jump to the line numberfollowing the file name.
CTRL-W g CTRL-]  split window and do |:tjump| to tag undercursor
CTRL-W g ]         split window and do |:tselect| for tagunder cursor
CTRL-W g }         do a |:ptjump| to the tag under the cursor
CTRL-W g f         edit file name under the cursor in a newtab page
CTRL-W g F         edit file name under the cursor in a newtab page and jump to the line numberfollowing the file name.
CTRL-W h           go to Nth left window (stop at first window)
CTRL-W i           split window and jump to declaration ofidentifier under the cursor
CTRL-W j           go N windows down (stop at last window)
CTRL-W k           go N windows up (stop at first window)
CTRL-W l           go to Nth right window (stop at last window)
CTRL-W n           open new window, N lines high
CTRL-W o           close all but current window (like |:only|)
CTRL-W p           go to previous (last accessed) window
CTRL-W q           quit current window (like |:quit|)
CTRL-W r           rotate windows downwards N times
CTRL-W s           split current window in two parts, newwindow N lines high
CTRL-W t           go to top window
CTRL-W v           split current window vertically, new windowN columns wide
CTRL-W w           go to N next window (wrap around)
CTRL-W x           exchange current window with window N(default: next window)
CTRL-W z           close preview window
CTRL-W |           set window width to N columns
CTRL-W }           show tag under cursor in preview window
CTRL-W <Down>      same as "CTRL-W j"
CTRL-W <Up>        same as "CTRL-W k"
CTRL-W <Left>      same as "CTRL-W h"
CTRL-W <Right>    same as "CTRL-W l"
###Normal mode
[ CTRL-D           jump to first #define found in current andincluded files matching the word under thecursor, start searching at beginning ofcurrent file
[ CTRL-I           jump to first line in current and includedfiles that contains the word under thecursor, start searching at beginning ofcurrent file
[#              1  cursor to N previous unmatched #if, #elseor #ifdef
['              1  cursor to previous lowercase mark, on firstnon-blank
[(              1  cursor N times back to unmatched '('
[*              1  same as "[/"
[`              1  cursor to previous lowercase mark
[/              1  cursor to N previous start of a C comment
[D                 list all defines found in current andincluded files matching the word under thecursor, start searching at beginning ofcurrent file
[I                 list all lines found in current andincluded files that contain the word underthe cursor, start searching at beginning ofcurrent file
[P              2  same as "[p"
[[              1  cursor N sections backward
[]              1  cursor N SECTIONS backward
[c              1  cursor N times backwards to start of change
[d                 show first #define found in current andincluded files matching the word under thecursor, start searching at beginning ofcurrent file
[f                 same as "gf"
[i                 show first line found in current andincluded files that contains the word underthe cursor, start searching at beginning ofcurrent file
[m              1  cursor N times back to start of memberfunction
[p              2  like "P", but adjust indent to current line
[s              1  move to the previous misspelled word
[z              1  move to start of open fold
[{              1  cursor N times back to unmatched '{'
[<MiddleMouse>  2  same as "[p"
] CTRL-D           jump to first #define found in current andincluded files matching the word under thecursor, start searching at cursor position
] CTRL-I           jump to first line in current and includedfiles that contains the word under thecursor, start searching at cursor position
]#              1  cursor to N next unmatched #endif or #else
]'              1  cursor to next lowercase mark, on firstnon-blank
])              1  cursor N times forward to unmatched ')'
]*              1  same as "]/"
]`              1  cursor to next lowercase mark
]/              1  cursor to N next end of a C comment
]D                 list all #defines found in current andincluded files matching the word under thecursor, start searching at cursor position
]I                 list all lines found in current andincluded files that contain the word underthe cursor, start searching at cursorposition
]P              2  same as "[p"
][              1  cursor N SECTIONS forward
]]              1  cursor N sections forward
]c              1  cursor N times forward to start of change
]d                 show first #define found in current andincluded files matching the word under thecursor, start searching at cursor position
]f                 same as "gf"
]i                 show first line found in current andincluded files that contains the word underthe cursor, start searching at cursorposition
]m              1  cursor N times forward to end of memberfunction
]p              2  like "p", but adjust indent to current line
]s              1  move to next misspelled word
]z              1  move to end of open fold
]}              1  cursor N times forward to unmatched '}'
]<MiddleMouse>  2  same as "]p"
###Normal mode
g CTRL-A           only when compiled with MEM_PROFILEdefined: dump a memory profile
g CTRL-G           show information about current cursorposition
g CTRL-H           start Select block mode
g CTRL-]           |:tjump| to the tag under the cursor
g#              1  like "#", but without using "\<" and "\>"
g$              1  when 'wrap' off go to rightmost character ofthe current line that is on the screen;when 'wrap' on go to the rightmost characterof the current screen line
g&              2  repeat last ":s" on all lines
g'{mark}        1  like |'| but without changing the jumplist
g`{mark}        1  like |`| but without changing the jumplist
g*              1  like "*", but without using "\<" and "\>"
g0              1  when 'wrap' off go to leftmost character ofthe current line that is on the screen;when 'wrap' on go to the leftmost characterof the current screen line
g8                 print hex value of bytes used in UTF-8character under the cursor
g<                 display previous command output
g?              2  Rot13 encoding operator
g??             2  Rot13 encode current line
g?g?            2  Rot13 encode current line
gD              1  go to definition of word under the cursorin current file
gE              1  go backwards to the end of the previousWORD
gH                 start Select line mode
gI              2  like "I", but always start in column 1
gJ              2  join lines without inserting space
["x]gP          2  put the text [from register x] before thecursor N times, leave the cursor after it
gQ                  switch to "Ex" mode with Vim editing
gR              2  enter Virtual Replace mode
gU{motion}      2  make Nmove text uppercase
gV                 don't reselect the previous Visual areawhen executing a mapping or menu in Selectmode
g]                 :tselect on the tag under the cursor
g^              1  when 'wrap' off go to leftmost non-whitecharacter of the current line that is onthe screen; when 'wrap' on go to theleftmost non-white character of the currentscreen line
ga                 print ascii value of character under thecursor
gd              1  go to definition of word under the cursorin current function
ge              1  go backwards to the end of the previousword
gf                 start editing the file whose name is underthe cursor
gF                 start editing the file whose name is underthe cursor and jump to the line numberfollowing the filename.
gg              1  cursor to line N, default first line
gh                 start Select mode
gi              2  like "i", but first move to the |'^| mark
gj              1  like "j", but when 'wrap' on go N screenlines down
gk              1  like "k", but when 'wrap' on go N screenlines up
gm              1  go to character at middle of the screenline
go              1  cursor to byte N in the buffer
["x]gp          2  put the text [from register x] after thecursor N times, leave the cursor after it
gq{motion}      2  format Nmove text
gr{char}        2  virtual replace N chars with {char}
gs                 go to sleep for N seconds (default 1)
gu{motion}      2  make Nmove text lowercase
gv                 reselect the previous Visual area
gw{motion}      2  format Nmove text and keep cursor
gx                 execute application for file name under thecursor (only with |netrw| plugin)
g@{motion}         call 'operatorfunc'
g~{motion}      2  swap case for Nmove text
g<Down>         1  same as "gj"
g<End>          1  same as "g$"
g<Home>         1  same as "g0"
g<LeftMouse>       same as <C-LeftMouse>
g<MiddleMouse>     same as <C-MiddleMouse>
g<RightMouse>      same as <C-RightMouse>
g<Up>           1  same as "gk"
###Normal mode
z<CR>              redraw, cursor line to top of window,cursor on first non-blank
z{height}<CR>      redraw, make window {height} lines high
z+                 cursor on line N (default line belowwindow), otherwise like "z<CR>"
z-                 redraw, cursor line at bottom of window,cursor on first non-blank
z.                 redraw, cursor line to center of window,cursor on first non-blank
z=                 give spelling suggestions
zA                 open a closed fold or close an open foldrecursively
zC                 close folds recursively
zD                 delete folds recursively
zE                 eliminate all folds
zF                 create a fold for N lines
zG                 mark word as good spelled word
zM                 set 'foldlevel' to zero
zN                 set 'foldenable'
zO                 open folds recursively
zR                 set 'foldlevel' to the deepest fold
zW                 mark word as wrong (bad) spelled word
zX                 re-apply 'foldlevel'
z^                 cursor on line N (default line abovewindow), otherwise like "z-"
za                 open a closed fold, close an open fold
zb                 redraw, cursor line at bottom of window
zc                 close a fold
zd                 delete a fold
ze                 when 'wrap' off scroll horizontally toposition the cursor at the end (right side)of the screen
zf{motion}         create a fold for Nmove text
zg                 mark word as good spelled word
zh                 when 'wrap' off scroll screen N charactersto the right
zi                 toggle 'foldenable'
zj              1  move to the start of the next fold
zk              1  move to the end of the previous fold
zl                 when 'wrap' off scroll screen N charactersto the left
zm                 subtract one from 'foldlevel'
zn                 reset 'foldenable'
zo                 open fold
zr                 add one to 'foldlevel'
zs                 when 'wrap' off scroll horizontally toposition the cursor at the start (leftside) of the screen
zt                 redraw, cursor line at top of window
zv                 open enough folds to view the cursor line
zw                 mark word as wrong (bad) spelled word
zx                 re-apply 'foldlevel' and do "zv"
zz                 redraw, cursor line at center of window
z<Left>            same as "zh"
z<Right>           same as "zl"
###Visual mode
CTRL-\ CTRL-N    stop Visual mode
CTRL-\ CTRL-G    go to mode specified with 'insertmode'
CTRL-C             stop Visual mode
CTRL-G             toggle between Visual mode and Select mode
<BS>            2  Select mode: delete highlighted area
CTRL-H          2  same as <BS>
CTRL-O             switch from Select to Visual mode for onecommand
CTRL-V             make Visual mode blockwise or stop Visualmode
<Esc>              stop Visual mode
CTRL-]             jump to highlighted tag
!{filter}       2  filter the highlighted lines through theexternal command {filter}
:                  start a command-line with the highlightedlines as a range
<               2  shift the highlighted lines one'shiftwidth' left
=               2  filter the highlighted lines through theexternal program given with the 'equalprg'option
>               2  shift the highlighted lines one'shiftwidth' right
A               2  block mode: append same text in all lines,after the highlighted area
C               2  delete the highlighted lines and startinsert
D               2  delete the highlighted lines
I               2  block mode: insert same text in all lines,before the highlighted area
J               2  join the highlighted lines
K                  run 'keywordprg' on the highlighted area
O                  Move horizontally to other corner of area.
Q                  does not start Ex mode
R               2  delete the highlighted lines and startinsert
S               2  delete the highlighted lines and startinsert
U               2  make highlighted area uppercase
V                  make Visual mode linewise or stop Visualmode
X               2  delete the highlighted lines
Y                  yank the highlighted lines
a"                 extend highlighted area with a doublequoted string
a'                 extend highlighted area with a singlequoted string
a(                 same as ab
a)                 same as ab
a<                 extend highlighted area with a <> block
a>                 same as a<
aB                 extend highlighted area with a {} block
aW                 extend highlighted area with "a WORD"
a[                 extend highlighted area with a [] block
a]                 same as a[
a`                 extend highlighted area with a backtickquoted string
ab                 extend highlighted area with a () block
ap                 extend highlighted area with a paragraph
as                 extend highlighted area with a sentence
at                 extend highlighted area with a tag block
aw                 extend highlighted area with "a word"
a{                 same as aB
a}                 same as aB
c               2  delete highlighted area and start insert
d               2  delete highlighted area
gJ              2  join the highlighted lines withoutinserting spaces
gq              2  format the highlighted lines
gv                 exchange current and previous highlightedarea
i"                 extend highlighted area with a doublequoted string (without quotes)
i'                 extend highlighted area with a singlequoted string (without quotes)
i(                 same as ib
i)                 same as ib
i<                 extend highlighted area with inner <> block
i>                 same as i<
iB                 extend highlighted area with inner {} block
iW                 extend highlighted area with "inner WORD"
i[                 extend highlighted area with inner [] block
i]                 same as i[
i`                 extend highlighted area with a backtickquoted string (without the backticks)
ib                 extend highlighted area with inner () block
ip                 extend highlighted area with inner paragraph
is                 extend highlighted area with inner sentence
it                 extend highlighted area with inner tag block
iw                 extend highlighted area with "inner word"
i{                 same as iB
i}                 same as iB
o                  move cursor to other corner of area
r               2  delete highlighted area and start insert
s               2  delete highlighted area and start insert
u               2  make highlighted area lowercase
v                  make Visual mode characterwise or stopVisual mode
x               2  delete the highlighted area
y                  yank the highlighted area
~               2  swap case for the highlighted area
###Command-line editing
CTRL-@          not used
CTRL-A          do completion on the pattern in front of thecursor and insert all matches
CTRL-B          cursor to begin of command-line
CTRL-C          same as <Esc>
CTRL-D          list completions that match the pattern infront of the cursor
CTRL-E          cursor to end of command-line
CTRL-F          default value for 'cedit': opens thecommand-line window; otherwise not used
CTRL-G          not used
<BS>            delete the character in front of the cursor
{char1} <BS> {char2}   enter digraph when 'digraph' is on
CTRL-H          same as <BS>
<Tab>           if 'wildchar' is <Tab>: Do completion onthe pattern in front of the cursor
<S-Tab>         same as CTRL-P
'wildchar'      Do completion on the pattern in front of thecursor (default: <Tab>)
CTRL-I          same as <Tab>
<NL>            same as <CR>
CTRL-J          same as <CR>
CTRL-K {char1} {char2}   enter digraph
CTRL-L          do completion on the pattern in front of thecursor and insert the longest common part
<CR>            execute entered command
CTRL-M          same as <CR>
CTRL-N          after using 'wildchar' with multiple matches:go to next match, otherwise: same as <Down>
CTRL-O          not used
CTRL-P          after using 'wildchar' with multiple matches:go to previous match, otherwise: same as <Up>
CTRL-Q          same as CTRL-V, unless it's used for terminalcontrol flow
CTRL-R {0-9a-z"%#*:= CTRL-F CTRL-P CTRL-W CTRL-A}   insert the contents of a register or objectunder the cursor as if typed
CTRL-R CTRL-R {0-9a-z"%#*:= CTRL-F CTRL-P CTRL-W CTRL-A}   insert the contents of a register or objectunder the cursor literally
CTRL-S          (used for terminal control flow)
CTRL-T          not used
CTRL-U          remove all characters
CTRL-V          insert next non-digit literally, insert threedigit decimal number as a single byte.
CTRL-W          delete the word in front of the cursor
CTRL-X          not used (reserved for completion)
CTRL-Y          copy (yank) modeless selection
CTRL-Z          not used (reserved for suspend)
<Esc>           abandon command-line without executing it
CTRL-[          same as <Esc>
CTRL-\ CTRL-N  go to Normal mode, abandon command-line
CTRL-\ CTRL-G  go to mode specified with 'insertmode',abandon command-line
CTRL-\ a - d    reserved for extensions
CTRL-\ e {expr}   replace the command line with the result of{expr}
CTRL-\ f - z    reserved for extensions
CTRL-\ others   not used
CTRL-]          trigger abbreviation
CTRL-^          toggle use of |:lmap| mappings
CTRL-_          when 'allowrevins' set: change language(Hebrew, Farsi)
<Del>           delete the character under the cursor

<Left>          cursor left
<S-Left>        cursor one word left
<C-Left>        cursor one word left
<Right>         cursor right
<S-Right>       cursor one word right
<C-Right>       cursor one word right
<Up>            recall previous command-line from history thatmatches pattern in front of the cursor
<S-Up>          recall previous command-line from history
<Down>          recall next command-line from history thatmatches pattern in front of the cursor
<S-Down>        recall next command-line from history
<Home>          cursor to start of command-line
<End>           cursor to end of command-line
<PageDown>      same as <S-Down>
<PageUp>        same as <S-Up>
<Insert>        toggle insert/overstrike mode
<LeftMouse>     cursor at mouse click
###EX commands
:!              filter lines or execute an external command
:!!             repeat last ":!" command
:#              same as ":number"
:&              repeat last ":substitute"
:*              execute contents of a register
:<              shift lines one 'shiftwidth' left
:=              print the cursor line number
:>              shift lines one 'shiftwidth' right
:@              execute contents of a register
:@@             repeat the previous ":@"
:N[ext]         go to previous file in the argument list
:P[rint]        print lines
:X              ask for encryption key
:a[ppend]       append text
:ab[breviate]   enter abbreviation
:abc[lear]      remove all abbreviations
:abo[veleft]    make split window appear left or above
:al[l]          open a window for each file in the argumentlist
:am[enu]        enter new menu item for all modes
:an[oremenu]    enter a new menu for all modes that will notbe remapped
:ar[gs]         print the argument list
:arga[dd]       add items to the argument list
:argd[elete]    delete items from the argument list
:arge[dit]      add item to the argument list and edit it
:argdo          do a command on all items in the argument list
:argg[lobal]    define the global argument list
:argl[ocal]     define a local argument list
:argu[ment]     go to specific file in the argument list
:as[cii]        print ascii value of character under the cursor
:au[tocmd]      enter or show autocommands
:aug[roup]      select the autocommand group to use
:aun[menu]      remove menu for all modes
:b[uffer]       go to specific buffer in the buffer list
:bN[ext]        go to previous buffer in the buffer list
:ba[ll]         open a window for each buffer in the buffer list
:bad[d]         add buffer to the buffer list
:bd[elete]      remove a buffer from the buffer list
:be[have]       set mouse and selection behavior
:bel[owright]   make split window appear right or below
:bf[irst]       go to first buffer in the buffer list
:bl[ast]        go to last buffer in the buffer list
:bm[odified]    go to next buffer in the buffer list that hasbeen modified
:bn[ext]        go to next buffer in the buffer list
:bo[tright]     make split window appear at bottom or far right
:bp[revious]    go to previous buffer in the buffer list
:br[ewind]      go to first buffer in the buffer list
:brea[k]        break out of while loop
:breaka[dd]     add a debugger breakpoint
:breakd[el]     delete a debugger breakpoint
:breakl[ist]    list debugger breakpoints
:bro[wse]       use file selection dialog
:bufdo          execute command in each listed buffer
:buffers        list all files in the buffer list
:bun[load]      unload a specific buffer
:bw[ipeout]     really delete a buffer
:c[hange]       replace a line or series of lines
:cN[ext]        go to previous error
:cNf[ile]       go to last error in previous file
:ca[bbrev]      like ":abbreviate" but for Command-line mode
:cabc[lear]     clear all abbreviations for Command-line mode
:caddb[uffer]   add errors from buffer
:cad[dexpr]     add errors from expr
:caddf[ile]     add error message to current quickfix list
:cal[l]         call a function
:cat[ch]        part of a :try command
:cb[uffer]      parse error messages and jump to first error
:cc             go to specific error
:ccl[ose]       close quickfix window
:cd             change directory
:ce[nter]       format lines at the center
:cex[pr]        read errors from expr and jump to first
:cf[ile]        read file with error messages and jump to first
:cfir[st]       go to the specified error, default first one
:cgetb[uffer]   get errors from buffer
:cgete[xpr]     get errors from expr
:cg[etfile]     read file with error messages
:cha[nges]      print the change list
:chd[ir]        change directory
:che[ckpath]    list included files
:checkt[ime]    check timestamp of loaded buffers
:cl[ist]        list all errors
:cla[st]        go to the specified error, default last one
:clo[se]        close current window
:cm[ap]         like ":map" but for Command-line mode
:cmapc[lear]    clear all mappings for Command-line mode
:cme[nu]        add menu for Command-line mode
:cn[ext]        go to next error
:cnew[er]       go to newer error list
:cnf[ile]       go to first error in next file
:cno[remap]     like ":noremap" but for Command-line mode
:cnorea[bbrev]  like ":noreabbrev" but for Command-line mode
:cnoreme[nu]    like ":noremenu" but for Command-line mode
:co[py]         copy lines
:col[der]       go to older error list
:colo[rscheme]  load a specific color scheme
:com[mand]      create user-defined command
:comc[lear]     clear all user-defined commands
:comp[iler]     do settings for a specific compiler
:con[tinue]     go back to :while
:conf[irm]      prompt user when confirmation required
:cope[n]        open quickfix window
:cp[revious]    go to previous error
:cpf[ile]       go to last error in previous file
:cq[uit]        quit Vim with an error code
:cr[ewind]      go to the specified error, default first one
:cs[cope]       execute cscope command
:cst[ag]        use cscope to jump to a tag
:cu[nmap]       like ":unmap" but for Command-line mode
:cuna[bbrev]    like ":unabbrev" but for Command-line mode
:cunme[nu]      remove menu for Command-line mode
:cw[indow]      open or close quickfix window
:d[elete]       delete lines
:delm[arks]     delete marks
:deb[ug]        run a command in debugging mode
:debugg[reedy]  read debug mode commands from normal input
:delc[ommand]   delete user-defined command
:delf[unction]  delete a user function
:dif[fupdate]   update 'diff' buffers
:diffg[et]      remove differences in current buffer
:diffo[ff]      switch off diff mode
:diffp[atch]    apply a patch and show differences
:diffpu[t]      remove differences in other buffer
:diffs[plit]    show differences with another file
:diffthis       make current window a diff window
:dig[raphs]     show or enter digraphs
:di[splay]      display registers
:dj[ump]        jump to #define
:dl[ist]        list #defines
:do[autocmd]    apply autocommands to current buffer
:doautoa[ll]    apply autocommands for all loaded buffers
:dr[op]         jump to window editing file or edit file incurrent window
:ds[earch]      list one #define
:dsp[lit]       split window and jump to #define
:e[dit]         edit a file
:ea[rlier]      go to older change, undo
:ec[ho]         echoes the result of expressions
:echoe[rr]      like :echo, show like an error and use history
:echoh[l]       set highlighting for echo commands
:echom[sg]      same as :echo, put message in history
:echon          same as :echo, but without <EOL>
:el[se]         part of an :if command
:elsei[f]       part of an :if command
:em[enu]        execute a menu by name
:en[dif]        end previous :if
:endfo[r]       end previous :for
:endf[unction]  end of a user function
:endt[ry]       end previous :try
:endw[hile]     end previous :while
:ene[w]         edit a new, unnamed buffer
:ex             same as ":edit"
:exe[cute]      execute result of expressions
:exi[t]         same as ":xit"
:exu[sage]      overview of Ex commands
:f[ile]         show or set the current file name
:files          list all files in the buffer list
:filet[ype]     switch file type detection on/off
:fin[d]         find file in 'path' and edit it
:fina[lly]      part of a :try command
:fini[sh]       quit sourcing a Vim script
:fir[st]        go to the first file in the argument list
:fix[del]       set key code of <Del>
:fo[ld]         create a fold
:foldc[lose]    close folds
:foldd[oopen]   execute command on lines not in a closed fold
:folddoc[losed]   execute command on lines in a closed fold
:foldo[pen]     open folds
:for            for loop
:fu[nction]     define a user function
:g[lobal]       execute commands for matching lines
:go[to]         go to byte in the buffer
:gr[ep]         run 'grepprg' and jump to first match
:grepa[dd]      like :grep, but append to current list
:gu[i]          start the GUI
:gv[im]         start the GUI
:ha[rdcopy]     send text to the printer
:h[elp]         open a help window
:helpf[ind]     dialog to open a help window
:helpg[rep]     like ":grep" but searches help files
:helpt[ags]     generate help tags for a directory
:hi[ghlight]    specify highlighting methods
:hid[e]         hide current buffer for a command
:his[tory]      print a history list
:i[nsert]       insert text
:ia[bbrev]      like ":abbrev" but for Insert mode
:iabc[lear]     like ":abclear" but for Insert mode
:if             execute commands when condition met
:ij[ump]        jump to definition of identifier
:il[ist]        list lines where identifier matches
:im[ap]         like ":map" but for Insert mode
:imapc[lear]    like ":mapclear" but for Insert mode
:ime[nu]        add menu for Insert mode
:ino[remap]     like ":noremap" but for Insert mode
:inorea[bbrev]  like ":noreabbrev" but for Insert mode
:inoreme[nu]    like ":noremenu" but for Insert mode
:int[ro]        print the introductory message
:is[earch]      list one line where identifier matches
:isp[lit]       split window and jump to definition ofidentifier
:iu[nmap]       like ":unmap" but for Insert mode
:iuna[bbrev]    like ":unabbrev" but for Insert mode
:iunme[nu]      remove menu for Insert mode
:j[oin]         join lines
:ju[mps]        print the jump list
:k              set a mark
:keepa[lt]      following command keeps the alternate file
:kee[pmarks]    following command keeps marks where they are
:keepj[umps]    following command keeps jumplist and marks
:lN[ext]        go to previous entry in location list
:lNf[ile]       go to last entry in previous file
:l[ist]         print lines
:lad[dexpr]     add locations from expr
:laddb[uffer]   add locations from buffer
:laddf[ile]     add locations to current location list
:la[st]         go to the last file in the argument list
:lan[guage]     set the language (locale)
:lat[er]        go to newer change, redo
:lb[uffer]      parse locations and jump to first location
:lc[d]          change directory locally
:lch[dir]       change directory locally
:lcl[ose]       close location window
:lcs[cope]      like ":cscope" but uses location list
:le[ft]         left align lines
:lefta[bove]    make split window appear left or above
:let            assign a value to a variable or option
:lex[pr]        read locations from expr and jump to first
:lf[ile]        read file with locations and jump to first
:lfir[st]       go to the specified location, default first one
:lgetb[uffer]   get locations from buffer
:lgete[xpr]     get locations from expr
:lg[etfile]     read file with locations
:lgr[ep]        run 'grepprg' and jump to first match
:lgrepa[dd]     like :grep, but append to current list
:lh[elpgrep]    like ":helpgrep" but uses location list
:ll             go to specific location
:lla[st]        go to the specified location, default last one
:lli[st]        list all locations
:lmak[e]        execute external command 'makeprg' and parseerror messages
:lm[ap]         like ":map!" but includes Lang-Arg mode
:lmapc[lear]    like ":mapclear!" but includes Lang-Arg mode
:lne[xt]        go to next location
:lnew[er]       go to newer location list
:lnf[ile]       go to first location in next file
:ln[oremap]     like ":noremap!" but includes Lang-Arg mode
:loadk[eymap]   load the following keymaps until EOF
:lo[adview]     load view for current window from a file
:loc[kmarks]    following command keeps marks where they are
:lockv[ar]      lock variables
:lol[der]       go to older location list
:lope[n]        open location window
:lp[revious]    go to previous location
:lpf[ile]       go to last location in previous file
:lr[ewind]      go to the specified location, default first one
:ls             list all buffers
:lt[ag]         jump to tag and add matching tags to thelocation list
:lu[nmap]       like ":unmap!" but includes Lang-Arg mode
:lua            execute |Lua| command
:luad[o]        execute Lua command for each line
:luaf[ile]      execute |Lua| script file
:lv[imgrep]     search for pattern in files
:lvimgrepa[dd]  like :vimgrep, but append to current list
:lw[indow]      open or close location window
:m[ove]         move lines
:ma[rk]         set a mark
:mak[e]         execute external command 'makeprg' and parseerror messages
:map            show or enter a mapping
:mapc[lear]     clear all mappings for Normal and Visual mode
:marks          list all marks
:mat[ch]        define a match to highlight
:me[nu]         enter a new menu item
:menut[ranslate]    add a menu translation item
:mes[sages]     view previously displayed messages
:mk[exrc]       write current mappings and settings to a file
:mks[ession]    write session info to a file
:mksp[ell]      produce .spl spell file
:mkv[imrc]      write current mappings and settings to a file
:mkvie[w]       write view of current window to a file
:mod[e]         show or change the screen mode
:mz[scheme]     execute MzScheme command
:mzf[ile]       execute MzScheme script file
:nbc[lose]      close the current Netbeans session
:nb[key]        pass a key to Netbeans
:nbs[art]       start a new Netbeans session
:n[ext]         go to next file in the argument list
:new            create a new empty window
:nm[ap]         like ":map" but for Normal mode
:nmapc[lear]    clear all mappings for Normal mode
:nme[nu]        add menu for Normal mode
:nn[oremap]     like ":noremap" but for Normal mode
:nnoreme[nu]    like ":noremenu" but for Normal mode
:noa[utocmd]    following command don't trigger autocommands
:no[remap]      enter a mapping that will not be remapped
:noh[lsearch]   suspend 'hlsearch' highlighting
:norea[bbrev]   enter an abbreviation that will not beremapped
:noreme[nu]     enter a menu that will not be remapped
:norm[al]       execute Normal mode commands
:nu[mber]       print lines with line number
:nun[map]       like ":unmap" but for Normal mode
:nunme[nu]      remove menu for Normal mode
:ol[dfiles]     list files that have marks in the viminfo file
:o[pen]         start open mode (not implemented)
:om[ap]         like ":map" but for Operator-pending mode
:omapc[lear]    remove all mappings for Operator-pending mode
:ome[nu]        add menu for Operator-pending mode
:on[ly]         close all windows except the current one
:ono[remap]     like ":noremap" but for Operator-pending mode
:onoreme[nu]    like ":noremenu" but for Operator-pending mode
:opt[ions]      open the options-window
:ou[nmap]       like ":unmap" but for Operator-pending mode
:ounme[nu]      remove menu for Operator-pending mode
:ow[nsyntax]    set new local syntax highlight for this window
:pc[lose]       close preview window
:ped[it]        edit file in the preview window
:pe[rl]         execute Perl command
:p[rint]        print lines
:profd[el]      stop profiling a function or script
:prof[ile]      profiling functions and scripts
:pro[mptfind]   open GUI dialog for searching
:promptr[epl]   open GUI dialog for search/replace
:perld[o]       execute Perl command for each line
:po[p]          jump to older entry in tag stack
:pop[up]        popup a menu by name
:pp[op]         ":pop" in preview window
:pre[serve]     write all text to swap file
:prev[ious]     go to previous file in argument list
:ps[earch]      like ":ijump" but shows match in preview window
:pt[ag]         show tag in preview window
:ptN[ext]       |:tNext| in preview window
:ptf[irst]      |:trewind| in preview window
:ptj[ump]       |:tjump| and show tag in preview window
:ptl[ast]       |:tlast| in preview window
:ptn[ext]       |:tnext| in preview window
:ptp[revious]   |:tprevious| in preview window
:ptr[ewind]     |:trewind| in preview window
:pts[elect]     |:tselect| and show tag in preview window
:pu[t]          insert contents of register in the text
:pw[d]          print current directory
:py3            execute Python 3 command
:python3        same as :py3
:py3f[ile]      execute Python 3 script file
:py[thon]       execute Python command
:pyf[ile]       execute Python script file
:q[uit]         quit current window (when one window quit Vim)
:quita[ll]      quit Vim
:qa[ll]         quit Vim
:r[ead]         read file into the text
:rec[over]      recover a file from a swap file
:red[o]         redo one undone change
:redi[r]        redirect messages to a file or register
:redr[aw]       force a redraw of the display
:redraws[tatus]    force a redraw of the status line(s)
:reg[isters]    display the contents of registers
:res[ize]       change current window height
:ret[ab]        change tab size
:retu[rn]       return from a user function
:rew[ind]       go to the first file in the argument list
:ri[ght]        right align text
:rightb[elow]   make split window appear right or below
:rub[y]         execute Ruby command
:rubyd[o]       execute Ruby command for each line
:rubyf[ile]     execute Ruby script file
:rund[o]        read undo information from a file
:ru[ntime]      source vim scripts in 'runtimepath'
:rv[iminfo]     read from viminfo file
:s[ubstitute]   find and replace text
:sN[ext]        split window and go to previous file inargument list
:san[dbox]      execute a command in the sandbox
:sa[rgument]    split window and go to specific file inargument list
:sal[l]         open a window for each file in argument list
:sav[eas]       save file under another name.
:sb[uffer]      split window and go to specific file in thebuffer list
:sbN[ext]       split window and go to previous file in thebuffer list
:sba[ll]        open a window for each file in the buffer list
:sbf[irst]      split window and go to first file in thebuffer list
:sbl[ast]       split window and go to last file in bufferlist
:sbm[odified]   split window and go to modified file in thebuffer list
:sbn[ext]       split window and go to next file in the bufferlist
:sbp[revious]   split window and go to previous file in thebuffer list
:sbr[ewind]     split window and go to first file in thebuffer list
:scrip[tnames]  list names of all sourced Vim scripts
:scripte[ncoding]     encoding used in sourced Vim script
:scs[cope]      split window and execute cscope command
:se[t]          show or set options
:setf[iletype]  set 'filetype', unless it was set already
:setg[lobal]    show global values of options
:setl[ocal]     show or set options locally
:sf[ind]        split current window and edit file in 'path'
:sfir[st]       split window and go to first file in theargument list
:sh[ell]        escape to a shell
:sim[alt]       Win32 GUI: simulate Windows ALT key
:sig[n]         manipulate signs
:sil[ent]       run a command silently
:sl[eep]        do nothing for a few seconds
:sla[st]        split window and go to last file in theargument list
:sm[agic]       :substitute with 'magic'
:sma[p]         like ":map" but for Select mode
:smapc[lear]    remove all mappings for Select mode
:sme[nu]        add menu for Select mode
:sn[ext]        split window and go to next file in theargument list
:sni[ff]        send request to sniff
:sno[magic]     :substitute with 'nomagic'
:snor[emap]     like ":noremap" but for Select mode
:snoreme[nu]    like ":noremenu" but for Select mode
:sor[t]         sort lines
:so[urce]       read Vim or Ex commands from a file
:spelld[ump]    split window and fill with all correct words
:spe[llgood]    add good word for spelling
:spelli[nfo]    show info about loaded spell files
:spellr[epall]  replace all bad words like last |z=|
:spellu[ndo]    remove good or bad word
:spellw[rong]   add spelling mistake
:sp[lit]        split current window
:spr[evious]    split window and go to previous file in theargument list
:sre[wind]      split window and go to first file in theargument list
:st[op]         suspend the editor or escape to a shell
:sta[g]         split window and jump to a tag
:star[tinsert]  start Insert mode
:startg[replace]   start Virtual Replace mode
:startr[eplace]    start Replace mode
:stopi[nsert]   stop Insert mode
:stj[ump]       do ":tjump" and split window
:sts[elect]     do ":tselect" and split window
:sun[hide]      same as ":unhide"
:sunm[ap]       like ":unmap" but for Select mode
:sunme[nu]      remove menu for Select mode
:sus[pend]      same as ":stop"
:sv[iew]        split window and edit file read-only
:sw[apname]     show the name of the current swap file
:sy[ntax]       syntax highlighting
:sync[bind]     sync scroll binding
:t              same as ":copy"
:tN[ext]        jump to previous matching tag
:tabN[ext]      go to previous tab page
:tabc[lose]     close current tab page
:tabdo          execute command in each tab page
:tabe[dit]      edit a file in a new tab page
:tabf[ind]      find file in 'path', edit it in a new tab page
:tabfir[st]     got to first tab page
:tabl[ast]      got to last tab page
:tabm[ove]      move tab page to other position
:tabnew         edit a file in a new tab page
:tabn[ext]      go to next tab page
:tabo[nly]      close all tab pages except the current one
:tabp[revious]  go to previous tab page
:tabr[ewind]    got to first tab page
:tabs           list the tab pages and what they contain
:tab            create new tab when opening new window
:ta[g]          jump to tag
:tags           show the contents of the tag stack
:tc[l]          execute Tcl command
:tcld[o]        execute Tcl command for each line
:tclf[ile]      execute Tcl script file
:te[aroff]      tear-off a menu
:tf[irst]       jump to first matching tag
:th[row]        throw an exception
:tj[ump]        like ":tselect", but jump directly when thereis only one match
:tl[ast]        jump to last matching tag
:tm[enu]        define menu tooltip
:tn[ext]        jump to next matching tag
:to[pleft]      make split window appear at top or far left
:tp[revious]    jump to previous matching tag
:tr[ewind]      jump to first matching tag
:try            execute commands, abort on error or exception
:ts[elect]      list matching tags and select one
:tu[nmenu]      remove menu tooltip
:u[ndo]         undo last change(s)
:undoj[oin]     join next change with previous undo block
:undol[ist]     list leafs of the undo tree
:una[bbreviate]   remove abbreviation
:unh[ide]       open a window for each loaded file in thebuffer list
:unl[et]        delete variable
:unlo[ckvar]    unlock variables
:unm[ap]        remove mapping
:unme[nu]       remove menu
:uns[ilent]     run a command not silently
:up[date]       write buffer if modified
:v[global]      execute commands for not matching lines
:ve[rsion]      print version number and other info
:verb[ose]      execute command with 'verbose' set
:vert[ical]     make following command split vertically
:vim[grep]      search for pattern in files
:vimgrepa[dd]   like :vimgrep, but append to current list
:vi[sual]       same as ":edit", but turns off "Ex" mode
:viu[sage]      overview of Normal mode commands
:vie[w]         edit a file read-only
:vm[ap]         like ":map" but for Visual+Select mode
:vmapc[lear]    remove all mappings for Visual+Select mode
:vme[nu]        add menu for Visual+Select mode
:vne[w]         create a new empty window, vertically split
:vn[oremap]     like ":noremap" but for Visual+Select mode
:vnoreme[nu]    like ":noremenu" but for Visual+Select mode
:vs[plit]       split current window vertically
:vu[nmap]       like ":unmap" but for Visual+Select mode
:vunme[nu]      remove menu for Visual+Select mode
:windo          execute command in each window
:w[rite]        write to a file
:wN[ext]        write to a file and go to previous file inargument list
:wa[ll]         write all (changed) buffers
:wh[ile]        execute loop for as long as condition met
:wi[nsize]      get or set window size (obsolete)
:winc[md]       execute a Window (CTRL-W) command
:winp[os]       get or set window position
:wn[ext]        write to a file and go to next file inargument list
:wp[revious]    write to a file and go to previous file inargument list
:wq             write to a file and quit window or Vim
:wqa[ll]        write all changed buffers and quit Vim
:ws[verb]       pass the verb to workshop over IPC
:wu[ndo]        write undo information to a file
:wv[iminfo]     write to viminfo file
:x[it]          write if buffer changed and quit window or Vim
:xa[ll]         same as ":wqall"
:xmapc[lear]    remove all mappings for Visual mode
:xm[ap]         like ":map" but for Visual mode
:xme[nu]        add menu for Visual mode
:xn[oremap]     like ":noremap" but for Visual mode
:xnoreme[nu]    like ":noremenu" but for Visual mode
:xu[nmap]       like ":unmap" but for Visual mode
:xunme[nu]      remove menu for Visual mode
:y[ank]         yank lines into a register
:z              print some lines
:~              repeat last ":substitute"
EOF

    @lines.each do |line|
      if /^###/ =~ line
        label = line.sub /###/, ""
        @mode = Mode.where(label: label).first_or_create!
      elsif m = /^(?<command>([\x21-\x7e]+ ?)+)(?<desc>.+)/.match(line)
        command = m["command"].strip
        desc = m["desc"].strip
        desc = desc.sub(/^\d +/, "")
        if desc.strip.empty? || /^not used/ =~ desc
          next
        end
        puts "Mode: #{@mode.label} Create Command:#{command} - #{desc}"
        @mode.vim_commands.create! command: command, description: desc, language: 'en'
      end
    end
  end
end
