items = ['apples', 'corn', 'cabbage', 'wheat']

def gather(items)
  puts "Let's start gathering food."
  yield(items)
  puts "We've finished gathering!"
end

gather(items) do |*fruits, wheat|
  puts fruits.join(', ')
  puts wheat
end

gather(items) do |fruit, *ground, paddy|
  puts fruit
  puts ground.join(", ")
  puts paddy
end