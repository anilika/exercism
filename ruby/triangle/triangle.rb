class TriangleError < StandardError
end

class Triangle
  def initialize(side_one, side_two, side_three)
    @sides = [side_one, side_two, side_three]
    @sides_sum = @sides.inject(:+)
  end

  def kind
    raise TriangleError if @sides.any? { |side| (@sides_sum - side) <= side }
    case @sides.uniq.size
    when 1 then :equilateral
    when 2 then :isosceles
    when 3 then :scalene
    end
  end
end
