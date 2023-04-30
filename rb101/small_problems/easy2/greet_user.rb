print "What is your name? "
name = gets.chomp.capitalize

if name.include?('!')
  puts "HELLO #{name.chop.upcase}. WHY ARE WE SCREAMING?"
else
  puts "Hello #{name}."
end

# LS's solution uses if name[-1] == '!' which is much better because that ensures that the last character, and not just any character, is !.

# Further Exploration

print "What is your name? "
name = gets.chomp!.capitalize

if name[-1] == "!"
  puts "HELLO #{name.chop!.upcase}. WHY ARE WE SCREAMING?"
else
  puts "Hello #{name}."
end