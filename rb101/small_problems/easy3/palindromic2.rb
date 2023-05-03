def real_palindrome?(string)
  array = string.downcase.scan(/\w/)
  array == array.reverse
end

p real_palindrome?('madam') == true
p real_palindrome?('Madam') == true           # (case does not matter)
p real_palindrome?("Madam, I'm Adam") == true # (only alphanumerics matter)
p real_palindrome?('356653') == true
p real_palindrome?('356a653') == true
p real_palindrome?('123ab321') == false

string = "Madam, I'm Adam"
p string.scan(/\w/)
#=> ["M", "a", "d", "a", "m", "I", "m", "A", "d", "a", "m"]
p string.scan(/\w+/)
#=> ["Madam", "I", "m", "Adam"]