# Ad-hoc script to transform Vim documentation
puts File.readlines("en2.txt").map {|line|
  #Please keep these lines. --------
  #if /^ {30,}/ =~ line
  #  last_line += " " + line.strip
  #else
  #  lines << last_line
  #  last_line = line.chomp
  #end
  #---------------------------------
  line.sub(/^ +|\|[^|]+\| +/, "")
}
