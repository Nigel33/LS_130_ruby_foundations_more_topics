def zip(array1, array2)
  counter = 0
  final = []
  set = []
  while counter < array1.size
     set << array1[counter] << array2[counter]
     final << set
     set = []
     counter += 1
  end
  p final
end


puts zip([1, 2, 3], [4, 5, 6]) == [[1, 4], [2, 5], [3, 6]]