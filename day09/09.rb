PREAMBLE_LENGTH = 25

input = File.read('./input.txt').split.map(&:to_i)
invalid_num = nil

(PREAMBLE_LENGTH..input.size - 1).each do |idx|
  invalid_num = input[idx] unless
    input[idx - PREAMBLE_LENGTH..idx].uniq.combination(2).detect { |a, b| a + b == input[idx] }
end

p invalid_num

(2..input.size).each do |idx|
  input.each_cons(idx) do |c|
    p(c.min + c.max) if c.reduce(:+) == invalid_num
  end
end
