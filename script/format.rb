# Ad-hoc script to transform Vim documentation
puts File.readlines("en2.txt").map {|line|
  line.sub(/^ +|\|[^|]+\| +/, "")
}
