def print_in_box(string)
  box_width = string.length + 2
  puts "+" + ("-" * box_width) + "+"
  puts "|" + (" " * box_width) + "|"
  puts "| " + "#{string}" + " |"
  puts "|" + (" " * box_width) + "|"
  puts "+" + ("-" * box_width) + "+"
end

# Futher exploration(truncate)

def print_in_box(string)
  box_width = string.length + 2
  if box_width >= 80
    array = string.chars 
    string = array.values_at(0..77).join
    box_width = 80
  end
  puts "+" + ("-" * box_width) + "+"
  puts "|" + (" " * box_width) + "|"
  puts "| " + "#{string}" + " |"
  puts "|" + (" " * box_width) + "|"
  puts "+" + ("-" * box_width) + "+"
end

# Futher exploration(wrap text)

def print_in_box(string)
  spacer = 2
  box_width = string.length + spacer
  max_width = 80
  array = []

  if box_width >= max_width
    array = string.chars.each_slice(max_width - spacer).map(&:join)
    box_width = 80
  end

  puts horizontal_line = "+" + ("-" * box_width) + "+"
  puts side_pipes = "|" + (" " * box_width) + "|"

  loop do
    if array.size > 1
      counter = array.size
      puts "| " + "#{array.shift}" + " |"
      counter -= 1
    elsif array.size == 1
      remaining_chars = (max_width - array.join.size) - spacer
      puts "| " + "#{array.shift}" + (" " * remaining_chars) + " |"
      break
    else
      puts "| " + "#{string}" + " |"
      break
    end
  end

  puts side_pipes
  puts horizontal_line
end

saying1 = ''
saying2 = "This is a short string."
saying3 = "This is a string that is a little bit longer that the short string."
saying4 = "This string is going to be a lot longer than any of the other strings so that we can cut it off at 80 characters and/or wrap it for the purpose of further exploration and it can just go and go and go and blah, blah, blahditty blah forever!"

print_in_box(saying1)
print_in_box(saying2)
print_in_box(saying3)
print_in_box(saying4)