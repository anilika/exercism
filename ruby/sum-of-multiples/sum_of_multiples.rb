class SumOfMultiples
  def initialize(*args)
    @dividers = *args
  end

  def to(end_num)
    (0...end_num).select do |char|
      @dividers.any? { |divider| (char % divider).zero? }
    end.inject(:+)
  end
end
