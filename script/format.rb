# Ad-hoc script to transform Vim documentation
lines = []
File.read("en2.txt").lines.each do |line|
  lines << line.sub(/^ +|\|[^|]+\| +/, "")
end

lines.each do |line| puts line end
