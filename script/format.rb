# Ad-hoc script to transform Vim documentation
lines = File.read("en2.txt").lines.map do |line|
  line.sub(/^ +|\|[^|]+\| +/, "")
end

lines.each do |line| puts line end
