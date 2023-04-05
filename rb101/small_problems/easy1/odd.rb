def is_odd(x)
  if x % 2 != 0 
    puts "true" 
  else
    puts "false"
  end
end 

is_odd(2)  # false
is_odd(-2)  # false
is_odd(3)  # true
is_odd(-3)  # true
is_odd(0)  # false