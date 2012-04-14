# encoding: UTF-8
namespace :seed do
  desc "Insert Japanese submode Descriptions"
  task :insert_submode_jp => :environment do
    @lines = <<-EOF.split "\n"
###サブモード
CTRL-X CTRL-D   定義済みの識別子を補完。
CTRL-X CTRL-E   ウィンドウを上へスクロール。
CTRL-X CTRL-F   ファイル名を補完。
CTRL-X CTRL-I   識別子を補完。
CTRL-X CTRL-K   辞書の識別子を補完。
CTRL-X CTRL-L   行全体を補完。
CTRL-X CTRL-N   次の補完候補。
CTRL-X CTRL-O   オムニ補完
CTRL-X CTRL-P   前の補完候補。
CTRL-X CTRL-S   スペリング補完
CTRL-X CTRL-T   類語による補完
CTRL-X CTRL-Y   ウィンドウを下へスクロール。
CTRL-X CTRL-U   'completefunc'による補完
CTRL-X CTRL-V   コマンドラインと同様な補完
CTRL-X CTRL-]   タグを補完。
CTRL-X s        スペリング補完
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
        @mode.vim_commands.create! command: command, description: desc, language: 'jp'
      end
    end
  end
end
