# Ad-hoc script to transform Vim documentation
puts File.read("en2.txt").lines.map {|line|
  line.sub(/^ +|\|[^|]+\| +/, "")
}
