def divisors(integer)
  array = []
  counter = 1
  while counter <= integer
    array << counter if integer%counter == 0
    counter += 1
  end
  array
end

puts divisors(1) == [1]
puts divisors(7) == [1, 7]
puts divisors(12) == [1, 2, 3, 4, 6, 12]
puts divisors(98) == [1, 2, 7, 14, 49, 98]
puts divisors(99400891) == [1, 9967, 9973, 99400891] #