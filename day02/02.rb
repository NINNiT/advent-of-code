input = File.read('./input.txt').split("\n")

def check_valid_part1(input)
  correct_password = []
  input.each do |item|
    item_split = item.match(/(^\d*)-(\d*) (\w): (\w*)/)
    min_length = item_split[1].to_i
    max_length = item_split[2].to_i
    letter = item_split[3]
    password = item_split[4]

    letter_count = password.count(letter)

    correct_password.push(password) if letter_count >= min_length && letter_count <= max_length
  end
  p correct_password.count
end

def check_valid_part2(input)
  correct_password = []
  input.each do |item|
    item_split = item.match(/(^\d*)-(\d*) (\w): (\w*)/)
    position_1 = item_split[1].to_i - 1
    position_2 = item_split[2].to_i - 1
    letter = item_split[3]
    password = item_split[4]

    if (password[position_1] == letter && password[position_2] != letter) || (password[position_2] == letter && password[position_1] != letter)
      correct_password.push(password)
    end
  end
  p correct_password.count
end

check_valid_part1(input)
check_valid_part2(input)
