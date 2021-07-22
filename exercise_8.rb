# Write a short program that reads its own source code 
# (search Stack Overflow to find out how to get the name of the currently executed file) and prints it on the screen.

puts __FILE__

text = File.readlines(__FILE__).map do |line|
  puts line
end