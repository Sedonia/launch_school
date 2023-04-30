even = (1..99).to_a
even.each { |num| puts num if num.even?}

# Another way

1.upto(99) { |i| puts i if (i % 2 == 0) }