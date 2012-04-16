# Ad-hoc script to transform Vim documentation
lines = File.read("en2.txt").lines.map {|line|
  line.sub(/^ +|\|[^|]+\| +/, "")
}

lines.each do |line| puts line end
