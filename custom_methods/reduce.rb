def reduce(array, initial = 0)
  counter = 0
  accumulator = initial
  while counter < array.size
    accumulator = yield(accumulator, array[counter])
    counter += 1
  end
  p accumulator

end

array = [1, 2, 3, 4, 5]

reduce(array) { |acc, num| acc + num }                    # => 15
reduce(array, 10) { |acc, num| acc + num }                # => 25
reduce(array) { |acc, num| acc + num if num.odd? }        # => NoMethodError: undefined method `+' for nil:NilClass