# coding: utf-8
@lines = <<-EOF.split "\n"
###挿入モード
CTRL-@          直前に挿入したテキストを挿入し、挿入モードを 終了する。
CTRL-A          直前に挿入したテキストを挿入する。
CTRL-B          未使用 |i_CTRL-B-gone|
###ノーマルモード
CTRL-@             未使用
CTRL-A          2  カーソル位置/カーソルより後ろにある数字に N を加える。
CTRL-B          1  ウィンドウを N 画面上へスクロール。
CTRL-C             現在の(検索)コマンドを中断する。
###ノーマルモード
g CTRL-A           MEM_PROFILEを定義してコンパイルしたときのみメモリプロファイルをダンプする
g CTRL-G           現在のカーソル位置に関する情報を表示。
g CTRL-H           セレクトモードで矩形選択を開始
EOF


@lines.each do |line|
  if /^###/ =~ line
    label = line.sub /###/, ""
    @mode = Mode.where(label: label).first_or_create!
  elsif m = /^(?<command>([\x21-\x7e]+ ?)+)(?<desc>.+)/.match(line)
    command = m["command"].strip
    desc = m["desc"].strip
    desc = desc.sub(/^\d +/, "")
    puts "Mode: #{@mode.label} Create Command:#{command} - #{desc}"
    @mode.vim_commands.create! command: command, description: desc
  end
end
