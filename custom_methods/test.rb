array = [1, 2, 3, 4, 5]

def reduce(collection, accumulator = 0)
  beginning = accumulator
  final = 0
  counter = 0
  while counter < collection.size
    p final
    final = yield(final, collection[counter])
    counter += 1
  end
  p (beginning + final)
end

# reduce(array) { |acc, num| acc + num }                    # => 15
reduce(array, 10) { |acc, num| acc + num }                # => 25
# reduce(array) { |acc, num| acc + num if num.odd? }