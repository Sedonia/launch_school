name = 'Bob'
save_name = name
name.upcase!
puts name, save_name

# => BOB
# => BOB

# This outputs 'BOB' for both name and save_name because the string object 'Bob' was mutated in place. 