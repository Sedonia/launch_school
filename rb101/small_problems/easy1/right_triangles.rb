def triangle(num)
  counter = 0
  num.times do
    counter += 1
    puts ("*" * counter).rjust(num)
  end
end

triangle(9)

# Further exploration (upside down)

def triangle(num)
  counter = num
  num.times do
    counter -= 1
    puts ("*" * counter).rjust(num)
  end
end

triangle(9)

# Further exploration (display triangle with right angle at any corner of the grid)
# Options: top left (TL), top right (TR), bottom left (BL), bottom right (BR)

def triangle(num, corner)
  counter = 0
  case corner
  when "BR"
    num.times do
      counter += 1
      puts ("*" * counter).rjust(num)
    end
  when "TR"
    counter = num
    num.times do
      counter -= 1
      puts ("*" * counter).rjust(num)
    end
  when "BL"
    num.times do
      counter += 1
      puts ("*" * counter).ljust(num)
    end
  when "TL"
    counter = num
    num.times do
      counter -= 1
      puts ("*" * counter).ljust(num)
    end
  end
end

triangle(5, "TL")
triangle(5, "TR")
triangle(5, "BL")
triangle(5, "BR")