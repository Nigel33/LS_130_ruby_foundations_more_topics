array = %w(raven finch, hawk eagle)
def splat(birds)
  yield(birds)
end

splat(array) {|_, _, *raptors| puts "#{raptors.join(', ')}" }