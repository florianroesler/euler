require "big"

struct BigInt
  def factorial
    return 1 if self == 0
    self * (self - 1).factorial
  end
end

def factorial_digits(number : Int)
  number.to_s.chars.map do |char|
    BigInt.new(char.to_i).factorial
  end.sum
end

def chain_length(number)
  length = 0
  seen_numbers = Set(BigInt).new

  current_number = BigInt.new(number)

  while !seen_numbers.includes?(current_number)
    seen_numbers.add(current_number)
    current_number = factorial_digits(current_number)
    length += 1
  end
  return length
end

def sorted_chars(number)
  number.to_s.chars.sort.join
end

puts sorted_chars(739272)

existing_chains = Hash(String, Int32).new
found_count = 0
(1..1_000_000).each do |number|
  identifier = sorted_chars(number)
  length = existing_chains.fetch(identifier, nil)

  if length.nil?
    existing_chains[identifier] = chain_length(number)
    length = existing_chains[identifier]
  end

  if length == 60
    found_count += 1
    puts "#{number} #{length}"
  end
end

puts found_count
