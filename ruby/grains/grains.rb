class Grains
  BOARD_SQUARES = (1..64)

  def self.square(number)
    2**(number - 1)
  end

  def self.total
    BOARD_SQUARES.inject { |sum, num| sum + square(num) }
  end
end
