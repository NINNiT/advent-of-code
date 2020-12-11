# input = File.read('./input.txt').split("\n")

class Day05
  @input = []
  @seat_ids = []
  @own_id = nil

  def initialize
    @input = File.read('./input.txt').split("\n")
    @seat_ids = part_1
    @own_seat = part_2
  end

  def part_1
    seat_ids = []
    @input.each do |pass|
      all_rows_binary = pass[0..6]
      all_columns_binary = pass[7..9]

      low_row = 0
      high_row = 127
      final_row = nil

      low_column = 0
      high_column = 7
      final_column = nil

      all_rows_binary.split('').each do |row|
        case row
        when 'F'
          high_row = low_row + (high_row - low_row).div(2)
        when 'B'
          low_row = low_row + (high_row - low_row).div(2) + 1
        end
        final_row = low_row
      end

      all_columns_binary.split('').each do |column|
        case column
        when 'R'
          low_column += (high_column - low_column).div(2) + 1
        when 'L'
          high_column = low_column + (high_column - low_column).div(2)
        end
        final_column = high_column
      end
      seat_ids.push(final_row * 8 + final_column)
    end
    p seat_ids.max
    seat_ids
  end

  def part_2
    own_id = ((@seat_ids.min..@seat_ids.max).to_a - @seat_ids).first
    p own_id
    own_id
  end
end

Day05.new
