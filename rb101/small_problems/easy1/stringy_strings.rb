def stringy(x)
  string = ''
  loop do
    string << '1' if string.length < x
    string << '0' if string.length < x
    return string if string.length == x
  end
end

#puts stringy(6) == '101010'   # true
#puts stringy(9) == '101010101'   # true
#puts stringy(4) == '1010'   # true
#puts stringy(7) == '1010101'   # true

# Further exploration

def stringz(x, y='1')
  string = ''
  loop do
    string << '0' if y == 0
    string << '1' if string.length < x
    string << '0' if string.length < x
    return string if string.length == x
  end
end

puts stringz(3, 0) == '010'
puts stringz(5, 0)
puts stringz(6) == '101010'   # true
puts stringz(9) == '101010101'   # true
puts stringz(4) == '1010'   # true
puts stringz(7) == '1010101'   # true