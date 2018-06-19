def step (initial, ending, step)
  counter = initial
  while counter <= ending
    yield(counter)
    counter += step
  end

end


step(1, 10, 3) { |value| puts "value = #{value}" }