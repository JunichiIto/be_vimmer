# Ad-hoc script to transform Vim documentation
lines = []
File.open "en2.txt" do |file|
    while line = file.gets
      #if /^ {30,}/ =~ line
      #  last_line += " " + line.strip
      #else
      #  lines << last_line
      #  last_line = line.chomp
      #end
      lines << line.sub(/^ +|\|[^|]+\| +/, "")
    end
end

lines.each do |line| puts line end
