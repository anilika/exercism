class Squares
  def initialize(num)
    @nums_range = (0..num)
  end
  
  def square_of_sum
    nums_range.inject(:+) ** 2
  end
  
  def sum_of_squares
    nums_range.inject { |sum, x| sum + x ** 2 }
  end
  
  def difference
    square_of_sum - sum_of_squares
  end
  
  private
  
  attr_reader :nums_range
end
