odd = (1..99).to_a
odd.each { |num| puts num if num.odd?}

# Further Exploration

1.upto(99) { |i| puts i if (i % 2 != 0) }