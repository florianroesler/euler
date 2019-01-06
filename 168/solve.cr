require "big"

def rotatable?(n)
  second_last_char = n.char_at(n.size - 2)
  last_char = n.char_at(n.size - 1)
  number = BigFloat.new(n)
  expected = BigFloat.new(last_char + n.rchop)
  result = expected / number

  if result > 1 && result.floor == result
    return result
  end
end

initial_numbers = [] of BigInt
i = 1
while i < 1_000_000
  n = BigInt.new(i) * BigInt.new(1)
  if rotatable?(n.to_s)
    puts n, rotatable?(n.to_s)
    initial_numbers.push(n)
  end

  i += 1
end
#25641
#142857
maximum = BigInt.new(10) ** 100

result = [] of BigInt
iterations = 1
while iterations < 100
  initial_numbers.each do |n|
    new_number = BigInt.new(n.to_s * iterations)
    break if new_number >= maximum

    result.push(new_number) if rotatable?(new_number.to_s)
  end

  iterations += 1
end

puts result.size
puts result.sum

puts result

# i = 10
#
# while i < 1_000_000
#   if rotatable?(i.to_s)
#     puts "#{i} #{rotatable?(i.to_s)}"
#     puts print_details(i)
#   end
#   puts i if i % 1_000_000 == 0
#   i += 1
# end
