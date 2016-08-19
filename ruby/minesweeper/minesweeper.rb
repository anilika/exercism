require 'matrix'
class ValueError < StandardError
end

module Board
  def self.transform(start_board)
    raise ValueError unless check_board(start_board)
    board = start_board.map(&:chars)
    board.each_with_index do |row, r_index|
      row.each_with_index do |char, c_index|
        next unless char == '*'
        each_place(r_index, c_index) do |x, y|
          next if '+-|*'.include?(board[x][y])
          board[x][y] = (board[x][y].to_i + 1).to_s
        end
      end
    end
    board.map(&:join)
  end

  def self.each_place(row_index, column_index)
    ((row_index - 1)..(row_index + 1)).each do |r_index|
      ((column_index - 1)..(column_index + 1)).each do |c_index|
        yield(r_index, c_index)
      end
    end
  end

  def self.check_board(board)
    return false unless board.map(&:size).uniq.size == 1
    board.all? { |row| row.scan(/[^-+]/).empty? || row.scan(/[^ *|]/).empty? }
  end

  private_class_method :each_place
end
