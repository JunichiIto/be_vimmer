# Ad-hoc script to transform Vim documentation
lines = []
File.open "en2.txt" do |file|
  while line = file.gets
    lines << line.sub(/^ +|\|[^|]+\| +/, "")
  end
end

lines.each do |line| puts line end
