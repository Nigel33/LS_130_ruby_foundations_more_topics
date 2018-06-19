def missing(array)
  complete = (array.first..array.last).to_a
  counter = 0
  while counter < array.size
    complete.delete(array[counter])
    counter += 1
  end
  complete
end


puts missing([-3, -2, 1, 5]) == [-1, 0, 2, 3, 4]
puts missing([1, 2, 3, 4]) == []
puts  missing([1, 5]) == [2, 3, 4]
puts missing([6]) == []