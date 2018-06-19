def each(array)
  counter = 0
  loop do
    yield(array[counter])
    counter += 1
    break if counter == array.size
  end
  array
end

array = [1,2,3]
each(array) {|element| puts 'do nothing'}