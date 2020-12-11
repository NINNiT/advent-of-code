input = File.read('./input.txt').split.map(&:to_i)

input.combination(2).select do |a,b|
  p a * b if a + b == 2020
end

input.combination(3).select do |a,b,c|
  p a * b * c if a + b + c == 2020
end
