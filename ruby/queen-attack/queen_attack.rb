class Queens
  attr_reader :white, :black

  def initialize(positions = { white: [0, 3], black: [7, 3] })
    raise ArgumentError if positions[:white] == positions[:black]
    @white = positions[:white]
    @black = positions[:black]
    @board = Array.new(8) { Array.new(8, '_') }
  end

  def to_s
    @board[white.first][white.last] = 'W'
    @board[black.first][black.last] = 'B'
    @board.map { |line| line.join(' ') }.join("\n")
  end

  def attack?
    row_or_column? || diagonal?
  end

  private

  def row_or_column?
    (white + black).uniq.size < 4
  end

  def diagonal?
    (white.first - black.first).abs == (white.last - black.last).abs
  end
end
