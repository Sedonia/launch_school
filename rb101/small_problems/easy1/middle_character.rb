def center_of(string)
  size = string.size
  if size % 2 == 0
    middle = string.size / 2
    return string[middle - 1, 2]
  else
    middle = (size / 2)
    characters = string[middle]
    return characters
  end
end

p center_of('I love ruby') == 'e'
p center_of('Launch School') == ' '
p center_of('Launch') == 'un'
p center_of('Launchschool') == 'hs'
p center_of('x') == 'x'