# Ad-hoc script to transform Vim documentation
lines = []
File.open "en2.txt" do |file|
  file.readlines.each do |line|
    lines << line.sub(/^ +|\|[^|]+\| +/, "")
  end
end

lines.each do |line| puts line end
